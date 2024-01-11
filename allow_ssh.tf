resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh"
  description = "Allow SSH access from specific IP addresses"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    
    # Replace the following with your specific allowed IP addresses
    cidr_blocks = ["73.116.216.200", "76.102.161.122", "98.45.139.47"]
  }

  # Add any additional rules or configurations here
}

output "security_group_id" {
  value = aws_security_group.allow_ssh.id
}

