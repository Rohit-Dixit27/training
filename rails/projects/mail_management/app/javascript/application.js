// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


$(document).ready(function() {
  var counter = 0;
  $('.user-select-check').on('click',function(){
      if($(this).prop('checked')){
        counter+=1;
        $("#btn-delete").show();
      }else
      {
        counter-=1;
        if(counter==0)
        {
            $("#btn-delete").hide();
        }
      }

  });
  $("#btn-delete").on('click', function(){
    var userIds = [];
    $('.user-select-check').each(function(){
        if($(this).prop('checked')){
            userIds.push($(this).data('user-id'))
        }
    });
    $.ajax({
      url: 'users/destroy_multiple',
      type: 'DELETE',
      data: { user_ids: userIds}
    });
  });

});