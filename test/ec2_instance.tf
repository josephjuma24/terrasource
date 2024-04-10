##Create an EC2 Instance

resource "aws_instance" "demo-Instance" {
  ami           = "${var.ami}"   ###us-east-2
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.key-tf.key_name}"
  vpc_security_group_ids = ["${aws_security_group.demo-security-group.id}"]
  tags = {
    Name = "Example-Ec2"
  }

  user_data = <<-EOF
             #!/bin/sh
                apt-get update
                apt-get install nginx -y
                echo "Hello Tanaya" >/var/www/html/index.nginx-debian.html

              EOF
}

