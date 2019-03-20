provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "instance" {
 ami = "ami-08692d171e3cf02d6"
 instance_type = "t2.micro"
 key_name = "global_key"
  tags = {
    Name = "table3sa-ec2"
  }
 provisioner "remote-exec"{
  inline=["sudo apt-get -y install python"]
  connection{
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("/home/ubuntu/.ssh/global_key")}"

    }
 }
}
