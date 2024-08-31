output "autoscaling_group_arn_list" {
  value       = module.asg.autoscaling_group_arn_list
  description = "Arn of the autoscaling group"
}
