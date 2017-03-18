$(document).ready(function(){
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
  
  $('.product-carousel').slick({
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
  dots: true,
  responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows:false,
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: true
      }
    }
    ]
  });

$("#login-button").click(function(event){
  event.preventDefault();
  $("#login-Modal").fadeIn("fast");
});

$("#login-button2").click(function(event){
  event.preventDefault();
  $("#login-Modal").fadeIn("fast");
});

$("#signup-button").click(function(event){
  event.preventDefault();
  $("#signup-Modal").fadeIn("fast");
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