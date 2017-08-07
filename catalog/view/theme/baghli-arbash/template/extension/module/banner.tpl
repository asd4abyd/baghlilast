
	<div class="banner">
    	<div id="banner" class="owl-carousel owl-theme">
            <?php foreach ($banners as $banner) { ?>
            
          <div class="item">
              <?php if ($banner['link']) { ?>
              <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
              <?php
                }
                else
                {
                ?>
                <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
              <?php
                }
                ?>
          </div>
            <?php
            }
            ?>
          
          
        </div>
    </div>

