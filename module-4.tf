
resource "dynamodb_Access_l2" "l2_access_s3" {
    Statement = [
    
    {

    Action : [
            "dynamodb : BatchGet",
            "dynamodb: GetItem",
        ]

    Resource = [ "arn.aws:dynamodb:*:*: table/tablename" ]

    Conditions = {

       "ForAllValues:StringEquals"{
    
    dynamodb : Attributes [
        "column-name-1",
        "column-name-2",
        "column-name-3"  
    ]
       }
    }

    "StringEqualsIfExists" = {
        
    "dynamodb : Select": "Specific_Attributes"}


    }
    ]
}