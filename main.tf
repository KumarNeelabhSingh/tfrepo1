provider "aws" {
 
  region = "us-east-1"
}
terraform {
  backend "s3" {
      region = "us-east-1"
     bucket = "nts18s3tf"
     dynamodb_table = "tfnts18"
     key = "terraform.tfstate"
    
  }
}
variable "keyname" {

 type = string

}



resource "tls_private_key" "rsa" {

algorithm = "RSA"

rsa_bits = 4096

}



resource "aws_key_pair" "tf-key-pair" {

key_name = var.keyname

public_key = tls_private_key.rsa.public_key_openssh

}



resource "local_file" "tf-key" {

content = tls_private_key.rsa.private_key_pem

filename = var.keyname

}
