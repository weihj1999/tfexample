module "pgrds" {
  source = "./pgrds"
  region="eu-de"
  tenant_name="eu-de"
  #db_flavor="db.c2.xlarge"
  db_flavor="rds.pg.c2.xlarge"
  db_name="pg-rds-test"
  db_type="PostgreSQL"
  db_version="9.5.5"
  db_port="8635"
  db_passwd="Test@1234**!"
  secgroup_name="pg-rds-test"
  vpc_id = "fb729be9-6d41-4823-a32b-f97c207f1f9b"
  existing_private_net_id = "898db3a7-5aa0-42ed-8186-0888b6195cdc"
  availability_zone ="eu-de-02"
}

module "mysqlrds" {
  source = "./mysqlrds"
  region="eu-de"
  tenant_name="eu-de"
  db_flavor="rds.mysql.m1.2xlarge"
  db_name="mysql-rds-test"
  db_type="MySQL"
  db_version="5.7.20"
  db_port="8635"
  db_passwd="Test@1234**!"
  secgroup_name="mysql-rds-test"
  vpc_id = "fb729be9-6d41-4823-a32b-f97c207f1f9b"
  existing_private_net_id = "898db3a7-5aa0-42ed-8186-0888b6195cdc"
  availability_zone ="eu-de-02"
}

module "mssqlrds" {
  source = "./mssqlrds"
  region="eu-de"
  tenant_name="eu-de"
  db_flavor="rds.mssql.s1.xlarge"
  db_name="mssql-rds-test"
  db_type="SQLServer"
  #db_type="Microsoft SQL Server"
  db_version="2014 SP2 SE"
  db_port="8433"
  db_passwd="Test@1234**!"
  secgroup_name="mssql-rds-test"
  vpc_id = "fb729be9-6d41-4823-a32b-f97c207f1f9b"
  existing_private_net_id = "898db3a7-5aa0-42ed-8186-0888b6195cdc"
  availability_zone ="eu-de-02"
}


