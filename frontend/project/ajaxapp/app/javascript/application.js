// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery3
//= require jquery_ujs

$(document).ready(function(){
  $(function() {
    $(".sort_paginate_ajax").on("click", ".pagination a", function(){
    $.getScript(this.href);
      return false;
    });
  });
});

