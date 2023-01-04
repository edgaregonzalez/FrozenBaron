# creo la vpc
aws --profile prod ec2 create-vpc --cidr-block 11.0.0.0/16 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=prod-vpc1}]'
# creo la subnet publica
aws --profile prod ec2 create-subnet --vpc-id vpc-063a73cd3904a7685 --cidr-block 11.0.0.0/24 --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=prod-subnet-public}]'
# creo la subnet privada
aws ec2 create-subnet --vpc-id vpc-063a73cd3904a7685 --cidr-block 11.1.0.0/24 --availability-zone us-east-1a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=prod-subnet-private}]'
# creo el internet gateway
aws --profile prod ec2 create-internet-gateway --dry-run --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=prod-igw}]'   
# atachar el internet gateway a la vpc
aws --profile prod ec2 attach-internet-gateway --internet-gateway-id igw-00cd106955da165d8 --vpc-id vpc-063a73cd3904a7685
# crear la tabla de ruteo
aws --profile prod ec2 create-route-table --vpc-id vpc-063a73cd3904a7685 --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=prod-route-table}]'
# crear la ruta
aws --profile prod ec2 create-route --route-table-id rtb-0cf7bfa42ba5e80de --destination-cidr-block 0.0.0.0/0 --gateway-id igw-00cd106955da165d8
# asociar la tabla de ruteo a la subnet publica
aws --profile prod ec2 associate-route-table --route-table-id rtb-0cf7bfa42ba5e80de --subnet-id subnet-0b6b688ebf1ecd089
