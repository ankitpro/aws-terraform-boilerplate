output "autoscaling_group_arn_list" {
  value       = values(module.asg)[*].autoscaling_group_arn
  description = "Arn of the autoscaling group"
}
