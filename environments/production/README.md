## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_asg"></a> [asg](#module\_asg) | ../../modules/asg | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autoscaling_goups"></a> [autoscaling\_goups](#input\_autoscaling\_goups) | Information needed for autoscaling groups | <pre>map(object({<br>    name                     = string<br>    max_size                 = number<br>    min_size                 = number<br>    image_id                 = string<br>    launch_template_name     = string<br>    desired_capacity         = number<br>    vpc_zone_identifier      = list(string)<br>    instance_type            = string<br>    availability_zone        = string<br>    iam_role_name            = string<br>    iam_instance_profile_arn = string<br>    security_groups          = list(string)<br>    tags                     = map(string)<br>    target_value             = string<br>    user_data_content        = string<br>  }))</pre> | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Account Commmon Tags | <pre>object({<br>    environment = string<br>    terraform   = bool<br>  })</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | `"dev"` | no |
| <a name="input_logs_bucket_name"></a> [logs\_bucket\_name](#input\_logs\_bucket\_name) | Bucket name for the logs of ssm and lambda executions | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region in which the terraform resources will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoscaling_group_arn_list"></a> [autoscaling\_group\_arn\_list](#output\_autoscaling\_group\_arn\_list) | Arn of the autoscaling group |
