# Module parameters
variable "api_endpoints" {
  description = "API external endpoint"
  type        = "list"
  default     = []
}

##################
# Kuebrnetes related variables
variable "cluster_domain" {
  type    = "string"
  default = ""
}

variable "k8s_service" {
  type        = "string"
  description = "Kubernetes service name"
  default     = ""
}

variable "k8s_namespace" {
  description = "Kubernetes services namespace"
  type        = "string"
  default     = ""
}

##################
# Service variables
variable "host" {
  type    = "string"
  default = ""
}

variable "service_proto" {
  type    = "string"
  default = "http"
}

variable "service_port" {
  type    = "string"
  default = 80
}

variable "service_path" {
  type    = "string"
  default = "/"
}

variable "connect_timeout" {
  default = 60000
}

variable "write_timeout" {
  default = 60000
}

variable "read_timeout" {
  default = 60000
}

variable "retries" {
  default = 5
}

##################
# Route variables
variable "route_protocols" {
  type    = "list"
  default = ["http", "https"]
}

variable "route_paths" {
  type = "list"
}

variable "route_methods" {
  type    = "list"
  default = []
}

variable "route_strip_path" {
  default = false
}

variable "route_preserve_host" {
  default = false
}

##################
# Plugins variables
variable "enabled_plugins" {
  type = "list"
}

variable "cors_config" {
  type = "map"

  default = {
    origins = "*"
  }
}

variable "jwt_config" {
  type = "map"

  default = {
    uri_param_names = "jwt"
    key_claim_name  = "iss"
  }
}

variable "basic_auth_config" {
  type = "map"

  default = {
    hide_credentials = "true"
  }
}

variable "basic_auth_user" {
  type    = "map"
  default = {}
}
