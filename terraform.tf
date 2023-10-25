terraform {
  cloud {
    organization = "Serena-Smart-Home-Smart-Wellbeing"
    workspaces {
      name = "Serena-GCP"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.1.0"
    }
  }

  required_version = "~> 1.6.0"
}


