module "services" {
  source = "./modules/services"
}

module "iam" {
  depends_on     = [module.services]
  source         = "./modules/iam"
  GCP_PROJECT_ID = var.GCP_PROJECT_ID

}

module "cloud-storage" {
  depends_on               = [module.services]
  source                   = "./modules/cloud-storage"
  GCP_REGION               = var.GCP_REGION
  serena-notebook-sa-email = module.iam.serena-notebook-sa-email
}

module "netowrk" {
  depends_on = [module.services]
  source     = "./modules/network"
  GCP_REGION = var.GCP_REGION
}

module "compute-engine" {
  depends_on = [module.services, module.iam, module.cloud-storage, module.netowrk]
  source     = "./modules/compute-engine"
}

module "emotion-detector-nb" {
  source                       = "./modules/vertex-ai"
  emotion-detector-nb-sa-email = module.iam.serena-notebook-sa-email
  network                      = module.netowrk.serena-net.name
  subnet                       = module.netowrk.serena-subnet-asia-southeast2.name

}
