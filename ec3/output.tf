output "webinstance_id" {
    value = aws_instance.web_instance.id
}

output "webinstance_public_ip" {
    value = aws_instance.web_instance.public_ip
}