/**
 * Copyright 2021 Google LLC
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




output "base_shared_vpc_project" {
  description = "Project sample base project."
  value       = module.project1.project_id
}

# output "app_folder_id" {
#     value = resource.google_folder.env.id
#     description = "app folder ID"
  
# }

output "base_shared_vpc_project_sa" {
  description = "Project sample base project SA."
  value       = module.project1.sa
}

    

# output "bucket" {
#   description = "The created storage bucket"
#   value       = module.gcs_buckets.bucket
# }



# output "base_shared_vpc_project" {
#   description = "Project sample base project."
#   value       = module.env.base_shared_vpc_project
# }

# output "base_shared_vpc_project_sa" {
#   description = "Project sample base project SA."
#   value       = module.env.base_shared_vpc_project_sa
# }
# output "app_folder_id" {
#     value       = module.env.app_folder_id
#     description = "app infra folder ID"
# }


# output "env_secrets_project" {
#   description = "Project sample peering project id."
#   value       = module.env.env_secrets_project
# }


# output "bucket" {
#   description = "The created storage bucket"
#   value       = module.env.bucket
# }