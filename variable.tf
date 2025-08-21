variable "netlify_token" {
  type      = string
  sensitive = true
}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "brand" {
  type    = string
  default = ""
}

variable "mottos" {
  type    = list(string)
  default = [
    "Strength is built daily",
    "Mobility is longevity",
    "Discipline beats motivation",
    "Automation scales effort",
    "Resilience under pressure",
    "Consistency creates champions"
  ]
}

variable "repo_name" {
  type    = string
  default = "shredvarsity-netlify-demo"
}
