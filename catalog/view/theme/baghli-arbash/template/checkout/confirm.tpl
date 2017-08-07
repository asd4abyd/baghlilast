<?php if (!isset($redirect)) { ?>
<div class="row">
      <div class="col-md-9">
        <div class="orders">
          <h4 class="clearfix"><strong><?= $ORDERS?></strong></h4>

              <div class="tbl-scrl clearfix">
                 <table class="orders" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <th><?= $Product?></th>
                      <th><?php echo $column_name; ?></th>
                      <th><?php echo $column_quantity; ?></th>
                      <th><?php echo $column_price; ?></th>
                      <th><?php echo $column_total; ?></th>
                    </tr>
                    <?php foreach ($products as $product) { ?>

                    <tr>
                      
                      <td><img src="" width="100"></td>
                      <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                       <!--  <?php foreach ($product['option'] as $option) { ?>
                        <br />
                        &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                        <?php } ?>
                        <?php if($product['recurring']) { ?>
                        <br />
                        <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                        <?php } ?> --></td>
                      <!-- <td class="text-left"><?php echo $product['model']; ?></td> -->
                      <td class="text-left"><?php echo $product['quantity']; ?></td>
                      <td class="text-left"><?php echo $product['price']; ?></td>
                      <td class="text-left"><?php echo $product['total']; ?></td>
                    </tr>
                    <?php } ?>
                    </table>

                    </div>
<!-- <?php var_dump($product)?> -->

        </div>
      </div><!--col-md-8-->
      <div class="col-md-3">
        <div class="subTotal-div subtt">
          <h4><?= $SUBTOTAL?>  <i></i>: <span><?= $totals[0]['text'] ?></span></h4>
          <h4><?= $CHARGE?> &nbsp; : <span><?= $totals[1]['text'] ?></span></h4>
          <br>
        <!--   
          <div class="cupon_code">
          <input type="text" class="text_box1" placeholder="Enter Coupon Code">
          <input type="button" value="Submit" class="cup_btn">
      </div>
         -->
         
         <!--  <h4>DISCOUNT  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <span>60 KD</span></h4> -->
          <h4 class="totall"><?= $GRAND?>   &nbsp;&nbsp;: <span><?= $totals[2]['text'] ?></span></h4>
      
<!--       <div class="remindd"><input type="checkbox"> <label>Please call me 1 day before delivery</label> </div> -->
            

          <!--   <div class="pay-option-main">
            <h5>Select payment method</h5>
            
              <div class="pay-option"><span><input type="radio" name="payment" value="Master" checked></span><img src="images/card.png" alt=""></div>
              <div class="pay-option"><span><input type="radio" name="payment" value="Master" checked></span><img src="images/visa.png" alt=""></div>
              <div class="pay-option"><span><input type="radio" name="payment" value="knet" checked></span><img src="images/knet.png" alt=""></div>
            </div> -->
      <!--       <button type="submit" id="button-confirm" class="pay-btnNew btn btn-arw pull-right" data-loading-text="Loading...">Proceed To Pay <i><img src="image/arrow.png" alt=""></i></button>
 -->
 <div>  <?php echo $payment ?> </div>
        </div><!--subTotal-div-->
      </div><!--col-md-4-->
    </div><!--row-->

<?php } else { ?>
<script type="text/javascript"><!--
// location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>
