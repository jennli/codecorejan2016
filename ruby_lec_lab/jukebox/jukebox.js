document.addEventListener("DOMContentLoaded", function(event){

  var input = prompt("enter your notes");
  var song = parseSong(input);

  var onComplete = function () {
    input = prompt("Good job! Play another song please!");
    song = parseSong(input);
    playSong(song, 400, onComplete);
    // console.log('Song finished playing');
  }
  playSong(song, 400, onComplete);
})



function parseNote (string){

  var inputArray = string.split("*");
  var noteObj = {
    pitch: inputArray[0],
    beats: 1
  };

  if (inputArray.length > 1)  {
    noteObj.beats = inputArray[1];
  }

  return noteObj;
}
//
function parseSong (input){
  var arr = input.split(" ");
  var songArray = [];

  for (var i = 0; i < arr.length; ++i){
    songArray.push(parseNote(arr[i]));
  }
  return songArray;
}
