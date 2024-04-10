output "print-key-name" {

 value = "${aws_key_pair.key-tf.key_name}"

}

output "Print-Security-Group-Id" {

 value= "${aws_security_group.demo-security-group.id}"

}
