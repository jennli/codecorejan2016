var readline = require("readline");
var net = require("net");

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("give me some numbers separated by ',': ",function(nums){

  var client = new net.Socket();
  client.on("data", function(data){

    console.log("From Server: "+ data);
    process.exit();

  });

  client.connect(5002, "127.0.0.1",function(){
    client.write(nums);
  });
} );
