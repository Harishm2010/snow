terraform {
  required_providers {
    snowflake = {
      source  = "HARISH/snowflake"
      version = "7.41.0"
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

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}
