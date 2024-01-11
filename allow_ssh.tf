resource "aws_security_group" "my_sg" {
       name        = "my_sg"
       description = "Some description"
       vpc_id      = "${aws_vpc.my_vpc.id}"
       tags {
         Name = "my_sg_tag"
       }

       #Not redundant - Inbound Access
       ingress {
         from_port   = "22"
         to_port     = "22"
         protocol    = "TCP"
         cidr_blocks = ["73.116.216.200"/32","76.102.161.122,"98.45.139.47"]
       }

       # Outbound Access    
       egress {
         from_port   = 0
         to_port     = 0
         protocol    = "-1"
         cidr_blocks = ["0.0.0.0/0"]
       }
}





GD
T
16 external people are from 15 organizations










