variable "s3_devops_prefix" {
  type        = "string"
  description = "Prefix used for naming the S3 bucket used for terraform state"
}

variable "project_name" {
  type        = "string"
  description = "Project description / display name"
}

variable "project_id" {
  type        = "string"
  description = "Project ID, in ID friendly format"
}

variable "project_author" {
  type        = "string"
  description = "Project Author name"
}

variable "project_author_email" {
  type        = "string"
  description = "Project author e-mail address"
}

variable "project_contact_email" {
  type        = "string"
  description = "Project main contact e-mail address"
}

variable "project_region" {
  type        = "string"
  description = "This is the target region for this project"
}

variable "platform_availability_zones" {
  type        = "list"
  description = "Availability zones for the platform to be deployed"
}

variable "platform_bastion_instance_type" {
  type        = "string"
  description = "Instance type for the bastion host"
}

// Networking
variable "vpc_cidr_block" {
  type        = "string"
  description = "CIDR block definition for the project VPC"
}

// Locals, that allow interpolation
locals {
  s3_bucket_devops_tags = {
    project_id = "${var.project_id}"
    author     = "${var.project_author}"
    contact    = "${var.project_contact_email}"
  }

  s3_devops_bucket_name = "${var.s3_devops_prefix}-${var.project_id}-${var.project_region}"
}
