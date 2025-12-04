### Deployment Steps

## 1️⃣ Clone the Repository
```
git clone <this-repo-url>
cd existing-ec2-schedule-auto-on-off
```
## 2️⃣ Update terraform.tfvars
```
# Change it according your EC2
instance_ids = [
  "i-09b46403a4643d938",
  "i-070767ee387bd1fa8"
] 

# Daily Start at 10:00 AM & Stop at 8:00 PM
ec2_schedule_auto_on_off="cron(0 4,14 * * ? *)"

```
## 3️⃣ Format Terraform Code
```
terraform fmt -recursive
```
## 4️⃣ Validate Terraform Configuration
```
terraform validate
```
## 5️⃣ Preview Changes Before Deployment
```
terraform plan
```
## 6️⃣ Apply Configuration
```
terraform apply
```
