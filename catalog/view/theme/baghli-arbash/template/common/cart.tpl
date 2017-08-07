<?php echo $header; ?>
<div class="container">

  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
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
      <div class=" inner-container">
        <!-- content heading section open-->
        <div class="row">
    <div class="container inner-page">
      <div class="heading"><?php echo $heading_title; ?></div>
        <form id="edit-cart-items" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <?php foreach ($products as $product) { ?>
      <section class="innr-shpng-cart clearfix">
        <div class="col-md-3 col-sm-4 list-imageNew new_align">
          <?php if ($product['thumb']) { ?>
          <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/></a>
          <?php if ($product['special']) { ?>


          <div class="offer-label"><?php echo round(100 - ($special_amt*100/$price_amt))."% "; ?>
            <span>OFF</span> </div>


          <?php  }?>          <?php } ?>
        </div>
        <div class="col-md-9 col-sm-8 updte_design2">
          <h4><strong><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></strong></h4>
          <?php if (!$product['stock']) { ?>
          <span class="text-danger">***</span>
          <?php } ?>
         <?php  if($product['description']) { ?>
          <p><?php echo $product['description']; ?></p>
          <?php } ?>
            <div class="rateyo subrtio"></div>
          <div class="rateyo"></div>
          <script>
            $(function(){

              $('.rateyo').rateYo({rating:'<?= (int)$rating?>'});
            });
          </script>
            <?php if ($product['price']) { ?>
            <?php if (!$product['special']) { ?>
            <div class="list-price-div">Price Now : <span><?php echo $product['price']; ?></span></div>
            <?php } else { ?>
            <div class="list-price-div">Price Now : <span><?php echo $product['special']; ?></span></div>
            <span class="overline">Before :<?php echo $product['price']; ?></span>
            <?php } ?>
            <?php } ?>
          <span class="gurnty grnw">Guarantee :  2 Year</span>
          <span class="save"> <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger active delteee" onclick="cart.remove('<?php echo $product['cart_id']; ?>');">Delete</button>
| <a href="#">save for later</a></span>
          <div class="qnty">
            <strong>QuanTity</strong>

              <div class="input-group spinner">
                <input type="number" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                <div class="input-group-btn-vertical">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                </div>
            </div>
        </form>

          </div>
          <div class="totl-amnt">
            <span>TOTAL: <strong><?php echo $product['total']; ?></strong></span>

          </div>
        </div>
      </section>
      <?php } ?>
      <table class="tottal-area" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="79%" align="right">TOTAL price </td>
          <td width="21%"><strong><?php echo $product['total']; ?></strong></td>
        </tr>
       <!-- <tr>
          <td align="right">Total delivery CHarge </td>
          <td><strong>100.00 KD</strong></td>
        </tr>
        <tr>
          <td align="right">Discount </td>
          <td><strong>500.00 KD</strong></td>
        </tr>-->

        <tr>
          <td align="right">GRAND TOTAL:  </td>
          <td><strong><?php echo $product['total']; ?></strong></td>
        </tr>

      </table>




      <button type="button" class="btn btn-arw grey pull-left">REMOVE ALL <i><img src="images/arrow.png" alt=""></i></button>
        <a href="<?php echo $checkout; ?>" class="btn btn-arw pull-right">proceed to check out <i><img src="images/arrow.png" alt=""></i></a>

    </div>

        <!-- content section open-->
    </div><!-- container inner-container-->



      <!--<div class="buttons clearfix">
        <div class="pull-left"><a href="<?php //echo $continue; ?>" class="btn btn-default"><?php //echo $button_shopping; ?></a></div>
        <div class="pull-right"><a href="<?php //echo $checkout; ?>" class="btn btn-primary"><?php //echo $button_checkout; ?></a></div>
      </div>-->
      <?php echo $content_bottom; ?></div>
      </div>
    </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
