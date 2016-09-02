var net = require("net");

var server = net.createServer(function(socket){
  socket.on("data", function(data){
    console.log("Data received: " + data);
    socket.write("Roger.." + data);
  });
});

console.log("Server is running and listening on port 5000");
// This will make the server listen on ip address 127.0.0.1 and port 5000
// Listening is like going in an infinite loop checking for any new TCP data
// received for ip 127.0.0.1 and port 5000
server.listen(5000, "127.0.0.1");
