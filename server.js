var express = require('express');
var app = express();

app.use(require('connect-livereload')({
   port: 35729
 }));

app.use(express.static(__dirname + '/dist'));

app.get('/api/items', function (req, res) {
  setTimeout(function () {
    res.type('json');
    res.send(['foo', 'bar', 'test']);
  }, 1000);
});

app.listen(3000, function () {
  console.log('Server started at localhost:3000');
});
