variable "AppName" {
  type = string
}

variable "Environment" {
  type = string
}

variable "BeanstalkAppName" {
  type = string
}

variable "StackName" {
  type = string
}

variable "LogRetentionInDays" {
  type    = number
  default = 7
}

variable "SpringProfile" {
  type = string
}

variable "ENV" {
  type = string
}

variable "JavaToolOption" {
  type = string
}

variable "DisableIMDSv1" {
  type = string
}

variable "EnvironmentType" {
  type = string
}

variable "MinSize" {
  type    = number
  default = 1
}

variable "MaxSize" {
  type    = number
  default = 2
}

variable "InstanceType1" {
  type    = string
  default = "t2.micro"
}

variable "AutoScalingPeriod" {
  type    = string
  default = "2"
}

variable "AutoScalingBreachDuration" {
  type    = string
  default = "2"
}
variable "AutoScalingUpperThreshold" {
  type    = string
  default = "75"
}


variable "AutoScalingLowerBreachScaleIncrement" {
  type    = string
  default = "-1"
}

variable "AutoScalingUpperBreachScaleIncrement" {
  type    = string
  default = "1"
}

variable "AutoScalingLowerThreshold" {
  type    = string
  default = "65"
}

variable "LoadBalancerIsShared" {
  type    = bool
  default = false
}

variable "SharedAlbArn" {
  type = string
}

variable "DomainRecord" {
  type = string
}

variable "DomainName" {
  type = string
}

variable "AlbPort" {
  type    = number
  default = 80
}

variable "HealthCheckPath" {
  type    = string
  default = "/health"
}

variable "ServiceRole" {
  type = string
}

variable "SshKey" {
  type = string
}

variable "IamInstanceProfile" {
  type = string
}

variable "MaintananceTime" {
  type = string
}

variable "UpdateLevel" {
  type = string
}

variable "InstanceRefreshEnabled" {
  type = string
}

variable "NotificationEmail" {
  type = string
}

variable "SnsTopicArn" {
  type = string
}

variable "VpcId" {
  type = string
}

variable "PrivateSubnetIds" {
  type = set(string)
}

variable "AvailabilityZones" {
  type = string
}

variable "LoadBalancerType" {
  type = string
}

variable "Route53ZoneId" {
  type = string
}

variable "AlbDnsName" {
  type = string
}

variable "AlbZoneId" {
  type = string
}
