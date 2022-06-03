data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["099720109477"]
}

resource "aws_instance" "mgoffice1_ec2" {
    ami = data.aws_ami.ubuntu.id
    subnet_id = aws_subnet.mgoffice1.id
    vpc_security_group_ids = [aws_security_group.private.id,aws_security_group.ssh_to_privates.id]
    associate_public_ip_address = false
    key_name = aws_key_pair.deployer.key_name
    instance_type = "t2.micro"
    tags = {
        Name = "mgoffice1_ec2"
    }
}

resource "aws_instance" "mgoffice2_ec2" {
    ami = data.aws_ami.ubuntu.id
    subnet_id = aws_subnet.mgoffice2.id
    vpc_security_group_ids = [aws_security_group.private.id,aws_security_group.ssh_to_privates.id]
    associate_public_ip_address = false
    key_name = aws_key_pair.deployer.key_name
    instance_type = "t2.micro"
    tags = {
        Name = "mgoffice2_ec2"
    }
}

resource "aws_instance" "mgoffice3_ec2" {
    ami = data.aws_ami.ubuntu.id
    subnet_id = aws_subnet.mgoffice3.id
    vpc_security_group_ids = [aws_security_group.private.id,aws_security_group.ssh_to_privates.id]
    associate_public_ip_address = false
    key_name = aws_key_pair.deployer.key_name
    instance_type = "t2.micro"
    tags = {
        Name = "mgoffice3_ec2"
    }
}

resource "aws_instance" "mgoffice4_ec2" {
    ami = data.aws_ami.ubuntu.id
    subnet_id = aws_subnet.mgoffice4.id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    associate_public_ip_address = true
    key_name = aws_key_pair.deployer.key_name
    instance_type = "t2.micro"
    tags = {
        Name = "mgoffice4_ec2"
    }
}