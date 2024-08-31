region = "us-east-1"

logs_bucket_name = "ssm-lambda-logs-api2"

environment = "prod"

grid_secret_name = "arn:aws:secretsmanager:us-east-1:584734538653:secret:grid-cred-prod-hIeqN4"
grid_domain = "https://dash.isecurityplus.com/mc/rest/grid/us-event"
common_tags = {
  environment = "Production"
  terraform   = true
}

all_tags    = { "Environment" = "Production", "Component" = "analytics-plumerai-intel", "Purpose" = "Production", "DC Name" = "Tend-US-Prod", "Cluster Name" = "us-prod", "Cluster Type" = "event", "Classification" = "Confidential", }
    
alb_name                        = "analytic-plumerai-intel2-lb-prod"
alb_subnets                     = ["subnet-8aac38c3", "subnet-ec439ab7", "subnet-0f57a445838aab199"]
aws_alb_target_group_name       = "analytic-plumerai-intel2-prod"
aws_alb_target_group_vpc_id     = "vpc-ac3d71c9"
aws_security_group_name         = "analytic-plumerai-intel2-sg-prod"
aws_security_group_description  = "Security group for ALB Analytic Pulmerai Intel"
aws_security_group_vpc_id       = "vpc-ac3d71c9"
aws_security_group_rule_sg_id   = "sg-0703cc41d3ad98ad1"
aws_sns_topic_name              = "graceful_termination_autoscale_API2_prod"
aws_ssm_document_name           = "DeregisterNodesFromASGAPI2Prod"
lambda_execution_role_name      = "lambda_execution_role_prod_analytic_pulmerai_intel2"
lambda_role_policy_name         = "lifecycle_hook_autoscaling_policy_analytic_pulmerai_intel2_prod"
aws_lambda_function_name        = "asg-graceful-shutdown-analytic-pulmerai-intel2-prod"
analytic_arm_role_name          = "analytic-pulmerai-intel2-Role-prod"
analytic_arm_policy_name        = "analytic-pulmerai-intel2-Policy-prod"
aws_iam_instance_profile_name   = "analytic-pulmerai-intel2-Profile-prod"
asg_security_group_name         = "analytic-pulmerai-intel2-sg-prod"
asg_security_group_description  = "Analytic Pulmerai Intel security group prod"
asg_security_group_vpc_id       = "vpc-ac3d71c9"
asg_security_group_prefix_ids   = ["pl-63a5400a"]
asg_security_group_predefined_sg = ["sg-a95dd0cd"]
asg_security_group_predefined_cidr = ["10.1.0.0/16"]
default_sg                      = "sg-a95dd0cd"
grid_dashboard_endpoint_app_name     = "analytics-plumerai-intel"
policy_attachments                  = [ "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
                                        "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
                                        "arn:aws:iam::aws:policy/AWSXrayFullAccess",
                                        "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
                                        # "arn:aws:iam::584734538653:policy/CodeDeploy-EC2-Permissions",
                                        # "arn:aws:iam::584734538653:policy/pp-PrismaDeny",
                                        # "arn:aws:iam::584734538653:policy/SSM-preprod-s3"
                                        ]
role_name                       = "analytic-pulmerai-intel2-Role-prod"
iam_inline_policy_name          = "prod-analytic-pulmerai-intel2-inline-policy"
lb_security_group_name             = "analytic-pulmerai-intel2-lb-sg-prod"
lb_security_group_description      = "Analytic Arm Pulmerai Intel2 lb security group prod"


