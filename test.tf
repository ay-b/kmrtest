provider "aws" {
  region     = "us-east-1"
}

resource "aws_security_group" "default"{
  name = "allow_80_22"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Open to all"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Open to all"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Open to all"
  }

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Everything out is allowed"
  }
}

resource "aws_instance" "front_instance" {
  ami           = "ami-0080e4c5bc078760e"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name      = "ayb_nb"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  tags = {
    Name = "front"
  }
}

resource "aws_instance" "back_instance" {
  ami           = "ami-0080e4c5bc078760e"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name      = "ayb_nb"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  # associate_public_ip_address = false
  tags = {
    Name = "back"
  }
  
}

output "front_public_ip" {
  value = "${aws_instance.front_instance.public_ip}"
}

output "back_public_ip" {
  value = "${aws_instance.back_instance.public_ip}"
}