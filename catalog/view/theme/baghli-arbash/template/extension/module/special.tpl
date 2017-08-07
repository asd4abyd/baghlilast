
<div class="umay-like" >
      <div class="container">
<h6 class="cap-head">You may Like also</h6>
<div class="row">
  <div id="related-products" class="owl-carousel owl-theme">

  <?php foreach ($products as $product) { ?>

  <div class="">

    <div class="item">
   
     <figure>
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive"/></a></div>
      <figcaption>
      <div class="caption">
        <h4> <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <?php if ($product['price']) { ?>
         <strong>PRICE NOW :
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <?php echo $product['special']; ?><!-- <span class="price-old"><?php echo $product['price']; ?></span> -->
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <!-- <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span> -->
          <?php } ?>
         </strong>
        <?php } ?>
 <?php if ($product['rating']) { ?>
        <div class="rateyo" >
        </div>

        <script>
$(function(){

  $('.rateyo').rateYo({rating:'<?= (int)$rating?>'});
});
                </script>

        <?php } ?>
      </div>
      </figcaption>
     <!--  <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div> -->
      </figure>
    </div>
  </div>
  <?php } ?>
</div> </div>
</div></div>
<!--  -->



