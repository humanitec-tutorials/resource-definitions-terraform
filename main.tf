
### Application configuration ###
# Used to create an application

resource "humanitec_application" "app" {
  id   = var.app_name
  name = var.app_name
  depends_on = [
    humanitec_resource_definition.s3static,
     humanitec_resource_definition.db
  ]
}

### Resource definition configuration ###
# Used to create static resource definitions

resource "humanitec_resource_definition" "s3static" {
  driver_type = "humanitec/static"
  id          = "${var.app_name}-s3-static"
  name        = "${var.app_name}-s3-static"
  type        = "s3"

  driver_inputs = var.s3_static_driver_inputs

  criteria = [
    {
      app_id = var.app_name
    }
  ]

}


resource "humanitec_resource_definition" "db" {
  driver_type = "humanitec/static"
  id          = "${var.app_name}-mariadb-static"
  name        = "${var.app_name}-mariadb-static"
  type        = "mariadb"

  driver_inputs = var.db_static_driver_inputs
  
  criteria = [
    {
      app_id = var.app_name
    }
  ]

}