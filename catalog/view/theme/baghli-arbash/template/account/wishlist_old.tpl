<?php echo $header; ?>
<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/innr-bnr-16.png" alt=""></div>
<div class="container">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>

   <div class="container inner-page">
      <div class="heading"><span><strong><?php echo $heading_title; ?></strong></span> <div class="sort pull-right">Sort By
            <select class="form-control">
            	<option>A-Z</option>
            	<option>Best Match</option>
                <option>Most Selling</option>
                <option>Most Rated</option>
            </select>
            </div>
	</div>
	<?php if ($products) { ?>
	 <?php foreach ($products as $product) { ?>
	<div class="row innr-shpng-cart clearfix">
		<div class="col-md-6 col-sm-6">
			<div class="row">
				<!-- image list div -->
				  <div class="col-md-6 list-imageNew new_align">
					<a href="<?php echo $product['href']; ?>">
						<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
					</a>
					
				  </div>
				  <!-- lsit details div -->
				  
				   <div class="col-md-6 proLst-cont updte_design">
						<div class="row">
							<div class="col-md-12">
							  <h4 class="cart-h4"><a href="product-details.html"><strong><?php echo $product['name']; ?></strong></a></h4>
							  <span><a href="#">Brand Name</a></span>
							  <span class="save"><a href="#">ADDED ON: 12-10-2016</a> </span>
							  <div class="rateyo"></div>
							  <div class="dicnt algnvww">View : <span>250</span></div>

							</div>
						</div>
						
						<div class="row">
						  <div class="col-md-6">
							<div class="list-price-div">Price Now : <span><?php echo $product['special']; ?></span></div>
							<span class="overline">Before : <?php echo $product['price']; ?> </span>   
							
						  </div>
						  <div class="col-md-6">
							<div class="qnty">
							  <strong>Quantity</strong>
								<div class="input-group spinner">
								  <input type="text" class="form-control" value="42">
								  <div class="input-group-btn-vertical">
									<button class="btn" type="button"><i class="fa fa-caret-up"></i></button>
									<button class="btn" type="button"><i class="fa fa-caret-down"></i></button>
								  </div>
								</div>
							  </div>
						   
						  </div>
						</div>
						
				<div class="row">
                  <div class='col-md-6'>
                    <div class="form-group">
                      <label for="" class="siz-clr">Select Colour</label>
                      <div class="dropdown">
                        <button class="btn _select_color dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Green
                          <span class="caret _right"></span>
                          <span _text_display="Green" class="color green"></span>
                        </button>
                        <ul class="dropdown-menu _select_color_drop" aria-labelledby="dropdownMenu1">
                          <li><span _text_display="Green" class="color green"></span></li>
                          <li><span _text_display="Red" class="color red"></span></li>
                          <li><span _text_display="Yellow" class="color yellow"></span></li>
                          <li><span _text_display="Brown" class="color brown"></span></li>
                          <li><span _text_display="Orange" class="color orange"></span></li>
                          <input type="hidden" name="_color" value="Green">
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="" class="siz-clr">Select Size</label>
                      <select class="siz-clr">
                        <option value="">1</option>
                        <option value="">2</option>
                        <option value="">3</option>
                      </select>
                    </div>
                  </div>
                </div>
				
				<div class="row">
                
                <div class="col-md-6">
					<div class="add_dtt">
						<span class="gurnty">Guarantee :&nbsp; 2 Year</span>
						<span>Delivery &nbsp;&nbsp;&nbsp;&nbsp;: &nbsp; Free</span>
						<span class="stock-out">Out of Stock</span>
					</div>    
				</div>

                <div class="col-md-6">
                    <div class="add-crt">
					<input name="" onclick="cart.add('<?php echo $product['product_id']; ?>');" value="ADD TO CART" class="btn_wrap add_algn" type="button">
					</div>
                     <div class="add-crt">
                      <input name="" onClick="window.location.href='<?php echo $product['remove']; ?>'" type="button" value="Delete" class="btn_wrap delte">
                    </div>
				</div>
               
				  </div>
				  
				  </div>
			</div>
		</div>
	</div>
	<?php } ?>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
     
      </div>

</div>
<?php echo $footer; ?>