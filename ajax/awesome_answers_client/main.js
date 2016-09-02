$(document).ready(function(){

  var listQuestions = function(){
    $.ajax({
      url: "http://localhost:3000/questions.json",
      method: 'get',
      error: function(){
        alert('please reload');
      },
      success: function(questions){
        $('#questions').html('');
        for(var i = 0; i < questions.length; ++i){
          //Fetching the Mustache template for a question listing
          var template = $('#question-listing').html();

          // Mustache.render takes in a mustache template and a javascript object
          // generates valid html by replacing any variables within {{}}
          // so if you have {{title}}, it will be replaced with  'question[i].title'
          var renderedHtml = Mustache.render(template,questions[i]);
          $('#questions').append(renderedHtml);
        }
      }
    });
  };

  var showQuestionDetail = function(questionLink){
    $.ajax({
      url: 'http://localhost:3000/questions/' + questionLink.data('id') + '.json',
      method: 'get',
      error: function(){
        alert('question failed to load');
      },
      success: function(questions){
        // console.log(question);
        var template = $('#question-details').html();
        var renderedHtml = Mustache.render(template, questions);
        $('#question-details-container').html(renderedHtml);
        $('#question-details-container').hide();
        $('#questions').fadeOut(700, function(){
          $('#question-details-container').fadeIn(700);
        });
      }
    });
  };

  listQuestions();

  $('#questions').on('click', 'a', function(){
    showQuestionDetail($(this));
  });

  $("#question-details-container").on("click", "#back", function(){
    $("#question-details-container").fadeOut(400, function(){
      $("#questions").fadeIn(400);
    });
  });

  $("#question-details-container").on("click", "#show-answers", function(){

    if(!$('#show-answers').hasClass('clicked')){
      $('#answers-container').empty();
      $('#answers-container').fadeIn();
      var questionId = $("#show-answers").data('qid');
      $.ajax({
        url: 'http://localhost:3000/questions/' + questionId + '/answers.json',
        method: 'get',
        error: function(){
          alert('answer failed to load');
        },
        success: function(answers){
          // console.log(questionAndAnswers);
          var template = $('#answer').html();
          for(var i = 0; i < answers.length; ++i){
            var renderedHtml = Mustache.render(template, answers[i]);
            $('#answers-container').append(renderedHtml);
          }

          $('#show-answers').html("Hide Answers");
          $('#show-answers').addClass('clicked');
        }
      });
    }

    else{
      $('#answers-container').fadeOut('400', function() {
        $('#show-answers').html("Show Answers");
        $('#show-answers').removeClass('clicked');
      });
    }

  });


});
