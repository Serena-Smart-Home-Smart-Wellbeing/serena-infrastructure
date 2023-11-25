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
