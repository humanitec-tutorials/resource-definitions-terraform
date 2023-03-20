# Please note that Humanitec token config is not included here. You can set this by exporting variable HUMANITEC_TOKEN


provider "humanitec" {
   org_id = var.humanitec_organization
}


terraform {
  required_providers {
    humanitec = {
      source = "humanitec/humanitec"
    }
  }
}