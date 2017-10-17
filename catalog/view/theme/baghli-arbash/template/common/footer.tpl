<?php // print_r($faq_manager); ?>
<footer>
    	<div class="container">
        <div class="row">
        	<div class="col-md-4 subscribe">
                <div class="newsletter_msg" id="subscription_msg"></div>
            	<h2><?= $text_follow?></span><!--SUBSCRIBE <span>NEWSLETTER</span>--></h2>
                <form action="" method="post">
                    <div class="input-prepend"><span class="add-on"><i class="icon-envelope"></i></span>
                        <input type="text" id="newsletter" name="newsletter" placeholder="<?=$e1?>" class="form-control" >
                    </div>
                    <br />
                    <input type="submit" id="subscription_newsletter" class="btn" value="<?= $sub?>" />
              </form>
            </div>
            <div class="col-md-4 qck-links">
            	<h2><?=$text_quick?> <br><span><?=$text_link?> </span></h2>
                <ul class="ft-link">
                    <li><a href="<?php echo $sitemap_href; ?>"><?php echo $text_sitemap; ?></a></li>
                    <?php 
$i=0;
$cnt=sizeof($informations);
foreach ($informations as $information) {
// print_r($information);

?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>  
<?php
}
?>

				
				
    <li><a href="<?php echo $tips_advices ?>"> <?= $tips ?> </a></li> <!-- add url to footer.php -->
  <!--   <li><a href="<?php echo $wholsale ?>"><?= $WHOLESALE ?></a></li> <!-- add url to footer.php -->
    <li><a href="<?php echo $careers ?>"><?= $careers1 ?></a></li> <!-- add url to footer.php -->

	<?php if($faq_manager_status) { ?>
					<li><a href="<?php echo $faq_manager; ?>"><?php echo $text_faq_manager; ?></a></li>
				<?php } ?>
                </ul>
            </div>

            <div class="col-md-4">
            	<h2><?= $soci ?></h2>
                <ul class="social">
                    <li><a href="https://twitter.com/albaghli_arbash"><img src="catalog/view/theme/baghli-arbash/images/twit.png" alt=""></a></li>
                    <li><a href="https://www.instagram.com/albaghli_alarbash/"><img src="catalog/view/theme/baghli-arbash/images/insta.png" alt=""></li>
                    <li><a href="https://www.facebook.com/profile.php?id=100011131723716"><img src="catalog/view/theme/baghli-arbash/images/fb.png" alt=""></a></li>
                </ul>

                <div class="payment">
                <h2><?= $PAYMENT?> <br><span><?=$METHODS?></span></h2>
                <ul>
               		<li><img src="catalog/view/theme/baghli-arbash/images/knet.png" alt=""></li>
                    <li><img src="catalog/view/theme/baghli-arbash/images/card.png" alt=""></li>
                    <li><img src="catalog/view/theme/baghli-arbash/images/visa.png" alt=""></li>
                </ul>
                </div>
            </div>
            </div>
        </div>

        <div class="copyright">
        	Copyright 2017  © Al-Baghli & Al-Arbash int’l Co W.L.L. .  All rights reserved. <br>
			Powered By <i><a target="_blank" href="http://mawaqaa.com/"><img src="catalog/view/theme/baghli-arbash/images/mawaqaa.png" alt=""></a></i>
        </div>

    </footer>

    <!-- Return to Top -->
<a href="javascript:" id="return-to-top"><i class="icon-chevron-up"><img src="catalog/view/theme/baghli-arbash/images/backtotop.png" alt=""></i><?= $backto?> </a>



    <script>

        function showOptions_innerproduct(s , imgsrc){
            //
            $("#xzoom-default").attr("src",imgsrc);
            $("#xzoom-default").attr("xoriginal",imgsrc);
            var selectedop = $(s).val() ;// get value
            $.ajax({

                url: 'index.php?route=product/category/getAlldata',
                type: 'post',
                data: {selectedop:selectedop},
                datatype:'json',
                success: function(data) {
                    // $('.cart-h4').html(data['points']);

                    try {
                        // console.log(JSON.parse(data)["title"]);
                        var title = JSON.parse(data)["title"];
                        var desc = JSON.parse(data)["description"];

                        var titleArray=title.split(',');
                        if (titleArray[1] === undefined) {
                            var article ='Article #:'+'';
                        }else{
                            var article ='Article #:'+titleArray[1];
                        }
                        if (titleArray[0] === undefined)
                        {
                            var alternativetitle = '';
                        }else{
                            var alternativetitle = titleArray[0];
                        }

                        $('#product-title').html(alternativetitle);
                        $('#mod-no').html(article);
                        $('#desc').html(desc);

                    }
                    catch(err) {
                        document.getElementByClassName(".cart-h4").innerHTML = err.message;
                    }



                },
                error: function(err) {
                    alert(err);
                },

            });


        }










        $(function() {
        if($('#example').length!=0)
        $('#example').vTicker();
});

    $(document).ready(function() {

  $("#banner").owlCarousel({
      navigation : true, // Show next and prev buttons
      slideSpeed : 300,
      paginationSpeed : 400,
	  navigationText:false,
      singleItem:true,
	  pagination : false

      // "singleItem:true" is a shortcut for:
      // items : 1,
      // itemsDesktop : false,
      // itemsDesktopSmall : false,
      // itemsTablet: false,
      // itemsMobile : false

  });

  $("#new-arrival").owlCarousel({

      autoPlay: false, //Set AutoPlay to 3 seconds
      items : 3,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3],
	  navigationText:false,
	  navigation : true,
	  pagination : false

  });
  $("#featured-prod").owlCarousel({

      autoPlay:false, //Set AutoPlay to 3 seconds
      items : 2,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3],
	  navigationText:false,
	  navigation : true,
 	  pagination : false
  });

  $("#partners").owlCarousel({

      autoPlay: 3000, //Set AutoPlay to 3 seconds
      items : 3,
	  itemsDesktop : [1000,3], //5 items between 1000px and 901px
      itemsDesktopSmall : [900,3], // betweem 900px and 601px
      itemsTablet: [720,2], //2 items between 600 and 0
	  pagination : true,


  });

  $("#bst-sllr").owlCarousel({

      autoPlay: false, //Set AutoPlay to 3 seconds
      items : 3,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3],
	  navigationText:false,
	  navigation : true,
	  pagination : false

  });


  $("#innerbanner").owlCarousel({
      navigation : true, // Show next and prev buttons
      slideSpeed : 300,
	  autoPlay : true,
      paginationSpeed : 400,
	  navigationText:false,
      singleItem : true,
	  pagination : false



  });

      
        
      /* Validation for the login popup updated on 05-04-2017 */
 $(document).ready(function(){
     $('#popup_login').on("click",function(e){
         e.preventDefault();
         $('#login-error-msg').hide();
         //popup_login
        // var log_email=$('#input_email_login').val();
        // alert(log_email);
       //   $('#input-password').val();
            if($('#input_email_login').val()=='')
            {
             //alert("Please enter the email id");
                
                var error_email='<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $email_error_login;?></div>';
                $('#login-error-msg').html(error_email);
                 $('#login-error-msg').show();
              $('#input_email_login').focus();  
            }
         else if($('#input_password_login').val()=='')
         {
             //alert("Please enter the password");
               var error_pass='<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $password_error_login;?></div>';
              $('#login-error-msg').html(error_pass);
                 $('#login-error-msg').show();
             $('#input_password_login').focus();
         }
        else
            $('#popup_login_form').submit();
             
         
     });
 });
 
    /* Validation for the login popup updated on 05-04-2017 */
     
        
        
        
        

});
</script>





    <script>
    	// ===== Scroll to Top ====
