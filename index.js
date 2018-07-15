var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
io.emit('some event', { for: 'everyone' });
app.set('port', process.env.PORT || 3000);
app.get('/', function(req, res){
  res.sendFile(__dirname + '/chat.html');
});

io.on('connection', function(socket){
    socket.broadcast.emit('hi');
  });
  io.on('connection', function(socket){
    socket.on('chat message', function(msg,nike){
        msg = nike+" said: "+msg;
	console.log(msg);
        io.emit('chat message', msg);
    });
  });
var server = http.listen(app.get('port'), function(){
  console.log('listening on '+app.get('port'));
});
    