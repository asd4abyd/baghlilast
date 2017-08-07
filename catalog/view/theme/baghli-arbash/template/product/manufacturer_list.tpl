<?php echo $header; ?>
<?php echo $content_top; ?>

 <div class="container inner-page">
	  <div class="heading"><span><strong><?php echo $heading_title; ?></strong></span></div>

		<div class="content"> </div>



            <div class="row brands-page">

			  <?php if ($categories) { ?>


			  <?php foreach ($categories as $category) { ?>

			  <?php if ($category['manufacturer']) { ?>

			  <div class="row brands-page">


			  <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>

				<?php foreach ($manufacturers as $manufacturer) { ?>

                 <div class="col-sm-12 bran_details"><h4 class="ban_title"><?php echo $manufacturer['name'];?> </h4>
               <?php if(count($manufacturer['categories'])>0){ ?>
				<a href="<?php echo $manufacturer['href']; ?>" class="baran_button">SEE ALL</a>
			   <?php } ?>

                </div>


              <?php if($manufacturer['categories']){ ?>
				 <?php $cateroies_visit = array(); $counter = 0;?>
				<?php foreach ($manufacturer['categories'] as $manufacturer_category) { ?>

				<?php $founded_key =  array_search($manufacturer_category['category_id'], $cateroies_visit); ?>
				<?php if (gettype($founded_key) == 'boolean'){ ?>
				<?php $cateroies_visit[$counter] = $manufacturer_category['category_id'] ; $counter++;?>

                <div class="col-sm-4 col-md-4">
                    <figure>
					<a href="<?php echo $manufacturer_category['href_category']; ?>">
					<?php if($manufacturer['image']) { ?>
					<img src="<?php echo $manufacturer_category['cat_image']; ?>" title="<?php echo $manufacturer['name'];?>" />
					<?php } else { ?>
					<img src="catalog/view/theme/baghli-arbash/images/brand.png" alt="">
					<?php } ?>
					</a>
                    <figcaption>
                    <h4><?php echo $manufacturer_category['category_name']['name']; ?> </h4>
                    <h3 class="brand_namee2"><?php echo $manufacturer['name'];?></h3>
                    </figcaption>
                    </figure>
                </div>
				<?php } ?>
				<?php } ?>
			  <?php }  ?>




							  <?php }  ?>
			  <?php }  ?>

			  			  </div>

			  <?php }  ?>
			  <?php }  ?>
			  <?php } else {  ?>
			  <p><?php echo $text_empty; ?></p>
		  <div class="buttons clearfix">
			<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
		  </div>
		  <?php } ?>


            </div>



            <nav aria-label="Page navigation" class="navpaging">
  <ul class="pagination">
  <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">«</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">»</span>
      </a>
    </li>


    <select class="view_all">
			<option>View All</option>
			<option>20</option>
			<option>30</option>

	</select>


  </ul>
</nav>
    </div>
<?php echo $footer; ?>