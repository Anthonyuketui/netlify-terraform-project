variable "netlify_token" {
  description = "Netlify Personal Access Token (set in HCP workspace vars or TF_VAR_netlify_token)."
  type        = string
  sensitive   = true
}

variable "brand" {
  description = "Optional site name on Netlify. If empty, a randomized name will be used."
  type        = string
  default     = ""
}

variable "mottos" {
  description = "List of fitness mottos to randomize on each deploy."
  type        = list(string)
  default     = ["Strength", "Endurance", "Discipline", "Shred", "Power", "Mobility", "HIIT", "Cardio", "Core", "Recovery"]
}

variable "repo_name" {
  description = "Name of the GitHub repo that will hold the static site."
  type        = string
  default     = "shredvarsity-netlify-demo"
}

variable "github_token" {
  description = "GitHub Personal Access Token (with repo permissions)."
  type        = string
  sensitive   = true
}
