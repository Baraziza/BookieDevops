   output "subnet_ids" {
     description = "List of subnet IDs for the EKS cluster"
     value       = aws_subnet.eks_subnet[*].id  # This dynamically retrieves the latest subnets
   }

   output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.eks_vpc.id  # Reference the ID of the created VPC
}