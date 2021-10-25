//https://developers.line.biz/ja/reference/messaging-api/#send-push-message
const line = require('@line/bot-sdk');

const token = '<access token>'
const userId = '<user id>'

const client = new line.Client({
  channelAccessToken: token
});

const message = {
  type: 'text',
  text: 'Hello World!'
};

client.pushMessage(userId, message)
  .then(() => {
    console.log('push!')
  })
  .catch((err) => {
    // error handling
});