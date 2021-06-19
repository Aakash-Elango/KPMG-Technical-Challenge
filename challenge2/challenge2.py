"""
This code will query the meta data of an instance 
"""
from ec2_metadata import ec2_metadata

def ec2_data(data):
    print(getattr(ec2_metadata,data))
ec2_data("region")
ec2_data('ami_id')
