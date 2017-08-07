	<div class="best-sellers-cvr best-neww">
    	<div class="container">
        	<div class="heading"><span><?php echo $heading_title; ?></span></div>
            <div class="row">
                <div id="bst-sllr" class="owl-carousel owl-theme">
               <?php foreach ($products as $product) { ?>      
              <div class="item">
                <figure>
                    <div class="img"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                    <figcaption>
                        <h4><span><?php echo $product['name']; ?></span></h4>
                    
                    <?php if ($product['price']) { ?>
       
                           <?php if ($product['special']) { ?>
         
            <strong><?php echo $text_price_now; ?> <?php echo $product['special']; ?></strong><br>
            <strong class="line_through"><?php echo $text_price_before; ?> <?php echo $product['price']; ?></strong>
          <?php } else { ?>
            
            <strong><?php echo $text_price_now; ?> <?php echo $product['price']; ?></strong><br>
            
         
         
          <?php } ?>
           
       
        <?php } ?>
                    
                        <?php if ($product['rating']) { ?>
                        
                        <div class="rateyo1">
                    
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
                    
                    
                    </div>
                        <?php
                        }
                        ?>
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
