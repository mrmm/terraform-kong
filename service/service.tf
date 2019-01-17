locals {
  constructed_host = "${var.k8s_service}.${var.k8s_namespace}.svc.${var.cluster_domain}"
  name             = "${var.k8s_service}-${var.k8s_namespace}"
}

resource "kong_service" "service" {
  # Let's define service attributes
  name            = "${local.name}"
  protocol        = "${var.service_proto}"
  host            = "${var.host == "" ? local.constructed_host : var.host }"
  port            = "${var.service_port}"
  path            = "${var.service_path}"
  retries         = "${var.retries}"
  connect_timeout = "${var.connect_timeout}"
  write_timeout   = "${var.write_timeout}"
  read_timeout    = "${var.read_timeout}"
}
