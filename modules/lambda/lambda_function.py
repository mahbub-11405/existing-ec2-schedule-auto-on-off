import boto3
import os
from datetime import datetime

ec2 = boto3.client("ec2")
INSTANCE_IDS = os.environ["INSTANCE_IDS"].split(",")
ACTION = os.environ.get("ACTION","auto")

def lambda_handler(event, context):
    hour = datetime.utcnow().hour

    # START (BD 10AM -> 04 UTC)
    if hour == 4:
        ec2.start_instances(InstanceIds=INSTANCE_IDS)
        return {"action": "auto_start", "instances": INSTANCE_IDS}

    # STOP (BD 8PM -> 14 UTC)
    if hour == 14:
        ec2.stop_instances(InstanceIds=INSTANCE_IDS)
        return {"action": "auto_stop", "instances": INSTANCE_IDS}

    return {"status":"ignored","hour":hour}
