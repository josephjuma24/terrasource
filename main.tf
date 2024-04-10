provider "aws" {
  region = "us-east-2" # Specify your desired AWS region
}

##Create an EC2 Instance

resource "aws_instance" "demo-instance" {
  ami           = "${var.ami}"   ###us-east-2
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.key-tf.key_name}"   ## give reference to the key-name like this or you can mention its name directly
  vpc_security_group_ids = ["${aws_security_group.demo-security-group.id}"]
  tags = {
    Name = "demo_instance"
 }

 user_data = <<-EOF
             #!/bin/sh
                apt-get update
                apt-get install nginx -y
                echo "Hello Tanaya" >/var/www/html/index.nginx-debian.html

              EOF
}

## Create the key-pair

resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")

}

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
