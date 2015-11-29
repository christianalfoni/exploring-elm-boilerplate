var express = require('express');
var app = express();

app.use(require('connect-livereload')({
   port: 35729
 }));

app.use(express.static(__dirname + '/dist'));

app.listen(3000, function () {
  console.log('Server started at localhost:3000');
});
