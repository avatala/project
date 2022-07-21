/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */



variable "sa_roles_project1" {
  description = "enter the required roles for the service account"
  type =list(string)
  default = ["viewer", "editor"]
}


module "project1" {
  source                      = "../../modules/single_project"
  impersonate_service_account = var.impersonate_service_account
  shared_project_id           = var.shared_project_id
  vpc_network_name            = var.vpc_network_name
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = var.parent_folder_id #(if you need project to create under the new folder, pass this field (google_folder.env.id) instead of var.parent_folder_id and uncomment the folders.tf resource block and pass the parent folder ID in common.auto.tfvars, under which this new folder is going to create)
  environment                 = var.environment
  vpc_type                    = var.vpc_type
  alert_spent_percents        = var.alert_spent_percents
  alert_pubsub_topic          = var.alert_pubsub_topic
  budget_amount               = var.budget_amount
  project_prefix              = var.project_prefix
  project_code                = var.project_code
  enable_hub_and_spoke        = var.enable_hub_and_spoke
  sa_roles                    = ["roles/secretmanager.secretAccessor"]
  enable_cloudbuild_deploy    = var.enable_cloudbuild_deploy
  project_type      = var.project_type
  activate_apis = [
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "servicenetworking.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "cloudbuild.googleapis.com",
    "storage-api.googleapis.com",
    "monitoring.googleapis.com",
    "secretmanager.googleapis.com",
    "cloudkms.googleapis.com",
    "container.googleapis.com"
  ]

  # Metadata
  project_suffix    = "cloud-run"
  application_name  = "${var.environment}-${var.project_type}"
  billing_code      = "5849"
  primary_contact   = "marc-tomlinson"
  secondary_contact = "nigel-walker"
  
}


resource "google_monitoring_monitored_project" "primary" {
  metrics_scope = "locations/global/metricsScopes/${var.central_monitoring_project}"
  name          = "locations/global/metricsScopes/${var.central_monitoring_project}/projects/${module.project1.project_id}"
  provider      = google-beta
}

resource "google_service_account" "project1" {
  project      = module.project1.project_id
  account_id   = "sa-cloud-run"
  display_name = "sa with owner access"
}



resource "google_project_iam_member" "project_sa_roles" {
  for_each = toset(var.sa_roles_project1)
  project  = module.project1.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.project1.email}"
}

resource "random_string" "bucket_name" {
  length  = 5
  upper   = false
  number  = true
  lower   = true
  special = false
}

module "gcs_buckets" {

  source             = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version            = "~> 1.7"
  project_id         = module.project1.project_id
  location           = var.location_gcs
  name               = "${var.gcs_bucket_prefix}-${module.project1.project_id}-${random_string.bucket_name.result}"
  bucket_policy_only = true
}