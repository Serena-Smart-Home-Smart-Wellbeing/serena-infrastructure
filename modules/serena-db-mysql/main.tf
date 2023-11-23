resource "google_sql_database_instance" "serena-main" {
  name             = "serena-main"
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier              = "db-f1-micro"
    availability_type = "REGIONAL"
    backup_configuration {
      enabled            = true
      binary_log_enabled = true
    }
    disk_autoresize = true
    disk_size       = 10
    ip_configuration {
      ipv4_enabled                                  = true
      private_network                               = var.vpc_name
      enable_private_path_for_google_cloud_services = true

      dynamic "authorized_networks" {
        for_each = [
          {
            name : "all",
            value : "0.0.0.0/0"
          }
        ]
        iterator = networks

        content {
          name  = networks.value.name
          value = networks.value.value
        }
      }
    }

  }
}

resource "google_sql_user" "sql_user_1" {
  name     = var.sql_user_1_name
  password = var.sql_user_1_password
  instance = google_sql_database_instance.serena-main.name
}


resource "google_sql_database" "serena_db" {
  name     = "serena_db"
  instance = google_sql_database_instance.serena-main.name
}
