// "abc"[2]
// "abc"[3]
// "abc"[-1]
//
// var s = "bobbi";
// s[4] = "y";
// s

function capitalize(string){
  if (typeof(string) !== "string"){
    return null;
  }
  else{

    return string[0].toUpperCase() + substr(1, string.length);
  }
}

function capitalize_even(string){
  if (typeof(string) !== "string"){
    return null;
  }
  else{

    var stringArray = string.split("");

    for (var i = 0; i < stringArray.length; i ++){
      if (i%2 !== 0 ){
        stringArray[i] = string[i].toUpperCase();
      }
      else{
        stringArray[i] = string[i];
      }
    }

    stringArray.join();
  }
}
