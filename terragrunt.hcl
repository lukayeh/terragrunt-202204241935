locals {
    env_name = replace(path_relative_to_include(), "environments/", "")
}

inputs = {
    env_name = local.env_name
}

remote_state {
    backend = "s3"
    generate = {
        path = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }
    config = {
        bucket = "lukayeh-terraform" # Amazon S3 bucket required

        key     = "envs/${local.env_name}/terraform.tfstate"
        region  = "eu-west-1"
        encrypt = true
        profile = "default" # Profile name required
    }
}