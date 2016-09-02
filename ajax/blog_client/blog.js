$(document).ready(function(){

  $.ajax({
    url:"http://localhost:3001/posts.json",
    method: "get",
    error: function(){
      alert("reload");
    },
    success: function(posts){
      $('#posts').html('');
      var length = posts.length;
      var template = $("#post-listing").html();
      for(var i = 0; i <length; ++i){
        var renderedHtml = Mustache.render(template, posts[i]);
        $('#posts').append(renderedHtml);
      }
    }
  });

  $("#post-container").hide();

  $('#posts').on('click', 'a', function(){

    $('#posts').fadeOut(400, function(){
      $("#post-container").fadeIn(400);
    });

    var pid = $(this).data('id');
    $.ajax({
      url:"http://localhost:3001/posts/" + pid + ".json",
      method: "get",
      error: function(){
        alert("reload");
      },
      success: function(postAndComments){
        var post = postAndComments.post;
        var comments = postAndComments.comments;

        var postTemplate = $("#post-detail").html();
        var postRenderedHtml = Mustache.render(postTemplate, post);

        $("#post-container").append(postRenderedHtml);

        var commentTemplate = $("#comment-detail").html();

        for(var i = 0; i < comments.length; ++i ){
          var commentRenderedHtml = Mustache.render(commentTemplate, comments[i]);
          $('#comments').append(commentRenderedHtml);
        }
      }
    });
  });

  $("#post-container").on('click', '#back', function(){
    $("#post-container").empty();
    $('#post-container').fadeOut(400, function(){
      $('#posts').fadeIn();
    });
  });

  $("input[type='submit']").on('click', function(e){
    e.preventDefault();
    var commentInput = $('textarea').val();
    var pid = $('textarea').data('pid');

    $.ajax({
      url:"http://localhost:3001/posts/" + pid + "/comments.json",
      method: "post",
      error: function(){
        alert('comment failed');
      },
      success: function(){
        
      }
    });

  });

});
