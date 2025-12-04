terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "iam" {
  source = "./modules/iam"
}

module "lambda_auto_on_off" {
  source       = "./modules/lambda"
  role_arn     = module.iam.role_arn
  instance_ids = var.instance_ids
  action       = "auto"
}

module "schedule_auto_on_off" {
  source                   = "./modules/eventbridge"
  lambda_arn               = module.lambda_auto_on_off.lambda_arn
  ec2_schedule_auto_on_off = var.ec2_schedule_auto_on_off
  name                     = "ec2-schedule-auto-on-off"
}
