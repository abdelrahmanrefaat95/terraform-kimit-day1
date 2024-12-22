output "instance_id" {
  value = aws_instance.demo-ec2.id

}

output "instance_ip" {
  value = aws_instance.demo-ec2.public_ip

}

output "private-key" {
  value = aws_key_pair.my-key.key_name

}