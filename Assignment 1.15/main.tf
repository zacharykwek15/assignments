resource "aws_secretsmanager_secret" "secret_key" {
    name = "zhRDSDB-secret"
    description = "Secret with kay value pair"
}


resource "aws_secretsmanager_secret_version" "secret_key"{
    secret_id = aws_secretsmanager_secret.secret_key.id
    secret_string = jsonencode({
        username = "myUser"             #Issueing key variable 
    })

}