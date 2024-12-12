output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.dj_instance.id 
}
