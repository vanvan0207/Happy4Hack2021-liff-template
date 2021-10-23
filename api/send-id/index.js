const line = require('@line/bot-sdk');
const createHandler = require("azure-function-express").createHandler;
const express = require('express');
const myLiffId = process.env.MY_LIFF_ID;

const app = express();

app.get('/api/send-id', function(req, res) {
    res.json({id: myLiffId});
});

module.exports = createHandler(app);