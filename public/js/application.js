function newFields(array){
  for (i=0; i<array.length; i++){
    
    if (array[i].val().length > 0){
      return array[i].val()
    }
    else {
      return "no blank fields"
    }
  }
}

function errors() {
  if ($.trim($("input#title").val()) === "") {
    alert('Fill out the name field or we will throw a orange-a-thang at you!');
    return true;
  }
  else if ($.trim($(".choices").val()) === "") {
    alert('Orange-a-thang is angry you have an empty choice field');
    return true;
  }
  else if ($.trim($("input.questions").val()) === "") {
    alert('Orange-a-thang will poke you if you do not fill empty question fields!');
    return true;
  }

};

$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  $(".add-question").on("click", function(event) {
    event.preventDefault();
    var questions_list = $(this).siblings("ol")
    var request = $.get("/questions/new");
    request.done(function(question){
      $(question).hide().appendTo(questions_list).show("fast");
    })
  });

  $("#question-list").on("click", ".remove-question", function(event){
    $(this).parent().remove();
  });

  $("#question-list").on("click", ".add-choice", function(event) {
    event.preventDefault();
    var choices_list = $(this).siblings("ol");
    var request = $.get("/choices/new");
    request.done(function(choice){
      $(choice).hide().appendTo(choices_list).show("fast");
    });
  });

  $("#question-list").on("click", ".remove-choice", function(event) {
    event.preventDefault();
    $(this).parent().remove();
  });

  $("input#save").on('click', function(event) {
    if (errors()===true){event.preventDefault();}
  });
});


