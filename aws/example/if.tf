resource "aws_network_interface" "iac_if" {
  subnet_id   = aws_subnet.iac_subnet.id
  private_ips = ["10.10.10.10"]

  tags = {
    Name = "iac_if"
  }
}
