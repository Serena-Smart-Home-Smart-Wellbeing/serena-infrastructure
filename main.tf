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
  network                      = module.netowrk.serena-net.self_link
  subnet                       = module.netowrk.serena-subnet-asia-southeast2.self_link

}

module "serena-db-mysql" {
  depends_on          = [module.services, ]
  source              = "./modules/serena-db-mysql"
  sql_user_1_name     = var.sql_user_1_name
  sql_user_1_password = var.sql_user_1_password
  region              = var.GCP_REGION
  vpc_name            = module.netowrk.serena-net.self_link
}

module "secret-manager" {
  depends_on                 = [module.services, module.iam]
  source                     = "./modules/secret-manager"
  jwt-access-secret          = var.jwt-access-secret
  serena-main-sql-connection = var.serena-main-sql-connection
  serena-main-sql-connection-accessors = [
    "serviceAccount:${module.iam.serena-backend-sa-email}",
    "serviceAccount:${module.iam.serena-cloud-build-sa-email}",
  ]
  serena-backend-sa-email = module.iam.serena-backend-sa-email
}

import {
  to = module.artifact-registry.google_artifact_registry_repository.cloud-run-source-deploy
  id = "projects/${var.GCP_PROJECT_ID}/locations/${var.GCP_REGION}/repositories/cloud-run-source-deploy"
}

module "artifact-registry" {
  depends_on = [module.services, module.iam]
  source     = "./modules/artifact-registry"
  location   = var.GCP_REGION
  cloud-run-source-deploy-admins = [
    "serviceAccount:${module.iam.serena-cloud-build-sa-email}",
    "user:c200bsy3485@bangkit.academy",
    "user:mreyhanapwsw@gmail.com"
  ]
}

import {
  to = module.cloud-run.google_cloud_run_service.serena-backend
  id = "locations/${var.GCP_REGION}/namespaces/${var.GCP_PROJECT_ID}/services/serena-backend"
}

module "cloud-run" {
  depends_on              = [module.services, module.iam, module.artifact-registry]
  source                  = "./modules/cloud-run"
  location                = var.GCP_REGION
  serena-backend-sa-email = module.iam.serena-backend-sa-email
}



module "cloud-build" {
  depends_on               = [module.services, module.iam, module.cloud-run]
  source                   = "./modules/cloud-build"
  location                 = var.GCP_REGION
  serena-cloud-build-sa-id = module.iam.serena-cloud-build-sa-id
}

import {
  to = module.cloud-build.google_cloudbuild_trigger.serena-backend-github-trigger
  id = module.cloud-build.google_cloudbuild_trigger.serena-backend-github-trigger.id
}
