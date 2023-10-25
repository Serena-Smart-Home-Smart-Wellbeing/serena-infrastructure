module "services" {
  source = "./modules/services"
}

module "iam" {
  depends_on     = [module.services]
  source         = "./modules/iam"
  GCP_PROJECT_ID = var.GCP_PROJECT_ID

}

module "cloud-storage" {
  depends_on = [module.services]
  source     = "./modules/cloud-storage"
  GCP_REGION = var.GCP_REGION
}

