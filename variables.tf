### REQUIRED ###

### Humanitec Configuration Variables ###
# Please note that Humanitec token config is not included here. You can set this by exporting variable HUMANITEC_TOKEN

variable "humanitec_organization" {
    description = "REQUIRED: used to specify the organization where the resources, token and application will be applied" 
}


### OPTIONAL ###

variable "app_name" {
    type = string
    default = "terraform-rd-tutorial-app"
    description = "OPTIONAL: Used to create an app and also to configure the names of the resource definitions created"
}


### Humanitec Resource Driver Inputs ###
# Object variables keep the resource configuration leaner.

variable "db_static_driver_inputs" {
  type = object({
    secrets = object({
        username = string
        password = string})
    values = object({
        name = string
        host = string
        port = number })
  })

  description = "OPTIONAL: Object used to provide driver inputs to the mariadb resource definition in this tutorial"

  
  default = {
    secrets = {
      username : "mrdeveloperusername",
      password : "unguessablepassword"

    },
    values = {
      name : "dbname",
      host : "hostdb",
      port : 3306
    }
  }

}


variable "s3_static_driver_inputs" {
  type = object({
    secrets = object({
        aws_access_key_id = string
        aws_secret_access_key = string})
    values = object({
        bucket = string
        region = string
         })
  })

  description = "OPTIONAL: Object used to provide driver inputs to the S3 resource definition in this tutorial"
 
  default = {
    secrets = {
      aws_access_key_id : "ULTRA-SECRET",
      aws_secret_access_key : "EVEN-MORE-SECRET"

    },
    values = {
      bucket : "bucket-of-joy",
      region : "eu-west-1"
    }
  }
  
}