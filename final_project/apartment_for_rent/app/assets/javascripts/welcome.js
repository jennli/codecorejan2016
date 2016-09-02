$(document).ready(function() {

  $("#search-button").on("click", function(e){
    e.preventDefault();
    $("#msg").remove();

    if($("#destination").val()===""){
      $("#destination").addClass("search-error");
      $("#destination").prepend( "<p id='msg'>Must enter destination</p>");
    }

    else{

      $("#destination").removeClass("search-error");
      $.ajax({
        
      });
      $("html, body").scrollTop($("#listings").offset().top);
    }
  });

});
