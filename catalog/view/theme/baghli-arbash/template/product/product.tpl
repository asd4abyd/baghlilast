<?php echo $header; ?>

<div class="innr-banner"><img src="image/innr-bnr-17.png" alt=""></div>
<div class="container inner-container">


  <style>

    .radio input[type="radio"], .radio-inline input[type="radio"], .checkbox input[type="checkbox"], .checkbox-inline input[type="checkbox"]

  </style>



  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> container inner-page"><?php echo $content_top; ?>

      <div class="content">

      </div>

      <div class="heading"><span><strong><?= $PRODUCT ?> </strong> <?= $DETAILS ?></span></div>
      <div class="row  prod-details clearfix">
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>



        <div class="col-md-5 col-sm-6 prod-image list-imageNew clearfix new_align">
          <div class="row">

            <?php if ($thumb || $images) { ?>
            <?php if ($special) { ?>
            <div class="offer-label"><?php echo round(100 - ($special_amt*100/$price_amt))."% "; ?><span>OFF</span> </div>
            <?php  }?>

            <div class="thumbnails">


              <div class="large-5 column">
                <!-- im -->
                <div class="xzoom-container">
                  <img class="xzoom" id="xzoom-default" src="<?php echo $thumb; ?>" xoriginal="<?php echo $popup; ?>" />
                  <!-- addtional image -->
                  <?php if ($images) { ?>
                  <div class="xzoom-thumbs">
                    <a href="<?php echo $popup; ?>"><img class="xzoom-gallery" style="max-width:76px;" height="76" src="<?php echo $popup; ?>"  ></a>

                    <?php foreach ($images as $image) { ?>
                    <a href="<?php echo $image['popup']; ?>"><img class="xzoom-gallery" style="max-width:76px;"  src="<?php echo $image['thumb']; ?>"  ></a>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>  <!-- im -->
              </div>


              <?php } ?>
            </div>
          </div>
      </div>


        <div class="col-md-7 col-sm-6 prod-data">

          <h4 class="cart-h4" id="product-title" ><strong><?php echo $heading_title; ?></strong> </h4>
          <p id="desc"><?php echo strip_tags(substr(html_entity_decode($description),0,500))."..."; ?></p>
          <div class="brannd_mame"><a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></div>
          <span class="cart-h4" id="mod-no"><?php echo "Article#   ".$model;  ?></span><br>
          <div class="rateyo"></div>
          <script>
            $(function(){

              $('.rateyo').rateYo({rating:'<?= (int)$rating?>'});
            });
          </script>
          <span class="votes"><?php echo (int) $reviews ?> votes</span>
               <span class="like"><i><form action="" method="POST" enctype="multipart/form-data" style="display: inline;">
                     <button style="border:none;background-color: #fff;" type="submit" name="product_like" value="<?= $product_id ?>"><img src="image/like.png" alt="">
                     </button>
                   </form></i> <?php echo $countLikes ?></span>

          <div class="share_box">
            <h5>Share Now :</h5>
            <ul data-url="<?php echo $share; ?>">
              <li><a href="https://twitter.com/login" title="twitter"><img src="image/share_icon1.png" alt=""> </a></li>
              <li><a href="https://www.instagram.com/accounts/login/" title="instagram"><img src="image/share_icon3.png" alt=""> </a></li>
              <li><a href="https://www.facebook.com/login" title="facebook"><img src="image/share_icon2.png" alt=""> </a></li>

            </ul>
          </div>


          <table class="discription" width="100%" border="0" cellspacing="0" cellpadding="0">
            <?php if ($price) { ?>
            <?php if (!$special) { ?>

            <tr class="price_nw">
              <td width="24%"><?=$price_now?></td>
              <td width="5%">:</td>
              <td width="71%"><strong><span class="<?php echo $live_options['live_options_price_container']; ?>"><?php echo $price; ?></span></strong></td>
            </tr>

            <?php } else { ?>
            <tr class="price_nw">
              <td width="24%"><?=$price_now?> </td>
              <td width="5%">:</td>
              <!-- <td width="71%"><strong><?php echo $special; ?></strong></td>-->
              <span class="<?php echo $live_options['live_options_special_container']; ?>"><?php echo $special; ?></span>
            </tr>


            <tr class="brfre_pr">
              <td><?=  $BEFORE?></td>
              <td>:</td>
              <td><span class="overline"><?php echo $price; ?></span></td>
            </tr>
            <?php } ?>
            <?php } ?>
          </table>
          <div id="product">
            <?php if ($options) { ?>
            <table class="discription" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <div class="form-group">
                  <td width="24%">
                    <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
                  </td>
                  <td width="5%">:</td>
                  <td width="71%">


                    <div class="input-group spinner">

                      <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control">
                      <div class="input-group-btn-vertical">
                        <button class="btn" type="button"><i class="fa fa-caret-up"></i></button>
                        <button class="btn q-down" type="button"><i class="fa fa-caret-down"></i></button>
                        <input type="hidden" name="product_id" value="" />
                      </div>

                    </div>



                    <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                  </td>
                </div>
              </tr>

            </table>


            <table class="discription" width="100%" border="0" cellspacing="0" cellpadding="0">
              <?php $additionaloptionsubimages = json_decode($additionaloptionsubimages , true); ?>
              <div class="color-box">
                <ul>

                  <?php foreach ($options as $option) { ?>
                  <?php if ($option['type'] == 'radio') { //$additionaloptionsubimages ?>
                  <div  class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label"><?php echo $option['name']; ?></label>
                    <div id="input-option<?php echo $option['product_option_id']; ?>">
                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
                      <?php $option_img_val =  $additionaloptionsubimages[$option_value['product_option_value_id']]; ?>
                      <div class="radio color-img" >
                        <li>
                          <label>
                            <input onclick="showOptions_innerproduct(this , '<?php echo $option_img_val[0]['thumb']?>')" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />

                            <img data-toggle="tooltip" data-placement="top" title="<?php echo $option_value['name']; ?>" src="<?php echo $option_img_val[0]['thumb']?>">

                          </label>
                        </li>
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                </ul>
              </div>
              <?php } ?>

              <?php if ($option['type'] == 'select') { ?>

              <div class='col-md-6'>
                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">

                  <?php if ($option['name']=='color' ){ ?>
                  <?php $selectclass = 'selectpicker'; ?>
                  <?php } else { $selectclass = ''; } ?>
                  <label for="" class="siz-clr"><?php echo $select_color; ?> <?php echo $option['name'] ?></label>

                  <?php  var_dump($option['product_option_value']); ?>
                  <div class="dropdown">


                    <select  onchange="showOptions_innerproduct(this)" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class=" <?php echo $selectclass; ?>">

                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
                      <option data-thumbnail="http://localhost/baghli-fintolog//image/catalog/Retro%20Bin%20Pink.png" class="color <?php echo $option_value['name']; ?>" id="price" value="<?php echo $option_value['product_option_value_id']; ?>">



                      </option>
                      <?php } ?>
                    </select>


                  </div>




                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'checkbox') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <?php if ($option_value['image']) { ?>
                      <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                      <?php } ?>
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'text') { ?>
              <tr>
                <td width="24%">
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                </td>
                <td width="5%">:</td>
                <td width="71%">
                <span>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" disabled  style=" box-shadow:none; border:none; background:none;" /> </span>
                </td></tr>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'textarea') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'file') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"><?php echo $option['name']; ?></label>
            <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'date') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <div class="input-group date">
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'datetime') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <div class="input-group datetime">
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'time') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <div class="input-group time">
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>

          <tr>
            <td colspan="3">
              <div class="stock_clear">


                <span class="<?php echo $stock_css_class;?>"><?php echo $stock;?></span>


                <?php if($stock_css_class!='lightgrn')
                {
                ?>


                <form>
                  <input class="but btn-primary" <?php if($logged){ echo 'name="notify-me"'; }else{ echo 'name="login-me"'; } ?> type="button" value="<?= $entry_rem?>" >
                </form>
                <?php if($logged){ ?>
                <div class="modal fade" id="notify-me" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Messege</h4>
                      </div>
                      <div class="modal-body">
                        We will send you notification once the item back to stock
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="x()">Ok</button>
                      </div>
                    </div>
                  </div>
                </div>
                <?php } } ?>

              </div>

            </td>
          </tr>
          <tr>
            <td colspan="3">
              <div class="form-group">

                <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-arw grey" <?php if($stock_css_class!='lightgrn'){echo 'disabled=""';} ?> > <?php echo $button_cart; ?> <i><img src="image/arrow.png" alt=""></i></button>


                <button type="button" data-toggle="tooltip" class="btn btn-arw grey" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"> <?= $wishlist ?><i ><img src="image/arrow.png" alt=""> </i></button>


                <button onClick="window.location.href='index.php?route=checkout/checkout'" type="button" class="btn btn-arw "><?= $bay ?> <i><img src="image/arrow.png" alt=""></i></button>



              </div>

            </td></tr>

          </table>
        </div>

      </div>

      <div class="col-md-12">
        <div class="row">
          <div class="heading small"><span ><strong> <?= $PRODUCT?> <?= $DETAILS?></strong></span></div>
          <!--   <span class="cap">Product Description </span> -->
          <p> <?php echo $description;?> </p>
          <?php echo $content_bottom; ?>


        </div>
      </div>
    </div>

    <!-- <?php if ($products) { ?>
     <div class="reltd-prod">
    <div class="container">
    <h6><?php echo $text_related; ?></h6>
    <div class="row">
      <?php $i = 0; ?>
      <?php foreach ($products as $product) { ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-xs-8 col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-xs-6 col-md-4'; ?>
      <?php } else { ?>
      <?php $class = 'col-xs-6 col-sm-3'; ?>
      <?php } ?>
      <div class="<?php echo $class; ?>">
        <div class="product-thumb transition">
          <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
            <p><?php echo $product['description']; ?></p>
            <?php if ($product['rating']) { ?>
            <div class="rating">
              <?php for ($j = 1; $j <= 5; $j++) { ?>
              <?php if ($product['rating'] < $j) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
            </div>
            <?php } ?>
            <?php if ($product['price']) { ?>
            <p class="price">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
              <?php } ?>
              <?php if ($product['tax']) { ?>
              <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
              <?php } ?>
            </p>
            <?php } ?>
          </div>
          <div class="button-group">
            <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
            <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
          </div>
        </div>
      </div>
      <?php if (($column_left && $column_right) && (($i+1) % 2 == 0)) { ?>
      <div class="clearfix visible-md visible-sm"></div>
      <?php } elseif (($column_left || $column_right) && (($i+1) % 3 == 0)) { ?>
      <div class="clearfix visible-md"></div>
      <?php } elseif (($i+1) % 4 == 0) { ?>
      <div class="clearfix visible-md"></div>
      <?php } ?>
      <?php $i++; ?>
      <?php } ?>
    </div>
    <?php } ?> -->
  </div> </div> </div>