$(window).scroll(function() {
    if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
        $('#return-to-top').fadeIn(200);    // Fade in the arrow
    } else {
        $('#return-to-top').fadeOut(200);   // Else fade out the arrow
    }
});
$('#return-to-top').click(function() {      // When arrow is clicked
    $('body,html').animate({
        scrollTop : 0                       // Scroll to top of body
    }, 500);
});
    </script>

    <script>
	//DROPDOWN ON CLICK DEVICE
	$(function () {
		ww = document.body.clientWidth;
		if (ww < 1030) {
			$('.navbar-collapse a').click(function () {

				if ($(this).closest("li").children("ul").length) {
					if ($(this).parent("li").hasClass('expnd')) {
						window.location = this.href;
					}

					$('.navbar-collapse a').removeClass('disabled');
					$(this).parent("li").addClass("expnd");
		$('.navbar-collapse a').not(this).parent("li").removeClass("expnd");
				}
			});
		}
	})

/*** Added by Jijo on 17-04-2017 for Newsletter Subscription Start here  ***/

$(document).ready(function(){
     $('#subscription_newsletter').on("click",function(e){
         e.preventDefault();

    
var newsletter=$('#newsletter').val();
     
   $.ajax({
                  url: "index.php?route=account/Newsletter/SubscribeNewsletter",
                  type: "POST",
      data: {'newsletter':newsletter},
        success: function(result){
               $("#subscription_msg").html(result);
            $('#newsletter').val('');
        }});      
         
         
         
    
});


    $('#search input').keydown(function(e) {
        var value = $('#search input').val();
        if (e.keyCode == 13) {
            //alert(value);
            //window.location.replace("index.php?route=product/search&search="+value+"&sub_category=true&description=true");
            window.location = "index.php?route=product/search&search="+value+"&sub_category=true&description=true";
        }
    });


        });
        
        
/*** Added by Jijo on 17-04-2017 for Newsletter Subscription End here  ***/        
        
        
        
        
            // Quatity updates Start here for product detail page and cart page Added by Jijo on 18-04-2014
    $(".val-next").click(function(){
       var cart_id= $(this).attr("data-id");
      
        if(cart_id=='')
        {
         var qnty=parseInt($('#input-quantity').val());
        if(qnty>0)
        $('#input-quantity').val(qnty+1);    
        }
        else
        {
        var cart_qnty='#cart_qnty'+cart_id;
        var qnty=parseInt($(cart_qnty).val());
        if(qnty>0)
        $(cart_qnty).val(qnty+1); 
        $("#edit-cart-items").submit();
           
        }
        
        
    });
        
    $(".val-prev").click(function(){
        var cart_id= $(this).attr("data-id");
        if(cart_id=='')
        {
        var qnty=parseInt($('#input-quantity').val());
        if(qnty>1)
        $('#input-quantity').val(qnty-1);    
        }
        else
        {
        var cart_qnty='#cart_qnty'+cart_id;
        var qnty=parseInt($(cart_qnty).val());
        if(qnty>1)
        $(cart_qnty).val(qnty-1); 
            $("#edit-cart-items").submit();
             
        }
    });    
    // Quatity updates End here for product detail page and cart page   Added by Jijo on 18-04-2014

	</script>
  <script>

  $("#video").owlCarousel({
      autoPlay: false, //Set AutoPlay to 3 seconds
      items : 4,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3],
    navigationText:false,
    navigation : true,
    pagination : false

  });


$(".qnty input").focusout(function(){
   setTimeout(($('#edit-cart-items').submit()), 2000);
});
</script>
  </body>
</html>
