<?php echo $header; ?>

<?php 

	if($heading_title=='ABOUT US')
		$image = 'innr-bnr-18.png';
	else if($heading_title=='Site Map')
		$image = 'innr-bnr-20.png';
	else if($heading_title=='TIPS & ADVICES')
		$image = 'innr-bnr-11.png';
	else if($heading_title=='Faq')
		$image = 'innr-bnr-09.png';
	else if($heading_title=='Privacy Policy')
		$image = 'innr-bnr-10.png';
	else if($heading_title=='Terms And Conditions')
		$image = 'innr-bnr-19.png';
     else if($heading_title=='wholesale')
		$image = 'innr-bnr-15.png';
	else
		$image = 'innr-bnr-12.png';
?>

<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/<?php echo $image; ?>" alt=""></div>
<div class="container">
    <div class="container inner-page">
      <div class="heading"><span><strong><?php echo $heading_title; ?></strong></span></div>
      <?php echo $description; ?><?php echo $content_bottom; ?>
      
	</div>
   
    <?php echo $column_right; ?>
</div>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   
<?php echo $footer; ?>

<script src="js/owl.carousel.js"></script>
<script type="text/javascript" src="js/jquery.rateyo.js"></script>

    <script>
    $("#related-products").owlCarousel({

        autoPlay: false, //Set AutoPlay to 3 seconds
        items : 4,
        itemsDesktop : [1199,3],
        itemsDesktopSmall : [979,3],
      navigationText:false,
      navigation : true,
      pagination : false

        });

$("#business-partners").owlCarousel({

      autoPlay: true, //Set AutoPlay to 3 seconds
      items : 6,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,6],
      navigationText:false,
      navigation : false,
      pagination : false

            });
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


