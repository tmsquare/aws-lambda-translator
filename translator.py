import json

import logging
import boto3
import os

def lambda_handler(event, context):

    translate = boto3.client(service_name='translate', region_name='eu-west-1', use_ssl=True)
    body = json.loads(event["body"])

    try:
        source_language = body['source_language']
    except:
        source_language = "auto"

    try:
        target_language = body['target_language']
    except:
        target_language = "fr"

    try:
        text = body['text']
    except:
        text = "Enter a text"

    result = translate.translate_text(Text=text, SourceLanguageCode=source_language, TargetLanguageCode=target_language)

    return {
        'statusCode': 200,
        'body': json.dumps(result.get('TranslatedText'))
    }

