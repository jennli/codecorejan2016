var readline = require("readline");
var net = require("net");

var rl = readline.createInterface({
  input : process.stdin,
  output: process.stdout
});

var client = new net.Socket();
client.connect(5000, "127.0.0.1", function(){
  console.log("=== client is connected to server ===");
});

client.on("data", function(response){
  if(response.toString().match(/good work/)!== null){
    console.log("From Server: " + response);
    process.exit();
  }
  else{
    console.log("From Server: " + response);
    rl.question("Please enter your guess: \n", function(data){
      if(data == "")
      {
        client.write("0");
      }
      else
      client.write(data);
    });
  }
});

client.on("close", function() {
  console.log("=== Connection closed ===");
  process.exit();
});
