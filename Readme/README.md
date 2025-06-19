This project provisions basic AWS infrastructure using [Terraform](https://www.terraform.io/):
- ✅ An EC2 instance
- ✅ A uniquely named S3 bucket
- ✅ Tagged resources and output values

It's perfect for beginners learning Infrastructure as Code (IaC) with AWS.

---

## 📁 File Structure

| File | Description |
|------|-------------|
| `main.tf` | Defines EC2 and S3 resources |
| `variables.tf` | Input parameters like region and bucket prefix |
| `outputs.tf` | Outputs for public IP, bucket name, etc. |
| `.gitignore` | Optional: Ignore `.terraform.lock.hcl` |

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/Kani-shk/terra-learn.git
cd terra-learn
terraform init
terraform plan
terraform apply
```
📤 Sample Output
```
Apply complete!
Outputs:
ec2_public_ip = "13.233.xx.xxx"
s3_bucket_name = "kanishk-weather-bucket-f1a2b3c4"
