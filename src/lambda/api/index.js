const AWS = require('aws-sdk');
const AWS_TOPIC_INTACCT = 'intacct';
const AWS_TOPIC_PROCORE = 'procore';

exports.handler = async function (event, context) {
    AWS.config.update({
        region: process.env.AWS_REGION
    });
    const {
        topic,
        message
    } = JSON.parse(event.body);
    let topicArn;
    switch (topic) {
        case AWS_TOPIC_INTACCT:
            topicArn = process.env.AWS_TOPIC_INTACCT
            break;
        case AWS_TOPIC_PROCORE:
            topicArn = process.env.AWS_TOPIC_PROCORE
            break;
        default:
            topicArn = '';
            break;
    }
    const notification = await new AWS.SNS({
        endpoint: 'http://localhost:4566'
    })
    .publish({
        Message: JSON.stringify(message),
        TopicArn: topicArn
    })
    .promise();
    console.log('API LAMBDA EVENT:', Date.now());
    console.table(JSON.stringify(notification, null, 2));
    return {
        'statusCode': 201,
        'headers': {
            'Access-Control-Allow-Origin': '*'
        },
        'body': JSON.stringify(notification),
    };
};
