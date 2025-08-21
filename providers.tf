terraform {
  required_version = ">= 1.3"

  cloud { 
    organization = "Tonyuketui"

    workspaces { 
      name = "netlify-app"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
    netlify = {
      source  = "AegirHealth/netlify"
      version = "~> 0.6"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = "AnthonyUketui"
}

provider "netlify" {
  token = var.netlify_token
}
