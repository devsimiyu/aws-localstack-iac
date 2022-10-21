exports.handler = async function (event, context) {
    console.log("INTACCT LAMBDA EVENT:", Date.now());
    console.table(JSON.stringify(event.payload, null, 2));
};
