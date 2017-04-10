$(document).ready(function(){
  /* slick carousel setting for index page carousel and product page carousel*/
  $('.single-item').slick({
    dots: true,
    infinite: true,
    autoplay:true,
    speed: 500,
    slidesToShow: 1,
    slidesToScroll: 1,
    responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows:false,
        slidesToShow: 1,
        slidesToScroll: 1,
        infinite: true,
        dots: true
      }
    }
    ]
  });
  
  $('.product-car').slick({
    infinite:false,
    arrows:true,
    speed: 300,
    slidesToShow: 4,
    slidesToScroll: 1,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 375,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 1,
          arrows:false
        }
      }
    ]
  });

$('.product-images').slick({
	variableWidth: true,
    centerMode: true,
  dots: true,
  responsive: [
    {
      breakpoint: 768,
      settings: {
    	variableWidth: true,
        arrows:false,
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: true
      }
    }
    ]
  });

/**
 * Check the validity state and update field accordingly.
 * For login and signup forms
 * @public
 */
MaterialTextfield.prototype.checkValidity = function () {
  if (this.input_.validity.valid) {
      this.element_.classList.remove(this.CssClasses_.IS_INVALID);
  } else {
      if (this.element_.getElementsByTagName('input')[0].value.length > 0) {
            this.element_.classList.add(this.CssClasses_.IS_INVALID);
      }
  }
};

/* login and signup form hide and show on click of a button */
$(".login-button").click(function(event){
  event.preventDefault();
  $("#login-Modal").fadeIn("fast");
  $("#signup-Modal").fadeOut("fast");
});

$("#login-button2").click(function(event){
  event.preventDefault();
  $("#login-Modal").fadeIn("fast");
});

$(".signup-button").click(function(event){
  event.preventDefault();
  $("#signup-Modal").fadeIn("fast");
  $("#login-Modal").fadeOut("fast");
});

$("#signup-button2").click(function(event){
  event.preventDefault();
  $("#signup-Modal").fadeIn("fast");
});

$(".close").click(function(){
  if($("#login-Modal").hasClass('open')){
    $("#login-Modal").fadeOut("fast");
  }
  if($("#signup-Modal").hasClass('open')){
    $("#signup-Modal").fadeOut("fast");
  }
});  


});

$(document).ready(function () {

    // Add body-small class if window less than 768px
    // for admin panel side menu collapse when open on mobile screen size
    if ($(this).width() < 769) {
        $('body').addClass('body-small')
    } else {
        $('body').removeClass('body-small')
    }

    // Minimalize menu
    $('.navbar-minimalize').on('click', function () {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();

    });

// Hide all category pages on product_edit page
$(".mobile-catg").hide();
$(".books-catg").hide();
$(".clothing-catg").hide();
$(".games-catg").hide();

//show mobile category page when click mobile category button click...same for others !
$("#mob-catg").click(function(){
  $(".mobile-catg").show();
  $(".books-catg").hide();
  $(".clothing-catg").hide();
  $(".games-catg").hide();
});

$("#book-catg").click(function(){
  $(".books-catg").show();
  $(".mobile-catg").hide();
  $(".clothing-catg").hide();
  $(".games-catg").hide();
});

$("#cloth-catg").click(function(){
	  $(".books-catg").hide();
	  $(".mobile-catg").hide();
	  $(".clothing-catg").show();
	  $(".games-catg").hide();
});

$("#game-catg").click(function(){
	  $(".books-catg").hide();
	  $(".mobile-catg").hide();
	  $(".clothing-catg").hide();
	  $(".games-catg").show();
});

/* send product data to database using JQuery post ajax method */
var snackbarContainer = document.querySelector('#product-toast');

/* Get all the input field values of product_edit page and send them to total.java using jQuery post request */
 
 $("#mobiles-info-submit").click(function(){
	 /* variables for Plist Table */
	 var productname = $("#product-name").val();
	 var brandname = $("#brand-name").val();
	 var productdesc = $("#product-desc").summernote('code');
	 var metat = $("#meta-title").val();
	 var metad = $("#meta-desc").val();
	 var metakey = $("#meta-key").val();

	 /* varibales for Mobiles Table */
	 var mobrom = $("#rom").val();
	 var mobcolor = $("#color").val();
	 var mobspec = $("#mob-specs").summernote('code');
	 var mobPrice = $("#mob-price").val();
	 var mobUrl = $("#mob-img-url").val();
	 var mobStock = $("#mob-stock").val();
	 var mcatg = $("#mob-catg").val();
      $.post("total",{name:productname,brand:brandname,descrip:productdesc,catg:mcatg,mtitle:metat,mdescrip:metad,mkeyword:metakey,rom:mobrom,color:mobcolor,specs:mobspec,price:mobPrice,photo:mobUrl,stock:mobStock},function(data){
    	  var msg = {message: 'Product Successfully Added'};
  	    snackbarContainer.MaterialSnackbar.showSnackbar(msg);
  	    
        });
    	   
     });
 $("#books-info-submit").click(function(){
	 /* variables for Plist Table */
	 var productname = $("#product-name").val();
	 var brandname = $("#brand-name").val();
	 var productdesc = $("#product-desc").summernote('code');
	 var metat = $("#meta-title").val();
	 var metad = $("#meta-desc").val();
	 var metakey = $("#meta-key").val();
	 /* varibales for Books Table */
	 var bookSpec = $("#book-specs").summernote('code');
	 var bookPrice = $("#book-price").val();
	 var bookUrl = $("#book-img-url").val();
	 var bookStock = $("#book-stock").val();
	 var mcatg = $("#book-catg").val();
      $.post("total",{name:productname,brand:brandname,descrip:productdesc,catg:mcatg,mtitle:metat,mdescrip:metad,mkeyword:metakey,specs:bookSpec,price:bookPrice,photo:bookUrl,stock:bookStock},function(data){
    	  var msg = {message: 'Product Successfully Added'};
  	    snackbarContainer.MaterialSnackbar.showSnackbar(msg);
  	   
        });
    	   
     });
 $("#cloths-info-submit").click(function(){
	 var mcatg = $("#cloth-catg").val();
      $.post("total",{name:productname,brand:brandname,descrip:productdesc,catg:mcatg,mtitle:metat,mdescrip:metad,mkeyword:metakey,specs:mobspec,price:price,photo:iurl,stock:stock},function(data){
    	  var msg = {message: 'Product Successfully Added'};
  	    snackbarContainer.MaterialSnackbar.showSnackbar(msg);
  	    
        });
    	   
     });
 $("#games-info-submit").click(function(){
	 /* variables for Plist Table */
	 var productname = $("#product-name").val();
	 var brandname = $("#brand-name").val();
	 var productdesc = $("#product-desc").summernote('code');
	 var metat = $("#meta-title").val();
	 var metad = $("#meta-desc").val();
	 var metakey = $("#meta-key").val();
	 /* varibales for Miscellaneous Table */
	 var gameSpec = $("#game-specs").summernote('code');
	 var gamePrice = $("#game-price").val();
	 var gameUrl = $("#game-img-url").val();
	 var gameStock = $("#game-stock").val();
	 var mcatg = $("#game-catg").val();
      $.post("total",{name:productname,brand:brandname,descrip:productdesc,catg:mcatg,mtitle:metat,mdescrip:metad,mkeyword:metakey,specs:gameSpec,price:gamePrice,photo:gameUrl,stock:gameStock},function(data){
    	  var msg = {message: 'Product Successfully Added'};
  	    snackbarContainer.MaterialSnackbar.showSnackbar(msg);
  	    
        });
    	   
     });
 



});

