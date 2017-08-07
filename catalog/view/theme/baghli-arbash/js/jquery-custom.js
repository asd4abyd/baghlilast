// JavaScript Document
$(".wish-list").css("border-bottom","solid 2px #e6e7e8");
$(".wish-list").first().css("margin-top","50px");
$(".wish-list").last().css("border-bottom","0px");

$("h6.desc-head").css({"padding-top":"30px","border-top":"solid 2px #f0f0f0"})//for border line in career detail apge descriptions
$("h6.desc-head").first().css({"padding-top":"0px","border-top":"solid 0px"})//for border line in career detail apge descriptions


$(document).ready(function(){
  $(".head").click(function(){
    $(".side-menus-list").toggleClass("animate-class");
    $(".dp-department").toggleClass("fa-sort-asc");
  })




  //gallery gallery gallery
  $(".thub-image ul li img").click(function(){
    var myimage = $(this).attr("src");
    $("#product-detail").attr("src",myimage);
  })
});
