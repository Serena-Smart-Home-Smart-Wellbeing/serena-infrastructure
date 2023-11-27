variable "jwt-access-secret" {
  type = string
}

variable "serena-main-sql-connection" {
  type = string
}

variable "serena-backend-sa-email" {
  type = string
}

variable "serena-main-sql-connection-accessors" {
  type = set(string)
}

variable "spotify-api-accessors" {
  type = set(string)
}

variable "spotify-client-id" {
  type = string
}

variable "spotify-client-secret" {
  type = string
}
