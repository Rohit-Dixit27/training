// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery3
//= require jquery_ujs

  $(function() {
    $(".sort_paginate_ajax").on("click", ".pagination a", function(){
    $.getScript(this.href);
      return false;
    });
  });
  $('#users_search').submit(function(){
    $.get(this.action, $(this).serialize(), null, "script")
  });

