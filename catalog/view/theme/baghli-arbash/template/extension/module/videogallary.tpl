<div class="vdeo-gal">
    <h4><?php echo $text_head; ?> </h4>

        	<div class="row">
                <div id="video">

 <?php $counter = 0; ?>
<?php foreach ($banners as $banner) { ?>
<?php $counter++; ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
	
	 <div class="item">
					  <a  type="button" data-toggle="modal" data-target="#myModal<?php echo $counter;?>" >
					  <span class="vid"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" >
					  </span></a>


					  </div>
					  
    <?php } else { ?>
	
	                  <div class="item">
					  <a  type="button" data-toggle="modal" data-target="#myModal0" >
					  <span class="vid"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" >
					  </span></a>
					  </div>
	
    <?php } ?>
  </div>
  <?php } ?>
                </div>
				
 <?php $counter = 0; ?>
<?php foreach ($banners as $banner) { ?>
<?php $counter++; ?>

    <?php if ($banner['link']) { ?>
	
		   <div class="modal fade" id="myModal<?php echo $counter;?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><?php echo $banner['title']; ?></h4>
                      </div>
                      <div class="modal-body">
                        <iframe width="100%" height="315" src="<?php echo $banner['link'];?>" frameborder="0" allowfullscreen></iframe>
                      </div>

                    </div>
                  </div>
                </div>
					  
    <?php } ?>
  
  <?php } ?>
            </div>
        </div>