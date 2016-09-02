$(document).ready(function() {
  $.ajax({
    url: "http://localhost:3000/courses.json",
    method: "get",
    error: function(){
      alert("error");
    },
    success: function(res){
      $('#courses').html('');
      // $('#courses').hide();
      var courses = res.courses;
      for(var i=0; i < courses.length; ++i){
        var template = $('#course-list').html();
        var renderedHtml = Mustache.render(template, courses[i]);
        $('#courses').append(renderedHtml);
        $('#courses').addClass('animated fadeInLeft');
      }
    }
  });

});
