terraform {
  cloud {
    
    organization = "Tonyuketui" 

    workspaces { 
      name = "netlify-app" 
    } 
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
    netlify = {
      source  = "AegirHealth/netlify"
      version = "~> 0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.2"
    }
  }
}

provider "github" {
  token = var.github_token
}

provider "netlify" {
  token = var.netlify_token
}