<?php if ($products) { ?>

<div class="reltd-prod">

  <div class="container">
    <h4 class="cap-head"><?php echo $text_related; ?></h4>
    <div id="umay-like" class="owl-carousel owl-theme">
      <?php foreach ($products as $product) { ?>
      <div class="row">
        <div class="item" style="padding-right: 30px" >
          <figure>
            <div class="image"  ><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive"> </a></div>
            <figcaption>
              <h4 class="cart-h4" ><strong><?php echo $product['name']; ?> </strong></h4>


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


              <?php } ?>

            </figcaption>
          </figure>
        </div></div>

      <?php } ?>
    </div>
  </div>
  <?php } ?>

</div>
</div>



<?php //echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
<?php //echo $content_bottom; ?>
<div class="review-area container inner-page">
  <div class="heading small"><span><strong>Customer  Reviews</strong></span></div>
  <?php if ($review_status) { ?>


  <div class="tab-pane" id="tab-review">

    <div id="review"></div>
    <form class="form-horizontal" id="form-review">
      <h2><?php echo $text_write; ?></h2>
      <?php if ($review_guest) { ?>
      <div class="form-group required">
        <div class="col-sm-12">
          <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
          <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
        </div>
      </div>
      <div class="form-group required">
        <div class="col-sm-12">
          <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
          <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
          <div class="help-block"><?php echo $text_note; ?></div>
        </div>
      </div>
      <div class="form-group required">
        <div class="col-sm-12">
          <label class="control-label"><?php echo $entry_rating; ?></label>
          &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
          <input type="radio" name="rating" value="1" />
          &nbsp;
          <input type="radio" name="rating" value="2" />
          &nbsp;
          <input type="radio" name="rating" value="3" />
          &nbsp;
          <input type="radio" name="rating" value="4" />
          &nbsp;
          <input type="radio" name="rating" value="5" />
          &nbsp;<?php echo $entry_good; ?></div>
      </div>
      <?php echo $captcha; ?>
      <div class="buttons clearfix">
        <div class="pull-right">
          <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
        </div>
      </div>
      <?php } else { ?>
      <?php echo $text_login; ?>
      <?php } ?>
    </form>

    <?php } ?>
  </div>

  <?php if ($attribute_groups) { ?>

  <h4>Tips & Advices</h4>
  <style type="text/css">
    li{
      padding: 4px;
    }
  </style>
  <?php foreach ($attribute_groups as $attribute_group) { ?>

  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
  <ul>
    <!--  <li>  <?php var_dump(explode("\n",$attribute['text'] ));  ?> </li> -->
    <?php $numbers = $attribute['text'];?>

    <?php $array =  explode("\n", $numbers); ?>

    <?php foreach ($array as $item) {
    echo "<li>$item</li>";
    } ?>

  </ul>
  <?php } ?>

  <?php } ?>
  <?php } ?>




