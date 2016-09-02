var net = require ("net");

var reverse = function(str){
  var result = '';
  for(var i = str.length-1; i >=0; --i){
    result += str[i];
  }
  return result;
};

var server = net.createServer(function(socket){

  socket.on("data", function(word){
    console.log("data recieved: "+ word);
    socket.write(reverse(word.toString()));
  });
});

server.listen(5001, "127.0.0.1");
