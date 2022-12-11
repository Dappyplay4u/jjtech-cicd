
output "ec2_iam_role" {
  value = module.iam.ec2_iam_role
}

output "ec2_iam_role_name" {
  value = module.iam.ec2_iam_role_name
}

output "dev_instance_id" {
    value = module.ec2_dev.instance_id
}

output "stage_instance_id" {
    value = module.ec2_stage.instance_id
}

output "prod_instance_id" {
    value = module.ec2_prod.instance_id
}


output "dev_instance_ip" {
    value = module.ec2_dev.instance_public_ip
}

output "stage_instance_ip" {
    value = module.ec2_stage.instance_public_ip
}

output "prod_instance_ip" {
    value = module.ec2_prod.instance_public_ip
}

# print the url of the server
output "prodinstance_ip_ipv4_url" {
  value = join("", ["http://", module.ec2_prod.instance_public_ip])
}


# print the url of the server
output "devinstance_ip_ipv4_url" {
  value = join("", ["http://", module.ec2_dev.instance_public_ip])
}

# print the url of the server
output "stageinstance_ip_ipv4_url" {
  value = join("", ["http://", module.ec2_stage.instance_public_ip])
}

