locals {
  cors_plugin       = "cors"
  jwt_plugin        = "jwt"
  basic_auth_plugin = "basic-auth"
}

resource "kong_plugin" "cors" {
  count = "${contains(var.enabled_plugins, local.cors_plugin) ? 1 : 0 }"

  name       = "${local.cors_plugin}"
  config     = "${var.cors_config}"
  service_id = "${kong_service.service.id}"
}

resource "kong_plugin" "jwt" {
  count = "${contains(var.enabled_plugins, local.jwt_plugin) ? 1 : 0 }"

  name       = "${local.jwt_plugin}"
  config     = "${var.jwt_config}"
  service_id = "${kong_service.service.id}"
}

resource "kong_plugin" "basic_auth" {
  count = "${contains(var.enabled_plugins, local.basic_auth_plugin) ? 1 : 0 }"

  name       = "${local.basic_auth_plugin}"
  config     = "${var.basic_auth_config}"
  service_id = "${kong_service.service.id}"
}

resource "kong_consumer" "basic_auth_consumers" {
  count    = "${contains(var.enabled_plugins, local.basic_auth_plugin) ? 1 : 0 }"
  username = "${element(keys(var.basic_auth_user), 0)}"
}

resource "kong_consumer_plugin_config" "basic_auth_config" {
  count       = "${contains(var.enabled_plugins, local.basic_auth_plugin) ? length(keys(var.basic_auth_user)) : 0 }"
  consumer_id = "${element(keys(var.basic_auth_user), 1)}"
  plugin_name = "basic-auth"

  config_json = <<EOF
  {
	    "username": "${element(keys(var.basic_auth_user), 1)}",
	    "password": "${element(values(var.basic_auth_user), 1)}"
	}
EOF
}
