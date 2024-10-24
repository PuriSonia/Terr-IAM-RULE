
#Neither of these have been attached to a module yet. just iam roles to be attached. 

#iAM role , with policy , to attach to EC2 instance. Gives access to s3bucket.

resource "aws_iam_role_ec2" "s3-mybucket-role" {
    name = "s3-mybucket-role"
    assume_role_policy = data.aws_iam_policy_document.permission_l1.json 
}

#permissions attached to the above role, the EC2 instances will adopt.
data  "aws_iam_policy_document" "permission_l1" {

    Statement {

    "Action" : [
        "dynamobd : BatchGet",
        "dynamobd : GetItem",
    ], 

    "Resource" : [
        
        "arn:aws:dynamodb:*:*:table/mytable"
    ], 

}
}

#iam role , to access for lambda , assuming this role, gives access to lambda. 
resource "aws_iam_role_lambda" "lambda_role" {
    name = "lambda-l1-role"
    assume_role_policy = data.aws_iam_policy_doc.permission_lambda_l1.json
  }


#Permission attached to Iam role , to access a particular lambda resource. 

data "aws_iam_policy_doc" "permission_lambda_l1" {

    Statement {

    "Effect" : "Allow"
       
     "Actions" : [
        "lambda:CreateFunction"
        "lambda:GetAccountSettings"
        "lambda:DeleteResourcePolicy"
     ]

    "Resource" : [
        $aws_lambda_resource.lambda.arn
    ] 
}

}