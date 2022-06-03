resource "aws_security_group" "private" {
    name ="private"
    description = "Private inbound access"
    vpc_id = aws_vpc.mgmain.id
    ingress {
        description = "private"
        from_port = 8
        to_port = 0
        protocol = "icmp"
        cidr_blocks = ["192.168.2.192/26"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags={
        Name="allow_remote"
    }
}

resource "aws_security_group" "allow_ssh" {
    name ="allow_ssh"
    description = "Allow TLS inbound traffic"
    vpc_id = aws_vpc.mgmain.id
    ingress {
        description = "TLS from VPC"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags={
        Name="allow_ssh"
    }
}

resource "aws_security_group" "ssh_to_privates" {
    name ="ssh_to_privates"
    description = "Private ssh access"
    vpc_id = aws_vpc.mgmain.id
    ingress {
        description = "ssh_to_privates"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["192.168.2.192/26"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags={
        Name="ssh_to_privates"
    }
}