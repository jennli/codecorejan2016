var readline = require ("readline");
var net = require ("net");

var rl = readline.createInterface({

  input: process.stdin,
  output: process.stdout

});

rl.question("Give me a word!", function(word){
    var client = new net.Socket();

    client.on("data",  function(data){
      console.log("from server:  " + data);
      process.exit();
    });

    client.connect(5001, "127.0.0.1", function(){
      client.write(word);

    // client.connect(5001, "127.0.0.1", function(){
    //   client.write(word);
    });

} );
