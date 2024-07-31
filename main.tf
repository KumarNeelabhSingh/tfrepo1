provider "aws" {
 
  region = "us-east-1"
}

resource "aws_vpc" "dep1" {
    cidr_block = "10.10.0.0/16"
    tags = {
      "Name" = "VPC1-NTS-18"
      
    }
    depends_on = [ aws_vpc.dep4 ]
  
}
resource "aws_vpc" "dep2" {
    cidr_block = "10.20.0.0/16"
    tags = {
      "Name" = "VPC2-NTS-18"
      
    }
    depends_on = [ aws_vpc.dep3 ]
  
}
resource "aws_vpc" "dep3" {
    cidr_block = "10.30.0.0/16"
    tags = {
      "Name" = "VPC3-NTS-18"
      
    }
    depends_on = [ aws_vpc.dep4 ]
  
}
resource "aws_vpc" "dep4" {
    cidr_block = "10.40.0.0/16"
    tags = {
      "Name" = "VPC4"-NTS-18
      
    }
  
}
