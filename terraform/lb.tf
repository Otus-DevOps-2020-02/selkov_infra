#Правило обработки трафика
resource "google_compute_global_forwarding_rule" "default" {
  name       = "global-rule"
  target     = google_compute_target_http_proxy.default.self_link
  port_range = "80"
}

#Целевой прокси сервер
resource "google_compute_target_http_proxy" "default" {
  name        = "target-proxy"
  description = "target proxy"
  url_map     = google_compute_url_map.default.self_link
}

resource "google_compute_url_map" "default" {
  name            = "url-map"
  description     = "url map"
  default_service = google_compute_backend_service.default.self_link

  host_rule {
    hosts        = ["*"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.default.self_link

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.default.self_link
    }
  }
}

#Ссылка с балансера на группу инстансов
resource "google_compute_backend_service" "default" {
  name        = "backend"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10

  health_checks = [google_compute_health_check.tcp-health-check.self_link]

  backend {
    group = google_compute_instance_group_manager.app-group.instance_group
  }
}

#Проверка состояния инстансов в группе
resource "google_compute_health_check" "tcp-health-check" {
  name               = "tcp-health-check"
  #request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1

  tcp_health_check {
    port = "9292"
  }
}

#Группа инстансов обслуживающих балансировщик
resource "google_compute_instance_group_manager" "app-group" {
  name        = "app-group"
  description = "group of instances"

  base_instance_name = "app"
  zone = var.zone

  instance_template = google_compute_instance_template.app-template.self_link

  target_size = 2

  named_port {
    name = "http"
    port = "9292"
  }
}

#Шаблон VM
resource "google_compute_instance_template" "app-template" {
  name_prefix  = "appserver-"
  machine_type = "f1-micro"
  region       = var.region
  tags         = ["reddit-app"]

  disk {
    source_image = "reddit-full-1585568729"
    auto_delete  = true
    boot         = true
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}
