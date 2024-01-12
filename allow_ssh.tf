resource "sg-0514a63dffef6e5fe" "secure_ssh" {
       name        = "secure ssh"
       description = "allow ssh from my home ip"
       vpc_id      = "${vpc-02ef769587dd081cf }"
       tags {
         Name = "my_sg_tag"
       }

       #Not redundant - Inbound Access
       ingress {
         from_port   = "22"
         to_port     = "22"
         protocol    = "TCP"
         cidr_blocks = ["73.116.216.200/32","76.102.161.122","98.45.139.47"]
       }

       # Outbound Access    
       egress {
         from_port   = 0
         to_port     = 0
         protocol    = "-1"
         cidr_blocks = ["0.0.0.0/0"]
       }
}













