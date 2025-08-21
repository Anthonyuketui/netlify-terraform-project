
# Pick a random fitness motto
resource "random_shuffle" "motto" {
  input        = var.mottos
  result_count = 1
}

# Generate a timestamp for the deploy
resource "time_static" "deploy" {}

# GitHub repo
resource "github_repository" "site" {
  name        = var.repo_name
  description = "Fitness × DevOps demo site deployed with Terraform + Netlify"
  visibility  = "public"
  auto_init   = true
}

# Render HTML template
data "template_file" "index" {
  template = file("${path.module}/site/index.html.tmpl")

  vars = {
    brand     = var.brand != "" ? var.brand : "ShredVarsity"
    motto     = random_shuffle.motto.result[0]
    timestamp = time_static.deploy.rfc3339
  }
}

# Commit template to repo
resource "github_repository_file" "index" {
  repository = github_repository.site.name
  file       = "index.html"
  content    = data.template_file.index.rendered
  branch     = "main"
  overwrite_on_create = true
}

# Netlify site
resource "netlify_site" "demo" {
  name = var.repo_name
  repo {
    provider = "github"
    repo     = github_repository.site.full_name
    branch   = "main"
  }
}
