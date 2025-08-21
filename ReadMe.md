# ShredVarsity — Terraform + Netlify Demo (HCP Remote State)

🚀 **Fitness × DevOps** — Built by discipline, scaled by automation.  

This project deploys a **unique fitness-themed landing page** to Netlify using **Terraform**, with remote state managed in **HCP Terraform (Terraform Cloud)**.  
On each `terraform apply`, the site **randomizes a fitness motto** and regenerates a custom landing page — proving **Infrastructure as Code + Creativity** in action.

---

## 🔧 What This Project Does
- Provisions infrastructure with Terraform:
  - **Netlify site management** (via `AegirHealth/netlify` provider)
  - **GitHub repo + auto-committed index.html** (via `integrations/github` provider)
  - **Randomized page content** using Terraform’s `random` provider
  - **HCP Terraform** stores remote state (team-ready, secure)
- Generates a **fitness-branded static site** with:
  - Custom **brand name**
  - Randomized **fitness mottos** (e.g. *Strength, Endurance, Mobility…*)
  - Deployed live on Netlify

---

## 🌐 Live Demo
👉 [Visit your deployed Netlify site](https://shredvarsity-demo.netlify.app)  
*(Replace with your actual deployed URL from outputs)*

Each time you run `terraform apply`, the **brand + motto** may change.

---

## 📸 Screenshots
<p align="center">
  <img src="demo-screenshot.png" width="600" alt="ShredVarsity demo page"/>
</p>

---

## 📂 Files

### `variables.tf`
Defines required secrets + options:
- `netlify_token` (sensitive)
- `github_token` (sensitive)
- `brand` (optional override for brand name)
- `mottos` (default fitness mottos list)
- `repo_name` (GitHub repo name)

### `main.tf`
- Configures HCP Terraform remote backend
- Configures providers: GitHub, Netlify, Random
- Creates GitHub repo + commits `index.html`
- Sets Netlify environment variables

### `site/index.html.tmpl`
HTML template rendered dynamically with:
- **${brand}**
- **${motto}**
- **${timestamp}**

### `outputs.tf`
- Shows effective brand
- GitHub repo URL
- Live Netlify URL

---

## ✨ Bonus Features (Satisfied!)
✅ **Unique theme** — Fitness × DevOps  
✅ **Randomized content** — Fitness motto changes every deploy  
✅ **Dynamic timestamp** — Page shows deploy time  
✅ **Custom design** — Dark mode, gold accent, responsive  
✅ **Documented workflow** — This README + Medium article  

---

## 🚀 How to Reproduce

1. **Clone the repo**
   ```bash
   git clone https://github.com/yourusername/shredvarsity-netlify-demo.git
   cd shredvarsity-netlify-demo
