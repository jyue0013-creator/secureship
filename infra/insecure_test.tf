# DELIBERATELY INSECURE: testing the security gate. DO NOT MERGE.
resource "aws_security_group" "bad" {
  name        = "secureship-insecure-test"
  description = "Insecure test: SSH open to the world"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}