</div> </div>

<script type="text/javascript"><!--


  $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
    $.ajax({
      url: 'index.php?route=product/product/getRecurringDescription',
      type: 'post',
      data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
      dataType: 'json',
      beforeSend: function() {
        $('#recurring-description').html('');
      },
      success: function(json) {
        $('.alert, .text-danger').remove();

        if (json['success']) {
          $('#recurring-description').html(json['success']);
        }
      }
    });
  });

  //--></script>


<script type="text/javascript"><!--
  $('#button-cart').on('click', function() {
    $.ajax({
      url: 'index.php?route=checkout/cart/add',
      type: 'post',
      data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
      dataType: 'json',
      beforeSend: function() {
        $('#button-cart').button('loading');
      },
      complete: function() {
        $('#button-cart').button('reset');
      },
      success: function(json) {
        $('.alert, .text-danger').remove();
        $('.form-group').removeClass('has-error');

        if (json['error']) {
          if (json['error']['option']) {
            for (i in json['error']['option']) {
              var element = $('#input-option' + i.replace('_', '-'));

              if (element.parent().hasClass('input-group')) {
                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
              } else {
                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
              }
            }
          }

          if (json['error']['recurring']) {
            $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
          }

          // Highlight any found errors
          $('.text-danger').parent().addClass('has-error');
        }

        if (json['success']) {
          $('.content').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

          $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

          $('html, body').animate({ scrollTop: 0 }, 'slow');

          $('#cart > ul').load('index.php?route=common/cart/info ul li');
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });
  //--></script>

<script type="text/javascript"><!--
  $('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
  });

  $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

  $('#button-review').on('click', function() {
    $.ajax({
      url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
      type: 'post',
      dataType: 'json',
      data: $("#form-review").serialize(),
      beforeSend: function() {
        $('#button-review').button('loading');
      },
      complete: function() {
        $('#button-review').button('reset');
      },
      success: function(json) {
        $('.alert-success, .alert-danger').remove();

        if (json['error']) {
          $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
        }

        if (json['success']) {
          $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

          $('input[name=\'name\']').val('');
          $('textarea[name=\'text\']').val('');
          $('input[name=\'rating\']:checked').prop('checked', false);
        }
      }
    });
  });

  //--></script>






<script type="text/javascript">

  $(document).ready(function(){
    $('.spinner .btn:first-of-type').on('click', function() {
      var spinner=$(this).parent().parent();

      spinner.find('input').val( parseInt(spinner.find('input').val(), 10) );

    });



    $('.spinner .btn:last-of-type').on('click', function() {
      var spinner=$(this).parent().parent();
      spinner.find('input').val( parseInt(spinner.find('input').val(), 10) );
      var newValue= parseInt(spinner.find('input').val(), 10) ;
      newValue=(newValue <1 )? 1:newValue;
      spinner.find('input').val(newValue);

    });


    $(document).on('click', '.q-down', function() {
      var spinner=$(this).parent().parent();
      var quantity = spinner.find('#input-quantity').val();

      if(quantity == 0){
        spinner.find('#input-quantity').val('1');
      }
    });

  });


</script>



<script type="text/javascript" src="index.php?route=product/live_options/js&product_id=<?php echo $product_id; ?>"></script>
<?php echo $footer; ?>

<?php if ($direction == 'rtl') { ?>
<style type="text/css">
  .zoomWindowContainer{position: relative !important;left:-850px !important;}
</style>
<?php } ?>

<script>
  $(function(){

    $('.rateyo').rateYo({rating:'<?= (int)$rating?>'});
  });
</script>
<!-- xzoom plugin here -->
<script src="catalog/view/theme/baghli-arbash/js/jquery.js"></script>
<script type="text/javascript" src="catalog/view/theme/baghli-arbash/js/xzoom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/baghli-arbash/css/xzoom.css" media="all" />

<link rel="stylesheet" type="text/css" href="catalog/view/theme/baghli-arbash/css/rtl/css/xzoom.css" media="all" />

<script type="text/javascript" src="catalog/view/theme/baghli-arbash/js/setup.js"></script>

