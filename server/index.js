const express = require('express');
var http = require('http');
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const mongoose = require('mongoose');

var io = require('socket.io')(server);

//middleware
app.use(express.json());
//connecting to database
const DB =
  'mongodb+srv://prajjawal12:1234@cluster0.vuqccf9.mongodb.net/?retryWrites=true&w=majority';

mongoose
  .connect(DB)
  .then(() => {
    console.log('Connection to database succesful!!');
  })
  .catch((e) => {
    console.log(error);
  });
server.listen(port, '0.0.0.0', () => {
  console.log(`Server started and running on port ${port}`);
});
