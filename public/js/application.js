function errors() {
  if ($.trim($("#title").val()) === "") {
        alert('Fill out the name field or we will throw a orange-a-thang at you!');
  }
  else if ($.trim($(".choices").val()) === "") {
      alert('Orange-a-thang is angry you have an empty choice field');
  }
  else if ($.trim($(".questions").val()) === "") {
      alert('Orange-a-thang will poke you if you do not fill empty question fields!');
  }
}

$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  $(".add-question").on("click", function(event) {
    event.preventDefault();
    var question_list = $(this).siblings("ol")
    var request = $.get("/questions/new");
    request.done(function(question){
      $(question_list).append(question);
    })
  });

  $("#question-list").on("click", ".add-choice", function(event) {
    event.preventDefault();
    var choices_list = $(this).siblings("ol");
    var request = $.get("/choices/new");
    request.done(function(choice){
      $(choices_list).append(choice);
    });
  });

  $('form').on('click', "#save", function(event) {
    event.preventDefault();

    // var request = $.post("/surveys")
    errors();
    
    // request.done(function(){
    //   $(this).serialize()
    // })
    $(this).submit();
    // window.location.replace(response);
    // $.post( "/surveys", $(this).serialize() );
     
    
  });


});


