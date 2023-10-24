module "services" {
  source = "./modules/services"
}

module "iam-tim-serena-project-viewer" {
  source         = "./modules/iam"
  GCP_PROJECT_ID = var.GCP_PROJECT_ID

  depends_on = [module.services]
}

