###Create Security Group

resource "aws_security_group" "demo-security-group" {
  name        = "demo-security-group"
  description = "Allow TLS inbound traffic"


  ingress {
    description = "Allow all tls"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  ## All traffic
  }

  egress {
    from_port   = 0
    to_port     = 0  ## all port
    protocol    = "-1"   ## all protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Example-Security-group"
 }
}

