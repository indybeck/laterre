# please for the love of god keep these sorted
resource "aws_subnet" "admin" {
  count                   = "${length(split(",", var.subnet_mappings["admin"]))}"
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "10.${var.location_octet}.${element(split(",", var.subnet_mappings["admin"]), count.index)}.0/24"
  availability_zone       = "${lookup(var.zone_ids, count.index)}"
  map_public_ip_on_launch = false

  tags {
    "Name" = "admin-${lookup(var.zone_names, count.index)}"
    "Vendor" = "${var.vendor}"
    "Product" = "INET"
  }
}

//resource "aws_subnet" "backend" {
//  count                   = "${length(split(",", var.subnet_mappings["backend"]))}"
//  vpc_id                  = "${var.vpc_id}"
//  cidr_block              = "10.${var.location_octet}.${element(split(",", var.subnet_mappings["backend"]), count.index)}.0/24"
//  availability_zone       = "${lookup(var.zone_ids, count.index)}"
//  map_public_ip_on_launch = false
//
//  tags {
//    "Name" = "backend-${lookup(var.zone_names, count.index)}"
//    "Product" = "INET"
//    "Vendor" = "${var.vendor}"
//  }
//}
//
//resource "aws_subnet" "cassandra" {
//  count                   = "${length(split(",", var.subnet_mappings["cassandra"]))}"
//  vpc_id                  = "${var.vpc_id}"
//  cidr_block              = "10.${var.location_octet}.${element(split(",", var.subnet_mappings["cassandra"]), count.index)}.0/24"
//  availability_zone       = "${lookup(var.zone_ids, count.index)}"
//  map_public_ip_on_launch = false
//
//  tags {
//    "Name" = "cassandra-${lookup(var.zone_names, count.index)}"
//    "Product" = "INET"
//    "Vendor" = "${var.vendor}"
//  }
//}
//
//resource "aws_subnet" "core" {
//  count                   = "${length(split(",", var.subnet_mappings["core"]))}"
//  vpc_id                  = "${var.vpc_id}"
//  cidr_block              = "10.${var.location_octet}.${element(split(",", var.subnet_mappings["core"]), count.index)}.0/24"
//  availability_zone       = "${lookup(var.zone_ids, count.index)}"
//  map_public_ip_on_launch = false
//
//  tags {
//    "Vendor" = "${var.vendor}"
//    "Name" = "core-${lookup(var.zone_names, count.index)}"
//    "Product" = "INET"
//  }
//}
//
//resource "aws_subnet" "ELB" {
//  count                   = "${length(split(",", var.subnet_mappings["ELB"]))}"
//  vpc_id                  = "${var.vpc_id}"
//  cidr_block              = "10.${var.location_octet}.${element(split(",", var.subnet_mappings["ELB"]), count.index)}.0/24"
//  availability_zone       = "${lookup(var.zone_ids, count.index)}"
//  map_public_ip_on_launch = false
//
//  tags {
//    "Vendor" = "${var.vendor}"
//    "Product" = "INET"
//    "Name" = "ELB-${lookup(var.zone_names, count.index)}"
//  }
//}
//
//resource "aws_subnet" "hadoop" {
//  count                   = "${length(split(",", var.subnet_mappings["hadoop"]))}"
//  vpc_id                  = "${var.vpc_id}"
//  cidr_block              = "10.${var.location_octet}.${element(split(",", var.subnet_mappings["hadoop"]), count.index)}.0/24"
//  availability_zone       = "${lookup(var.zone_ids, count.index)}"
//  map_public_ip_on_launch = false
//
//  tags {
//    "Vendor" = "${var.vendor}"
//    "Product" = "INET"
//    "Name" = "hadoop-${lookup(var.zone_names, count.index)}"
//  }
//}
//
//resource "aws_subnet" "memcached" {
//  count                   = "${length(split(",", var.subnet_mappings["memcached"]))}"
//  vpc_id                  = "${var.vpc_id}"
//  cidr_block              = "10.${var.location_octet}.${element(split(",", var.subnet_mappings["memcached"]), count.index)}.0/24"
//  availability_zone       = "${lookup(var.zone_ids, count.index)}"
//  map_public_ip_on_launch = false
//
//  tags {
//    "Vendor" = "${var.vendor}"
//    "Product" = "INET"
//    "Name" = "memcached-${lookup(var.zone_names, count.index)}"
//  }
//}
//
//resource "aws_subnet" "micro" {
//  count                   = "${length(split(",", var.subnet_mappings["micro"]))}"
//  vpc_id                  = "${var.vpc_id}"
//  cidr_block              = "10.${var.location_octet}.${element(split(",", var.subnet_mappings["micro"]), count.index)}.0/24"
//  availability_zone       = "${lookup(var.zone_ids, count.index)}"
//  map_public_ip_on_launch = false
//
//  tags {
//    "Vendor" = "${var.vendor}"
//    "Product" = "INET"
//    "Name" = "micro-${lookup(var.zone_names, count.index)}"
//  }
//}
//
//resource "aws_subnet" "MYSQL" {
//  count                   = "${length(split(",", var.subnet_mappings["MYSQL"]))}"
//  vpc_id                  = "${var.vpc_id}"
//  cidr_block              = "10.${var.location_octet}.${element(split(",", var.subnet_mappings["MYSQL"]), count.index)}.0/24"
//  availability_zone       = "${lookup(var.zone_ids, count.index)}"
//  map_public_ip_on_launch = false
//
//  tags {
//    "Vendor" = "${var.vendor}"
//    "Name" = "MYSQL-${lookup(var.zone_names, count.index)}"
//    "Product" = "INET"
//  }
//}
//
//resource "aws_subnet" "NAT" {
//  count                   = "${length(split(",", var.subnet_mappings["NAT"]))}"
//  vpc_id                  = "${var.vpc_id}"
//  cidr_block              = "10.${var.location_octet}.${element(split(",", var.subnet_mappings["NAT"]), count.index)}.0/24"
//  availability_zone       = "${lookup(var.zone_ids, count.index)}"
//  map_public_ip_on_launch = false
//
//  tags {
//    "Vendor" = "${var.vendor}"
//    "Product" = "INET"
//    "Name" = "NAT-${lookup(var.zone_names, count.index)}"
//  }
//}
//
//resource "aws_subnet" "portal" {
//  count                   = "${length(split(",", var.subnet_mappings["portal"]))}"
//  vpc_id                  = "${var.vpc_id}"
//  cidr_block              = "10.${var.location_octet}.${element(split(",", var.subnet_mappings["portal"]), count.index)}.0/24"
//  availability_zone       = "${lookup(var.zone_ids, count.index)}"
//  map_public_ip_on_launch = false
//
//  tags {
//    "Vendor" = "${var.vendor}"
//    "Product" = "INET"
//    "Name" = "portal-${lookup(var.zone_names, count.index)}"
//  }
//}
//
//resource "aws_subnet" "rabbit" {
//  count                   = "${length(split(",", var.subnet_mappings["rabbit"]))}"
//  vpc_id                  = "${var.vpc_id}"
//  cidr_block              = "10.${var.location_octet}.${element(split(",", var.subnet_mappings["rabbit"]), count.index)}.0/24"
//  availability_zone       = "${lookup(var.zone_ids, count.index)}"
//  map_public_ip_on_launch = false
//
//  tags {
//    "Vendor" = "${var.vendor}"
//    "Product" = "INET"
//    "Name" = "rabbit-${lookup(var.zone_names, count.index)}"
//  }
//}