provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh"
  description = "Allow SSH access from specific IP addresses"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    
    # Replace the following with your specific allowed IP addresses
    cidr_blocks = ["10.0.0.9", "10.0.0.64"]
  }

  # Add any additional rules or configurations here
}

output "security_group_id" {
  value = aws_security_group.allow_ssh.id
}

