var net = require("net");

var Game = function(){
  this.randy = Math.floor((Math.random() * 100) + 1);
  this.trials = 0;
};

var guessNumber = function(input, game){
  console.log(input);
  var correct = false;
  game.trials += 1;

  if(input === game.randy){
    return "good work! you guessed in "+ game.trials+ " tries!";
  }
  else if(input > game.randy){
    return "Your number is too high, try again!";
  }
  else {
    return "your number is too low, try again";
  }
};

var server = net.createServer(function(socket){
  socket.game = new Game();
  socket.write("A random number between 1 and 100 has been generated, can you guess what number it is?");
  socket.on("data", function(input){
    socket.write(guessNumber(parseInt(input), socket.game));
  });
});

server.listen(5000, "127.0.0.1");
