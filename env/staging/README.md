<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| billing\_account | The ID of the billing account to associated this project with | `string` | n/a | yes |
| enable\_hub\_and\_spoke | Enable Hub-and-Spoke architecture. | `bool` | `false` | no |
| folder\_prefix | Name prefix to use for folders created. Should be the same in all steps. | `string` | `"fldr"` | no |
| org\_id | The organization id for the associated services | `string` | n/a | yes |
| parent\_folder\_id |  It will place all the customer foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step. | `string` | `n/a` | yes |
| project\_prefix | Name prefix to use for projects created. Should be the same in all steps. Max size is 3 characters. | `string` | `"prj"` | no |
| impersonate\_service\_account | Service account email of the account to impersonate to run Terraform | `string` | n/a | yes |
| shared\_project\_id | Shared network project Id |`string` | `n/a` | yes |
| vpc\_network\_name | production shared vpc network name | `string` | `n/a` | yes |
| central\_monitoring\_project | central monitoring project ID | `string` | `n/a` | yes |
| project_type | Enter the project type | `string` | `n/a` | yes |
| environment | enter the environment variable | `string` | `n/a` | yes |
| alert\_pubsub\_topic | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` | `string` | `null` | no |
| alert\_spent\_percents | A list of percentages of the budget to alert on when threshold is exceeded | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| budget\_amount | The amount to use as the budget | `number` | `1000` | no |
| enable\_hub\_and\_spoke | Enable Hub-and-Spoke architecture. | `bool` | `false` | no |
| firewall\_enable\_logging | Toggle firewall logging for VPC Firewalls. | `bool` | `true` | no |
| gcs\_bucket\_prefix | Name prefix to be used for GCS Bucket | `string` | `bkt` | no |
| key\_name | Name to be used for KMS Key | `string` | `"crypto-key-example"` | no |
| key\_rotation\_period | Rotation period in seconds to be used for KMS Key | `string` | `"7776000s"` | no |
| keyring\_name | Name to be used for KMS Keyring | `string` | `"sample-keyring"` | no |
| location\_gcs | Case-Sensitive Location for GCS Bucket (Should be same region as the KMS Keyring) | `string` | `"US"` | no |
| location\_kms | Case-Sensitive Location for KMS Keyring (Should be same region as the GCS Bucket) | `string` | `"us"` | no |
| optional\_fw\_rules\_enabled | Toggle creation of optional firewall rules: IAP SSH, IAP RDP and Internal & Global load balancing health check and load balancing IP ranges. | `bool` | `false` | no |
| windows\_activation\_enabled | Enable Windows license activation for Windows workloads. | `bool` | `false` | no |
| shared\_project\_id | Shared network project Id |`string` | `n/a` | yes |
| project\_code | project code ex:secret,kms,base,app... | `string` | n/a | yes | 
| peering\_module\_depend\_on | List of modules or resources peering module depends on. | `list(any)` | [] | no |
## Outputs

| Name | Description |
|------|-------------|
| app_folder_id | app infra folder ID |
| base\_shared\_vpc\_project | Project sample base project. |
| base\_shared\_vpc\_project\_sa | Project sample base project SA. |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
