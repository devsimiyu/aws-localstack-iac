exports.handler = async function (event, context) {
    console.log("NEW EVENT:", Date.now());
    console.table(JSON.stringify(event, null, 2));
    return {
        "statusCode": 201,
        'headers': {
            "Access-Control-Allow-Origin": "*"
        },
        "body": JSON.stringify({
            "message": "hello world"
        }),
    };
};
