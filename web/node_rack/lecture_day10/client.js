// Hello there hey
var readline = require("readline");
var net      = require("net");

// This will create an interface object that help us interact
// with the command line
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// This is similar to doing (in Ruby):
// print "What is your name"
// name = gets.chomp
// puts "Hello " + name
rl.question("What is your name? ", function(name){
  console.log("Hello " + name);

  // conncting to the server running on 127.0.0.1 and port 5000
  var client = new net.Socket(); // creating a client object to connect to the server

  // registering a callback function to be executed when data is received
  // from the server
  client.on("data", function(data){
    console.log("Data received: " + data);
    // this will exit the node application
    process.exit();
  });

  // establishing the connection to the server. And sending the name to the
  // server when the connection is established
  client.connect(5000, "127.0.0.1", function(){
    client.write(name);
  });

});
