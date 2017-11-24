<div class="new-arrival-cvr">
    	<div class="container">
        	<div class="heading"><span><?php echo $heading_title; ?></span></div>
            <div class="row">
                <div id="new-arrival" class="owl-carousel owl-theme">
              <?php foreach ($products as $product) { ?>
              <div class="item">
                <figure>
                    <div class="img img-responsive"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><img class="img-responsive" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a></div>
                    <figcaption>
                        <h4><span><?php echo $product['name']; ?></span></h4>
                                <?php if ($product['price']) { ?>

                         <?php if ($product['special']) { ?>

            <strong><?php echo $price_now; ?> <?php echo $product['special']; ?></strong><br>
            <strong class="line_through">Before : <?php echo $product['price']; ?></strong>
          <?php } else { ?>

            <strong><?php echo $price_now; ?> <?php echo $product['price']; ?></strong><br>

                        <?php } ?>

        <?php } ?>

                    </figcaption>
                </figure>
              </div>
<?php
}
?>

            </div>
            </div>
        </div>
    </div>

   <script type="text/javascript">
 $('.owl-theme<?php echo $module; ?>').owlCarousel({
   items: 6,
   autoPlay: 3000,
   navigation: true,
   navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
  pagination: true
 });
</script>

