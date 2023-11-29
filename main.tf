terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "harry12"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "harry" {
  name    = "harry"
  comment = "Database for Snowflake Terraform demo"
}
