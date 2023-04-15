resource "aws_elastic_beanstalk_environment" "BeanstalkEnvironment" {
  name                = "${var.AppName}-${var.Environment}"
  application         = var.BeanstalkAppName
  solution_stack_name = var.StackName

  tags = {
    Name = "${var.AppName}-${var.Environment}"
  }

  ### SOFTWARE ###
  # Instance log streaming to CloudWatch Logs
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "StreamLogs"
    value     = "true"
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "DeleteOnTerminate"
    value     = "true"
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "RetentionInDays"
    value     = var.LogRetentionInDays
    resource  = ""
  }

  #   application specific environment veriables
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "SPRING_PROFILES_ACTIVE"
    value     = var.SpringProfile
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "ENV"
    value     = var.ENV
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "JavaToolOption"
    value     = var.JavaToolOption
    resource  = ""
  }

  ### INSTANCES ###
  # Instance metadata service (IMDS)
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "DisableIMDSv1"
    value     = var.DisableIMDSv1
    resource  = ""
  }

  ### CAPACITY ###
  # Auto scaling group
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = var.EnvironmentType
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.MinSize
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.MaxSize
    resource  = ""
  }
  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = var.InstanceType1
    resource  = ""
  }

  # Scaling triggers
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "MeasureName"
    value     = "CPUUtilization"
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Statistic"
    value     = "Average"
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Unit"
    value     = "Percent"
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Period"
    value     = var.AutoScalingPeriod
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "BreachDuration"
    value     = var.AutoScalingBreachDuration
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "UpperThreshold"
    value     = var.AutoScalingUpperThreshold
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "LowerBreachScaleIncrement"
    value     = var.AutoScalingLowerBreachScaleIncrement
    resource  = ""
  
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "UpperBreachScaleIncrement"
    value     = var.AutoScalingUpperBreachScaleIncrement
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "LowerThreshold"
    value     = var.AutoScalingLowerThreshold
    resource  = ""
  }

  ### LOADBALACER ###
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerIsShared"
    value     = var.LoadBalancerIsShared
    resource  = ""
  }
  setting {
    namespace = "aws:elbv2:loadbalancer"
    name      = "SharedLoadBalancer"
    value     = var.SharedAlbArn
    resource  = ""
  }
  setting {
    namespace = "aws:elbv2:listenerrule:app1"
    name      = "HostHeaders"
    value     = lower("${var.DomainRecord}.${var.DomainName}")
    resource  = ""
  }
  setting {
    namespace = "aws:elbv2:listenerrule:app1"
    name      = "PathPatterns"
    value     = "/*"
    resource  = ""
  }
  setting {
    namespace = "aws:elbv2:listener:${var.AlbPort}"
    name      = "Rules"
    value     = "app1"
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "HealthCheckPath"
    value     = var.HealthCheckPath
    resource  = ""
  }

  ### ROLLING UPDATES AND DEPLOYMENTS ###
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "DeploymentPolicy"
    value     = "Rolling"
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSize"
    value     = "50"
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = "true"
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = "Health"
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MaxBatchSize"
    value     = "1"
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MinInstancesInService"
    value     = "1"
    resource  = ""
  }

  ### SECURITY ###
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = var.ServiceRole
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.SshKey
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = var.IamInstanceProfile
    resource  = ""
  }

  ### MANAGED UPDATES ###
  setting {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "ServiceRoleForManagedUpdates"
    value     = var.ServiceRole
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "ManagedActionsEnabled"
    value     = "true"
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "PreferredStartTime"
    value     = var.MaintananceTime
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
    name      = "UpdateLevel"
    value     = var.UpdateLevel
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
    name      = "InstanceRefreshEnabled"
    value     = var.InstanceRefreshEnabled
    resource  = ""
  }

  ### NOTIFICATIONS ###
  setting {
    namespace = "aws:elasticbeanstalk:sns:topics"
    name      = "Notification Endpoint"
    value     = var.NotificationEmail
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:sns:topics"
    name      = "Notification Protocol"
    value     = "email"
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:sns:topics"
    name      = "Notification Topic ARN"
    value     = var.SnsTopicArn
    resource  = ""
  }

  ### NETWORK ###
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.VpcId
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(", ", var.PrivateSubnetIds)
    resource  = ""
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "Availability Zones"
    value     = var.AvailabilityZones
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = var.LoadBalancerType
    resource  = ""
  }

}

# A record

resource "aws_route53_record" "www" {
  zone_id = var.Route53ZoneId
  name    = lower("${var.DomainRecord}.${var.DomainName}")
  type    = "A"

  alias {
    name                   = var.AlbDnsName
    zone_id                = var.AlbZoneId
    evaluate_target_health = true
  }
}
