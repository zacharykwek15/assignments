resource "aws_dynamodb_table" "basic_dynamodb-table" {
    name = "zh-bookinventory"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "ISBN"
    range_key = "Genre" 

    attribute{
        name = "ISBN"
        type ="S"
    }

    attribute {
        name = "Genre"
        type = "S"
    }
}

#Dummy data inserted into the DB can be found under information section -> text.txt




