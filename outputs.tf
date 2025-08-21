output "brand" {
  description = "Effective brand used for this run."
  value       = local.effective_brand
}

output "github_repo_url" {
  description = "GitHub repository URL."
  value       = github_repository.site_repo.html_url
}

output "netlify_live_url" {
  description = "Your public Netlify URL (default subdomain based on brand)."
  value       = "https://${replace(lower(local.effective_brand), " ", "-")}.netlify.app"
}
