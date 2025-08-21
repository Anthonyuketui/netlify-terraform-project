resource "random_id" "suffix" {
  byte_length = 3
}

resource "random_shuffle" "fitness_motto" {
  input        = var.mottos
  result_count = 1
}

locals {
  effective_brand = trimspace(var.brand) != "" ? var.brand : "shredvarsity-${random_id.suffix.hex}"
  index_html      = templatefile("${path.module}/site/index.html.tmpl", {
    brand = local.effective_brand
    motto = random_shuffle.fitness_motto.result[0]
  })
}

resource "github_repository" "site_repo" {
  name         = var.repo_name
  description  = "ShredVarsity — Terraform + Netlify demo (state in HCP Terraform)"
  visibility   = "public"
  auto_init    = true
  has_issues   = true
  has_wiki     = false
  has_projects = false
}

resource "github_repository_file" "index_html" {
  repository      = github_repository.site_repo.name
  branch          = "main"
  file            = "index.html"
  content         = local.index_html
  commit_message  = "chore: add/update generated index.html"
  overwrite_on_create = true
}
