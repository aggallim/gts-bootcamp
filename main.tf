variable "name" { default = "CHANGE-ME"}
provider "aws" { region  = "us-east-1" }
data "aws_ami" "ami" {
  most_recent = true
  owners = ["amazon"]
  filter { name = "name", values = ["amzn2-ami-hvm-2.0*x86*"] }
}
resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ami.id}"
  instance_type = "t2.micro"
  subnet_id = "subnet-0b1a60c5dd16fa6b5"
  tags { Name  = "${var.name}-CREATED-BY-JENKINS" }
}
