<?php echo $header; ?>

<div class="container">

  <!-- Modal -->
  <!--Begin Modal Window-->
  <div class="modal fade left" id="myModalbook">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h3 class="pull-left no-margin">Your Extra Quantity for the Product</h3>
          <button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
          </button>
        </div>

        <div class="modal-body">

          <form id='search_form'  action="<?php echo $action_popup_form; ?>" method="post" enctype="multipart/form-data">

            <label><?php echo $your_name ;?></label>
            <input  type="text" name="name" class="form-control" placeholder="<?php echo $your_name;?>">

            <?php if ($error_name) { ?>
            <div class="text-danger"><?php echo $error_name;?></div>
            <?php } ?>



            <label><?php echo $quantity_name ;?></label>

            <input  type="text" name="quantity" class="form-control" placeholder="<?php echo $your_quantity;?>">

            <?php if ($error_quantity) { ?>
            <div class="text-danger"><?php echo $error_quantity;?></div>
            <?php } ?>


            <label><?php echo $mobile ;?></label>

            <input  type="text" name="phone" class="form-control" placeholder="<?php echo $your_phone;?>">

            <?php if ($error_phone) { ?>
            <div class="text-danger"><?php echo $error_phone;?></div>
            <?php } ?>

            <label><?php echo $email_name ;?></label>

            <input  type="text" name="email" class="form-control" placeholder="<?php echo $your_email;?>">

            <?php if ($error_email) { ?>
            <div class="text-danger"><?php echo $error_email;?></div>
            <?php } ?> <br>


            <div class="modal-footer">
              <button onclick="form_submit()"  class="btn btn-primary algn-leftt">SUBMIT</button>

            </div>

          </form>
        </div>

      </div>
    </div>
  </div>


    <div class="content"></div>


  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
   <!-- <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php  echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>-->
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

            <?php if (!$product['stock']) { ?>
            <span class="text-danger">***</span>
            <?php } ?>

            <div class="col-md-3 col-sm-4 list-imageNew new_align">
              <?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/></a>
              <?php if ($product['special']) { ?>


              <div class="offer-label"><?php echo round(100 - ($special_amt*100/$price_amt))."% "; ?>
                <span>OFF</span> </div>


              <?php  }?>
              <?php } ?>

            </div>

            <div class="col-md-9 col-sm-8 updte_design2">


              <h4><strong><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></strong></h4>
              <?php if (!$product['stock']  ) { ?>

              <span class="text-danger">***</span>
              <?php } ?>
              <?php  if($product['description']) { ?>


              <div class="description">
                <?php // echo $product['description']; ?>
              </div>

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
              <div class="list-price-div"><?= $Price?> : <span><?php echo $product['price']; ?></span></div>
              <?php } else { ?>
              <div class="list-price-div"><?= $Price?> : <span><?php echo $product['special']; ?></span></div>
              <span class="overline"><?= $befor?>:<?php echo $price; ?></span>
              <?php } ?>
              <?php } ?>

<?php // print_r($product); ?>


              <?php if ($product['quantity']) { ?>
              <div class="list-price-div"><b><?= $quantity_text?> : </b><span><?php echo $product_quantity ?></span></div>
              <?php } ?>

     <?php // print_r($product['option']);die(); ?>

              <?php if ($product['option']) { ?>
              <?php foreach ($product['option'] as $option) { ?>
              <br />
              <span class="gurnty grnw"><?php echo $option['name']; ?>: <?php echo $option['value']; ?></span>
              <?php } ?>
              <?php } ?>
              <!--  <span class="gurnty grnw">Guarantee :  2 Year</span> -->
              <span class="save"> <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger active delteee" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"><?= $del ?></button></span>
              <!--| <a href="#">save for later</a> -->


              <button type="button" class="btn btn-primary btn-lg margin_arabic_style" style="margin-bottom: 30px; margin-top: 30px; margin-left: -12px;" data-toggle="modal" data-target="#myModalbook">
                  <?php echo $request_more; ?>
              </button>





              <div class="qnty">
                <strong><?= $qut?></strong>

                <div class="input-group spinner">

                  <input type="number" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" min="1" size="1" class="form-control" />

                  <div class="input-group-btn-vertical">

                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary"><i class="fa fa-refresh"></i></button>


                  </div>

                </div>

              </div>
<br>
              <div class="totl-amnt">
                <span><?= $tot?>: <strong><?php echo $product['total']; ?></strong></span>

              </div>



            </div>


          </section>
          <?php foreach ($vouchers as $voucher) { ?>

          <?php // print_r($voucher); ?>
          <tr>
            <td></td>
            <td class="text-left"><?php echo $voucher['description']; ?></td>
            <td class="text-left"></td>
            <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                <span class="input-group-btn">
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                    </span></div></td>
            <td class="text-right"><?php echo $voucher['amount']; ?></td>
            <td class="text-right"><?php echo $voucher['amount']; ?></td>
          </tr>
          <?php } ?>




      <?php } ?>
      <table class="tottal-area" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="79%" align="right"><?= $tot_p?>: </td>
          <td width="21%"><strong><?php echo $totals[1]['text']; ?></strong></td>
        </tr>


        <tr>
          <td align="right"><?= $Gra?>:  </td>
          <td><strong><?php echo $totals[1]['text']; ?></strong></td>
        </tr>

          <?php // if ($modules) { ?>
          <h2><?php // echo $text_next; ?></h2>
          <p><?php // echo $text_next_choice; ?></p>

          <?php // } ?>

      </table>


        </form>







      <!-- <button type="button" class="btn btn-arw grey pull-left">REMOVE ALL <i><img src="image/arrow.png" alt=""></i></button> -->
        <a href="<?php echo $checkout; ?>" class="btn btn-arw pull-right"><?= $pro?> <i><img src="image/arrow.png" alt=""></i></a>

    </section>

        <!-- content section open-->
    </div><!-- container inner-container-->

          <script>
              $('.q-down').click(function(){
                  if($('#input-quantity').val() == 0){
                      $('#input-quantity').val('1');
                  }
              });
          </script>
          <script type="text/javascript">
              function form_submit() {
                  document.getElementById("search_form").submit();
              }
          </script>

<script>
          $(function(){
          $('#search_form').on('submit', function(e){
          e.preventDefault();
          $.ajax({
          url: http://localhost/baghli/index.php?route=checkout/cart, //this is the submit URL
          type: 'GET', //or POST
          data: $('#search_form').serialize(),
          success: function(data){
          alert('successfully submitted')
          }
          });
          });
          });
</script>

          <script type="text/javascript">
              if (count(<?php $errors ?>) > 0) {
                  $('#myModalbook').modal('show');
              }

          </script>


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


