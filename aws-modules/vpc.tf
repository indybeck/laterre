resource "aws_vpc" "vpc" {
    cidr_block           = "${var.cidr_block}"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags {
        "Name" = "${var.vpc_name}"
    }
}


resource "aws_vpc_dhcp_options" "dhcp_options" {
    domain_name = "ec2.internal ${var.local_zone_name}.local"
    domain_name_servers = ["AmazonProvidedDNS"]
    tags {
        Name = "domain_settings_local"
    }
}

resource "aws_vpc_dhcp_options_association" "domain" {
    vpc_id = "${aws_vpc.vpc.id}"
    dhcp_options_id = "${aws_vpc_dhcp_options.dhcp_options.id}"
}

