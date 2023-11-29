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

resource "snowflake_database" "demo_db1" {
  name    = "DEMO_DB1"
  comment = "Database for Snowflake Terraform demo1"
}
resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.demo_db1.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo1"
}

