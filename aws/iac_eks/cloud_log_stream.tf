resource "aws_cloudwatch_log_group" "iac_log_group" {
  name = "iac_log_group"
  tags = {
    Name = "iac-docker-logs"
  }
}

resource "aws_cloudwatch_log_stream" "iac_log_stream" {
  name           = "iac_log_stream"
  log_group_name = aws_cloudwatch_log_group.iac_log_group.name
}
