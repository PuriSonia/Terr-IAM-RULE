
resource "Dynamo_db_table" "Dynamo_table1" {
    source = ../../../../../module-1.tf

    lifecycle {
        prevent_destroy = true
    }
    versioning_configuration {
        status = "enabled"
    }
}


resource "aws_iam_policy" "Dynamodb_policy" {
    name = "Dynamodb_policy"
    Statement {

        Effect: "Allow",
        Actions: [
            "dynamodb:BatchGet*"
            "Dynamobd:GetItem"
            ],
        
        Resource: "arn:aws:dyanamo_db_table:*:*:table/Dynamo_table1", 
} 
}