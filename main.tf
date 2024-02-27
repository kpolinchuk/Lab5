provider "aws" {
  region     = "eu-north-1"
  access_key = "AKIA5FTZC5Y7Z4IBKOQ7"
  secret_key = "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"
}

module "ec2_instance" { 
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.0.0"


  name           = "Kyrylo-ec2-instance"
  

  ami                    = "ami-0014ce3e52359afbd"
  instance_type          = "t3.micro"
  key_name               = "Lab5"
  vpc_security_group_ids = ["sg-01db92e3bb2f96cce"]
  subnet_id              = "subnet-06ca9b02a997d5595"

root_block_device = [{
    volume_size = 16
  }
]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
