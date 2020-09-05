# Terraform S3 Static Site with Cloudflare
Host a static website on S3 with Cloudflare DNS.
Supports SSL. Great for single page apps. 

Setup and deployment is as simple as a single command.

## Example (React)
1. [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
2. [Install the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) <br />
3. [Install JQ](https://stedolan.github.io/jq/download/)
4. [Obtain a Cloudflare API Key](https://support.cloudflare.com/hc/en-us/articles/200167836-Managing-API-Tokens-and-Keys#12345680)
5. Clone the Repo <br />
`git clone https://github.com/bewestphal/terraform-cloudflare-s3-website.git`
6. Populate the `.env` file with required config <br />
7. Create React App (the demo Single Page App) <br />
`npx create-react-app client`
8. Init terraform <br />
`terraform init` <br />
9. Apply terraform <br />
`terraform apply` <br />
10. Your website will be available at `.env.DOMAIN` in a few minutes!

_To deploy changes to the React App just reapply Terraform_ <br />
`terraform apply`

## Importing Existing Resources
An example script `terraform_import.sh` provides some examples to import existing resources such as an existing 
cloudflare zone.

See the terraform documentation on each resource type for instructions on importing more types.
