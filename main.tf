
resource "aws_subnet" "mgoffice1" {
    vpc_id = aws_vpc.mgmain.id
    cidr_block = "192.168.0.0/23"
    tags={
        Name="mgoffice1"
    }
}

resource "aws_subnet" "mgoffice2" {
    vpc_id = aws_vpc.mgmain.id
    cidr_block = "192.168.2.0/25"
    tags={
        Name="mgoffice2"
    }
}

resource "aws_subnet" "mgoffice3" {
    vpc_id = aws_vpc.mgmain.id
    cidr_block = "192.168.2.128/26"
    tags={
        Name="mgoffice3"
    }
}

resource "aws_subnet" "mgoffice4" {
    vpc_id = aws_vpc.mgmain.id
    cidr_block = "192.168.2.192/26"
    tags={
        Name="mgoffice4"
    }
}


resource "aws_internet_gateway" "mginetgw" {
    vpc_id = aws_vpc.mgmain.id
    tags={
        Name="mginetgw"
    }
}

resource "aws_route_table" "mgroutet" {
    vpc_id = aws_vpc.mgmain.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.mginetgw.id
    }
    tags={
        Name="mgroutet"
    } 
}

resource "aws_route_table_association" "mgrtassocig" {
    subnet_id = aws_subnet.mgoffice4.id
    route_table_id = aws_route_table.mgroutet.id
}