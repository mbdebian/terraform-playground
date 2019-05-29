variable "project_region" {
  type = "string"
  description = "Where this project is supposed to run"
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

// Networking
variable "vpc_cidr_block" {
  type        = "string"
  description = "CIDR block definition for the project VPC"
}

variable "services_availability_zones" {
  type = "list"
  description = "Availability zones that will be prepared"
}

variable "service_time_machine_availability_zone" {
  type = "string"
  description = "Availability zone for Time Machine Service"
}

