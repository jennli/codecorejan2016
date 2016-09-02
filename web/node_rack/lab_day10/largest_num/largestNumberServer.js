var net = require("net");

var maxNum = function(input)
{
  var string = input.toString();
  var array = string.split(",");
  for(var c =0; c<array.length; ++c){
    value = parseInt(array[c]);
    array[c] = value;
  }

  return Math.max(...array);

};

var server = net.createServer(function(socket){
  socket.on("data", function(input){
    console.log("data recieved: " + input);

    socket.write("Maximum value in " + input + " is: "+maxNum(input));
  });

});

server.listen(5002, "127.0.0.1");
