output "brand_used" {
  value = var.brand != "" ? var.brand : "ShredVarsity"
}

output "chosen_motto" {
  value = random_shuffle.motto.result[0]
}

output "github_repo_url" {
  value = github_repository.site.html_url
}

output "netlify_url" {
  value = netlify_site.demo.ssl_url
}
