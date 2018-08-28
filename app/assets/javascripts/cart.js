function show_product(product) {
  $('#cart-message').fadeIn('fast', function(){
    $('#cart-message').html(product + ' ' + $(this).data('text'));
    $('#cart-message').delay(2000).fadeOut(); 
  });
}

function show_error_message(message) {
  $('#cart-message').fadeIn('fast', function(){
    $('#cart-message').html(message);
    $('#cart-message').delay(2000).fadeOut(); 
  });
}

function updateCartButton() {
  $('#cart-button').html(Cookies.get('products_count'));
}

function Cart(options) {
  this.cartItems = [];
  var documentCartItems = $('.cart-item');
  this.cartButton = $('#cart-button');
  this.orderButton = options.find('#order-button');
  this.totalPrice = options.find('#total-price');
  for (var i = 0; i < documentCartItems.length; i++) {
    this.cartItems[i] = new CartItem(documentCartItems[i]);
  }

  Cart.prototype.recalculate = function() {
    var quantity = 0;
    var removeElement = -1;
    var totalPrice = 0;
    for (var i = 0; i < this.cartItems.length; i++) {
      var itemQuantity = parseInt(this.cartItems[i].quantity.text());
      if (itemQuantity < 1) {
        this.cartItems[i].self.remove();
        Cookies.remove(this.cartItems[i].cookie);
        removeElement = i;
        var items = $('.cart-index');
        for (var i = 0; i < items.length; i++) {
          items[i].innerHTML = i + 1;
        }
      }
      else {
        quantity += itemQuantity;
        totalPrice += parseInt(this.cartItems[i].price.text()) * itemQuantity;
        Cookies.set(this.cartItems[i].cookie, parseInt(this.cartItems[i].quantity.text()));
      }
    }
    if (removeElement != -1 ) {
      this.cartItems = this.cartItems.splice(removeElement - 1, 1);
    }
    Cookies.set('products_count', quantity);
    this.cartButton.html(quantity);
    this.totalPrice.html(this.totalPrice.data('text')  + ' ' + totalPrice);
    if (quantity == 0) {
      this.orderButton.remove();
    }
  };
}

function CartItem(options) {
  this.self = $(options);
  this.cookie = this.self.data('cookie');
  this.price = this.self.find('#price');
  this.name = this.self.find('#name');
  this.quantity = this.self.find('#quantity');

  this.self.find('.js-button-cart-increase').click(function() {
    var quantity = $(this).prev();
    quantity.html(parseInt(quantity.text()) + 1);
    cart.recalculate();
  });

  this.self.find('.js-button-cart-decrease').click(function() {
    var quantity = $(this).next();
    quantity.html(parseInt(quantity.text()) - 1);
    cart.recalculate();
  });
}

$(document).ready(function() {
  updateCartButton();

  if ($('#cart').length) {
    window.cart = new Cart($('#cart'));
    cart.recalculate();
  }

  $('[data-product-slug]').click(function(event){
    $.post('/products/' + $(this).data('product-slug') + '/buy/', function() { $('#cart-button').html(Cookies.get('products_count'));});
    show_product($(this).data('product-name'));
  });
});