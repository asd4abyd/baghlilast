<?php echo $header; ?>
<div class="container">
  
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	<div class="container inner-container">
    	<div class="row">
			<div class="col-md-3 inner-sid-nav">
            <div style="position:relative; width:100%; float:left;">
              <div class="head"><i class="fa fa-bars" aria-hidden="true"></i> Shop By Departments
              <i class="dp-department fa fa-caret-down" aria-hidden="true"></i></div>
              <div class="side-menus-list">
                <ul class="nav nav-stacked">
                    
                    <?php foreach ($categories as $category) { ?> 
                  <li class="open"><a class="dropdown-toggle" data-toggle="dropdown" href="<?php echo $category['href']; ?>" aria-expanded="true"><i><img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"></i> <?php echo $category['name']; ?> </a>
                       <?php if ($category['children']) { ?>
                      <ul class="dropdown-menu">
                          <?php foreach ($category['children'] as $child) { ?>
                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                           <?php
                            }
                            ?> 
                      </ul>
                      <?php
                        }
                        ?>
                  </li>
                <?php
                }
                ?>
                  
                </ul>
              </div><!--side-menus-list-->
            </div>
          </div>
			 <div class="col-md-9 inner-right-side">
			<h6><?php echo $heading_title; ?></h6>
			</div>
		</div>
		
		<div class="row checkout-page bs-wizard">

                <div class="col-xs-4 bs-wizard-step complete">

                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot bsdot-active-a">1</a>
                  <div class="bs-wizard-info text-center">Delivery Details</div>
                </div>

                <div class="col-xs-4 bs-wizard-step complete"><!-- complete -->
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot bsdot-active-a">2</a>
                  <div class="bs-wizard-info text-center">Payment Methods</div>
                </div>

                <div class="col-xs-4 bs-wizard-step complete"><!-- complete -->
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot bsdot-active-a">3</a>
                  <div class="bs-wizard-info text-center">Confirm your order</div>
                </div>

            </div>
			
			<div class="row checkout-page-cont">
              <div class="col-md-12">
                <h6 class="log-head">Your Product List</h6>

              </div>
              <div class="col-md-12">
                <div id="no-more-tables">
                  <table class="col-md-12 table-bordered table-striped table-condensed cf your-order">
                      <thead class="cf">
                        <tr>

                          <th>Image</th>
                          <th>Product Name</th>
						  <th>Qty</th>
						  <th>Price</th>
                          <th class="yo-total">Total</th>
                        </tr>
                      </thead>
                     <tbody>
					 <?php foreach ($products as $product) { ?>
                       <tr>
                         <td data-title="Image">
						 <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
						 </td>
                         <td data-title="Product Name" class="numeric yo-product-name">
						 <p><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a><p>
						 <?php foreach ($product['option'] as $option) { ?>
						  <br />
						  &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
						  <?php } ?>
						  <?php if($product['recurring']) { ?>
						  <br />
						  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
						  <?php } ?>
						 </td>
						  <td class="tab-color yo-total" data-title="Qty"><p><?php echo $product['quantity']; ?></p></td>
						   <td class="tab-color yo-total" data-title="Price"><p><?php echo $product['price']; ?></p></td>
                         <td class="tab-color yo-total" data-title="Total"><p><?php echo $product['total']; ?></p></td>
                       </tr>
                       
					 <?php } ?>
					 <?php foreach ($vouchers as $voucher) { ?>
						<tr>
							<td class="tab-color yo-total" data-title="Qty"><p></p></td>
						    <td class="tab-color yo-total" data-title="Price"><p><?php echo $voucher['description']; ?></p></td>
							<td class="tab-color yo-total" data-title="Total"><p>1</p></td>
							<td class="tab-color yo-total" data-title="Qty"><p><?php echo $voucher['amount']; ?></p></td>
						   <td class="tab-color yo-total" data-title="Price"><p><?php echo $voucher['amount']; ?></p></td>
						</tr>
					 <?php } ?>
					  <?php foreach ($totals as $total) { ?>
                       <tr class="cart-detail">
                         <td class="" colspan="4"><?php echo $total['title']; ?></td>
                         <td class="tab-color yo-total main-total" data-title="Cart Subtotal"><p><?php echo $total['text']; ?></p></td>
                       </tr>
					  <?php } ?>
                       
                     </tbody>
                   </table>
                 </div>


              </div>
              <div class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2">
                <ul class="sel-adderess chout2">
                  <li><!--<input type="button" value="Confirm Order">--> <?php echo $payment; ?></li>
                </ul>
              </div>
            </div>
		
				
	</div>
      
      
      <?php echo $content_bottom; ?></div>
    </div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
-->
</script>
<?php echo $footer; ?>
