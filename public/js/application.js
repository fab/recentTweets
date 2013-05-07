$(document).ready(function() {
  $('form.tweetfind').on('submit', function(e){
    e.preventDefault();
    $('.hidden').hide();
    $(this).after('<div class="loader"><img src="../images/loader.gif"></div>');
    var data = $(this).serialize();
    $.post('/', data)
      .done(function(response){
        console.log(response);
        $('.loader').remove();
        $('form.tweetfind').after('<div class="hidden">'+response+'</div>');
      });
  });
});
