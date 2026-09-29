import json
import os
import boto3

table = boto3.resource("dynamodb").Table(os.environ["TABLE_NAME"])

def handler(event, context):
    resp = table.update_item(
        Key={"id": "visits"},
        UpdateExpression="ADD visit_count :inc",
        ExpressionAttributeValues={":inc": 1},
        ReturnValues="UPDATED_NEW",
    )
    count = int(resp["Attributes"]["visit_count"])
    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps({"visits": count}),
    }