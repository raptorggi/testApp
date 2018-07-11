// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require js.cookie
//= require_tree .

function make_order() {
  var order = 0;
  $('[data-product-price]').each (function () {
    order += parseInt($(this).data('product-price')) * parseInt(Cookies.get($(this).data('cookie-product')));
  });
  $('#order').html('Итог: ' + order);
}

function update_cart(count) {
  Cookies.set('products_count',  parseInt(Cookies.get('products_count')) + count);
  $('#cart-button').html(Cookies.get('products_count'));
}

function show_product(product) {
  $('#cart-message').fadeIn('fast', function(){
    $('#cart-message').html(product + " добавлен в корзину");
    $('#cart-message').delay(2000).fadeOut(); 
  });
}

function update_cart_index() {
  var index = 1;
  $('.cart-index').each (function () {
    $(this).html(index);
    index += 1;
  });
}

$(document).ready(function(){
  make_order();

  $('[data-product-slug]').click(function(event){
    $.post('/products/' + $(this).data('product-slug') + '/buy/', function() {$('#cart-button').html(Cookies.get('products_count'));});
    show_product($(this).data('product-name'));
    console.log("test");
  });  

 $('.js-button-cart-minus').click(function(event){
    if (Cookies.get($(this).data('cookie-product')) == 1) {
      $("[data-cookie-product='" + $(this).data('cookie-product') + "']").remove();
      Cookies.remove($(this).data('cookie-product'));
      update_cart_index();
    }
    else {
      Cookies.set($(this).data('cookie-product'),  parseInt(Cookies.get($(this).data('cookie-product'))) - 1);
      var id = String($(this).data('cookie-product'));
      $('#'.concat(id)).html(Cookies.get(id));
    }
    update_cart(-1);
    make_order();
  });

  $('.js-button-cart-plus').click(function(event){
    Cookies.set($(this).data('cookie-product'),  parseInt(Cookies.get($(this).data('cookie-product'))) + 1);
    var id = String($(this).data('cookie-product'));
    $('#'.concat(id)).html(Cookies.get(id));
    update_cart(1);
    make_order();
  });
});

