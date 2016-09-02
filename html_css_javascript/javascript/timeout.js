// setTimeout(function(){
//   document.write("Hello World");
// }, 5000);

// document.write("Ready...")
// setTimeout(function(){
//     document.write("set...");
//     setTimeout(function(){
//         document.write("go!");
//     }, 1000);
// }, 1000);

// var x = function (){
//   console.log(".");
//   setTimeout(x, 1000)
// };
//
// x();

setInterval(function(){
  console.log("Hello World");
}, 1000);

var count = 0;
setInterval(function(
  console.log(count++);
), 1000);
