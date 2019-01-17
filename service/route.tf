resource "kong_route" "route" {
  protocols     = "${var.route_protocols}"
  methods       = "${var.route_methods}"
  hosts         = "${var.api_endpoints}"
  paths         = "${var.route_paths}"
  strip_path    = "${var.route_strip_path}"
  preserve_host = "${var.route_preserve_host}"
  service_id    = "${kong_service.service.id}"
}
