## README.md
# Terraform Setup for AWS EKS

This Terraform configuration provisions an AWS EKS cluster along with networking, IAM roles, and node groups.

## Steps:
1. Initialize Terraform:
   ```sh
   terraform init
   ```
2. Apply changes:
   ```sh
   terraform apply -auto-approve
   ```
3. Configure kubectl:
   ```sh
   aws eks --region us-east-1 update-kubeconfig --name telemachus-eks
   kubectl get nodes
   ```
