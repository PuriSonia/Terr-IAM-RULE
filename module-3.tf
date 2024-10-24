#Creating a role to attach to EC2 / resource 

resource "aws_iam_role" "S3-bucket-role" {

name = "S3_Bucket_role"

assume_role_policy = 

"Statement" : [
    {"Action" : "sts:AssumeRole", 
    "Principle" : {
        "Service" : "ec2.amazonaws.com"
    }
    "Effect" : "Allow",
    }
]
}


#Attach this to the Ec2 instances , to give s3 Access. 
resource "aws_iam_instances_profile" "S3_access" {
    name = "S3_bucket_role"
    subnet_id = "subnet-some-subnet-id"
    roles = ["${aws_iam_role.S3-bucket-role.name}"]
}

#Creating ec2 instance resource and addding the instance profile. 
resource "aws_instance" "EC2_production" {
    ami           = "ami-40d28157"
  instance_type = "t2.micro"
  iam_instance_profile = ["${aws_iam_instance_profile.S3_access.name}"]
  key_name = "mytest"
}