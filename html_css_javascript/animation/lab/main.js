$(document).ready(function(){
  // Slide 17
  // $("li").eq(0).css("border-width");
  // $("li").first().css("border-width");
  // $("#list-item-1").css("border-width");
  //
  // $("li").css("border-color", "red");
  //
  // $("li").click(function(){
  //   $(this).css("border-width", "1 0px");
  // });

  // $("#rocket").click(function(){
  //   $(this).css("left", parseInt($(this).css("left")) + 10 + "px");
  // });

  // Slide 18
  // $(document).click(function(e){
  //   $("#rocket").css({top: e.pageY, left: e.pageX});
  // });

  // Slide 22
  // $("#rocket").addClass("big");
  // $("#rocket").removeClass("big");
  //
  // $("#list-item-1").addClass("red-border");
  // $("#list-item-1").removeClass("red-border");

  // setInterval(function(){
  //   $("#rocket").css("left", parseInt($("#rocket").css("left")) + 1 + "px");
  // }, 30);

  // Slide 28
  // setInterval(function(){
  //   $("#rocket").css({width: parseInt($("#rocket").css("width")) + 1 + "px"})
  // }, 5);
  // setInterval(function(){
  //   $("#rocket").css({bottom: parseInt($("#rocket").css('bottom')) + 1 + "px"});
  // }, 30);

  // Slide 31
  // $("#list-item-1").fadeOut(1000, function(){
  //   $("#list-item-2").fadeOut(2000, function(){
  //     $('#list-item-3').fadeOut(3000);
  //   });
  // });

  // $('#button-1').on("click", function(e){
  //   $('#rocket').toggleClass('btn-1');
  // });
  //
  // $('#button-2').on("click", function(e){
  //   $('#rocket').toggleClass('btn-2');
  // });
  //
  // $('#rocket').on("click", function(e){
  //   $('#rocket').toggleClass('click');
  // });


  // $(document).on("click", function(event){
  //   console.log("X: " + event.clientX + "Y: " + event.clientY);
  //   $(".ball").css({left: event.clientX - 50 + "px", top: event.clientY - 50 + "px"});
  // });
  //
  // $("#list-1").sortable({ axis: "y", connectWith: "#list-2" });
  // $("#list-2").sortable({ axis: "y", connectWith: "#list-1" });

  $(document).on('click', function(){
    $('#rocket').toggleClass('animated');
  })

});
