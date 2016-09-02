var readline = require("readline");
var net = require("net");

var rlInterface = readline.createInterface({
  input:process.stdin,
  output:process.stdout
});

rlInterface.question("What is your name?", function(name){

  var client = new net.Socket();
  client.on("data", function(){
    console.log("From Server: "+ data);
    process.exit();
  });

  client.connect(5000, "127.0.0.1", function(){
    client.write(name);
  });
});
