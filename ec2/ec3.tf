resource "aws_security_group" "ec3_sg" {
  name        = join("", [var.name, "-", "ec3-sg"])
  description = "Allow  traffic for http and ssh"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = join("", [var.name, "-", "iam-instance-profile"])
  role = var.iam_role_name
}



resource "aws_instance" "web_server" {
  ami                    = "ami-0b0dcb5067f052a63"
  instance_type          = "t3.small"
  key_name               = var.key_pair_name  
  vpc_security_group_ids = [aws_security_group.ec3_sg.id]
  user_data              = file("scripts/techmax.sh")
  iam_instance_profile   = aws_iam_instance_profile.instance_profile.name
  tags                   = merge(var.tags, { Name = join("", [var.name, "-", "webserver"]) }, {Environment = var.name})

  # best practices as per checkov scanner

  monitoring = true
  ebs_optimized = true
  root_block_device {
  encrypted     = true
  }

}