autoscaling_goups = {
  "analytics-pulmerai-intel2-prod-full-deployment" = {
    name                     = "analytics-plumerai-intel2-prod-full-deployment"
    min_size                 = 0
    max_size                 = 0
    desired_capacity         = 0
    initial_lifecycle_hooks_name = "TerminationLifeCycleHookAPI2Prod"
    # vpc_zone_identifier      = ["subnet-7035914d","subnet-ec439ab7", "subnet-3ac88600", "subnet-dfda1d86", "subnet-8aac38c3", "subnet-0f57a445838aab199"]
    vpc_zone_identifier      = ["subnet-8aac38c3", "subnet-ec439ab7", "subnet-0f57a445838aab199"]
    launch_template_name     = "analytics-plumerai-intel2-prod-full-deployment"
    key_name                 = "US-Production"
    image_id                 = "ami-0120a3ad21d97322d"
    instance_type            = "m7i-flex.4xlarge"
    availability_zone        = "us-east-1b"
    target_value             = 40
    checkpoint_delay         = 300
    checkpoint_percentages   = [25, 50, 75, 100]
    instance_warmup          = 300
    min_healthy_percentage   = 75
    user_data_content        = <<EOF
#!/bin/bash
yum install jq -y
# Function to perform a curl request with retries and backoff
curl_with_retries() {
    local url="$1"
    local max_attempts=3
    local attempt=0
    local delay=2

    while [ $attempt -lt $max_attempts ]; do
        result=$(curl -s "$url")
        if [ $? -eq 0 ]; then
            echo "$result"
            return 0
        fi

        attempt=$((attempt + 1))
        if [ $attempt -lt $max_attempts ]; then
            echo "Attempt $attempt failed. Retrying in $delay seconds..."
            sleep $delay
            delay=$((delay * 2))  # Backoff strategy: double the delay
        fi
    done

    echo "Failed to retrieve data from $url after $max_attempts attempts."
    return 1
}

# Retrieve instance ID with retries
instance_id=$(curl_with_retries http://169.254.169.254/latest/meta-data/instance-id)
if [ $? -ne 0 ]; then
    exit 1
fi

# Retrieve server IP with retries
server_ip=$(curl_with_retries http://169.254.169.254/latest/meta-data/local-ipv4)
if [ $? -ne 0 ]; then
    exit 1
fi

# Retrieve region with retries
region=$(curl_with_retries http://169.254.169.254/latest/meta-data/placement/availability-zone | sed 's/.$//')
if [ $? -ne 0 ]; then
    exit 1
fi

# Retrieve the JSON output with retries
json_output=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[].Instances[].Tags' --region $region --output json)
if [ $? -ne 0 ]; then
    exit 1
fi

# Extract Environment and Name values using jq
environment=$(echo "$json_output" | jq -r '.[][] | select(.Key == "Environment") | .Value')
name=$(echo "$json_output" | jq -r '.[][] | select(.Key == "Name") | .Value')

ServerName="$name-$environment-$server_ip"
echo "ServerName: $ServerName"

aws ec2 create-tags --resources $instance_id --tags Key=Name,Value="$ServerName" --region $region
sudo 'echo "$ServerName" > /etc/hostname'
sudo hostnamectl set-hostname "$ServerName"
su ec2-user -c "/home/ec2-user/cxs/scripts/start_tomcat"
EOF
  },
  "analytics-plumerai-intel2-prod-canary-deployment" = {
    name                     = "analytics-plumerai-intel2-prod-canary-deployment"
    min_size                 = 0
    max_size                 = 0
    desired_capacity         = 0
    initial_lifecycle_hooks_name = "TerminationLifeCycleHookAPI2Prod"
    # vpc_zone_identifier      = ["subnet-7035914d","subnet-ec439ab7", "subnet-3ac88600", "subnet-dfda1d86", "subnet-8aac38c3", "subnet-0f57a445838aab199"]
    vpc_zone_identifier      = ["subnet-8aac38c3", "subnet-ec439ab7", "subnet-0f57a445838aab199"]
    launch_template_name     = "analytics-plumerai-intel2-prod-canary-deployment"
    key_name                 = "US-Production"
    image_id                 = "ami-035bd82a3b302462b"
    instance_type            = "m7i-flex.4xlarge"
    availability_zone        = "us-east-1b"
    target_value             = 60
    checkpoint_delay         = 300
    checkpoint_percentages   = [25, 50, 75, 100]
    instance_warmup          = 300
    min_healthy_percentage   = 75
    user_data_content        = <<EOF
#!/bin/bash
yum install jq -y
# Function to perform a curl request with retries and backoff
curl_with_retries() {
    local url="$1"
    local max_attempts=3
    local attempt=0
    local delay=2

    while [ $attempt -lt $max_attempts ]; do
        result=$(curl -s "$url")
        if [ $? -eq 0 ]; then
            echo "$result"
            return 0
        fi

        attempt=$((attempt + 1))
        if [ $attempt -lt $max_attempts ]; then
            echo "Attempt $attempt failed. Retrying in $delay seconds..."
            sleep $delay
            delay=$((delay * 2))  # Backoff strategy: double the delay
        fi
    done

    echo "Failed to retrieve data from $url after $max_attempts attempts."
    return 1
}

# Retrieve instance ID with retries
instance_id=$(curl_with_retries http://169.254.169.254/latest/meta-data/instance-id)
if [ $? -ne 0 ]; then
    exit 1
fi

# Retrieve server IP with retries
server_ip=$(curl_with_retries http://169.254.169.254/latest/meta-data/local-ipv4)
if [ $? -ne 0 ]; then
    exit 1
fi

# Retrieve region with retries
region=$(curl_with_retries http://169.254.169.254/latest/meta-data/placement/availability-zone | sed 's/.$//')
if [ $? -ne 0 ]; then
    exit 1
fi

# Retrieve the JSON output with retries
json_output=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[].Instances[].Tags' --region $region --output json)
if [ $? -ne 0 ]; then
    exit 1
fi

# Extract Environment and Name values using jq
environment=$(echo "$json_output" | jq -r '.[][] | select(.Key == "Environment") | .Value')
name=$(echo "$json_output" | jq -r '.[][] | select(.Key == "Name") | .Value')

ServerName="$name-$environment-$server_ip"
echo "ServerName: $ServerName"

aws ec2 create-tags --resources $instance_id --tags Key=Name,Value="$ServerName" --region $region
sudo 'echo "$ServerName" > /etc/hostname'
sudo hostnamectl set-hostname "$ServerName"
su ec2-user -c "/home/ec2-user/cxs/scripts/start_tomcat"
EOF
  }
}
