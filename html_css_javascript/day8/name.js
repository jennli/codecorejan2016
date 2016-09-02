// this is a short javscript for showing "Jennifer Li" and "haha" on the page

document.addEventListener("DOMContentLoaded", function(event){
  var name = "Bob";
  var three = 3;
  var four = 4;
  var product = three * four;
  console.log("Hello, " + name + "! In case you forgot, "+ three + " x " + four + " is " + product + ".");

  // var outputDiv1 = document.getElementById("output1");
  // outputDiv1 = alert("alerting!");
  //
  // var outputDiv2 = document.getElementById("output2");
  // var name = prompt("please enter your name");
  // alert("hello " + name + "!");
  // outputDiv2.innerHTML = name;

  // var keepLooping = true;
  //
  // while (keepLooping){
  //
  //   password = prompt("please enter password: ");
  //   if (password.length > 12)
  //   alert("too long!");
  //   else if (password.length < 12)
  //   alert("too short!");
  //   else {
  //     alert("just right!");
  //     keepLooping = false;
  //   }
  // }


var userSelection = confirm("Welcome to super-safe! Are you sure you want to enter?");

if (userSelection == true){
  alert("entering safe...");
}
else {
  alert("Okay, goodbye then.");
}

})
