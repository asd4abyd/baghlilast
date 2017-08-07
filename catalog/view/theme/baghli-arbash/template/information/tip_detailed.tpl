<?php echo $header; ?>
<?php 
	if($heading_title=='ABOUT US')
		$image = 'innr-bnr-18.png';
	else if($heading_title=='SITEMAP')
		$image = 'innr-bnr-20.png';
	else if($heading_title=='TIPS & ADVICES')
		$image = 'innr-bnr-11.png';
	else if($heading_title=='FAQS')
		$image = 'innr-bnr-09.png';
	else if($heading_title=='PRIVACY STATEMENT')
		$image = 'innr-bnr-10.png';
	else if($heading_title=='TERMS AND CONDITION')
		$image = 'innr-bnr-19.png';
	else
		$image = 'innr-bnr-11.png';
?>
<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/<?php echo $image; ?>" alt=""></div>


<div class="container">
   
    <div class="container inner-page">
	<div class="row">
      <div class="heading"><span><strong><?php echo $text_title; ?></strong></span></div>
       
        <?php

	if(isset($description)) { echo $description;} 
       
        ?>
    </div>   
        
      <div class="row"><?php echo $content_bottom; ?></div>
	</div>
    <?php echo $column_right; ?>
</div>

<?php echo $footer; ?>


<a href="javascript:" id="return-to-top"><i class="icon-chevron-up"><img src="images/backtotop.png" alt=""></i> BACK TO TOP</a>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>


	
    
    <script>
        
    $(document).ready(function() {
	  $("#video").owlCarousel({
		  autoPlay: false, //Set AutoPlay to 3 seconds
		  items : 4,
		  itemsDesktop : [1199,3],
		  itemsDesktopSmall : [979,3],
		  navigationText:false,
		  navigation : true,
		  pagination : false

	  });
	});
   </script>

    <script>

      $(function () {

        var rating = 1.6;

        $(".counter").text(rating);

        $("#rateYo1").on("rateyo.init", function () { console.log("rateyo.init"); });

        $("#rateYo1").rateYo({
          rating: rating,
          numStars: 5,
          precision: 2,
          starWidth: "64px",
          spacing: "5px",
	  rtl: true,
          multiColor: {

            startColor: "#000000",
            endColor  : "#ffffff"
          },
          onInit: function () {

            console.log("On Init");
          },
          onSet: function () {

            console.log("On Set");
          }
        }).on("rateyo.set", function () { console.log("rateyo.set"); })
          .on("rateyo.change", function () { console.log("rateyo.change"); });

        $(".rateyo").rateYo();

        $(".rateyo-readonly-widg").rateYo({

          rating: rating,
          numStars: 5,
          precision: 2,
          minValue: 1,
          maxValue: 5
        }).on("rateyo.change", function (e, data) {

          console.log(data.rating);
        });
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
    	(function ($) {
		  $('.spinner .btn:first-of-type').on('click', function() {
			$('.spinner input').val( parseInt($('.spinner input').val(), 10) + 1);
		  });
		  $('.spinner .btn:last-of-type').on('click', function() {
			$('.spinner input').val( parseInt($('.spinner input').val(), 10) - 1);
		  });
		})(jQuery);
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

	</script>

