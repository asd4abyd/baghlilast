<?php echo $header; ?>
<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/innr-bnr-01.png" alt=""></div>
<div class="container">
  


    <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    
     <div class="container inner-page">


         <div class="content"><!-- alert message class -->


         </div><!-- alert message class -->

      <div class="heading"><span><strong><?php echo $heading_title; ?></strong></span>

    <div class="sort pull-right">
                <div class="row">

                  <div class="col-sm-6 sort-search">
                       <div class="input-group"><!-- /input-group -->
                     <form action="" method="Post" class="input-group">

                      <input  type="text" class="form-control" name="search" placeholder="<?= $search ?>">
                      <div class="input-group-btn">
                        <button class="btn btn-default" style="margin-top:0;" type="submit"><?= $Go?></button>
                      </div>

                          </form>
                       </div><!-- /input-group -->
                    </div>

                    <div class="col-sm-6">
                    <?= $text_sort ?>

                    <select class="form-control"  id="input-sort" onchange="location = this.value";>

              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>

              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?> </option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>

                   </select>

                    </div>
                </div>
            </div>
         </div>



         <!-- start category page -->

         <!--

                 <?php //foreach ($categories as $category) { ?>

               <?php // if ($category) { ?>

                       <div class="col-sm-4 col-md-6 ">

                             <figure>

                   <a href="<?php // echo $category['href']; ?>">

                   <?php // if($category['image']) { ?>
                   <img id="background-color" src="<?php // echo $category['image'];?>" title="<?php // echo $category['name'];?>" />

                   <?php // } else { ?>

                   <img src="catalog/view/theme/baghli-arbash/images/brand.png" alt="">

                   <?php // } ?>

                   </a>

                             <figcaption>
                             <h4><a href="<?php // echo $category['href']; ?>"><?php // echo $category['name']; ?></a></h4>
                             </figcaption>

                             </figure>

                         </div>

               <?php // }}  ?>


                  <!-- end category page -->


         <!-- start product page -->
<!-- options -->
         <div class="row">
        <?php $i=1; foreach ($products as $product) { ?>
    <?php if($i%2==1) { ?><div class="row innr-shpng-cart clearfix"><?php } ?>
      <div class="col-md-6 col-sm-6">

            <div class="row">
              <!-- image list div -->

              <div class="col-md-6 list-imageNew new_align">
             <div class="image">

               <a href="<?php echo $product['href']; ?>">
                   <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>

             </div>
              </div>

              <!-- lsit details div -->

              <div class="col-md-6 proLst-cont updte_design">
                <!-- title section -->
                <div class="row">
                    <div class="col-md-12">
                      <h4 class="cart-h4">

                          <a href="<?php echo $product['href']; ?>"><strong>
                                  <?php echo($product['name']); ?></strong></a></h4>

                      <span><a href="index.php?route=product/manufacturer/info&manufacturer_id=<?php echo $product['manufacturer_id']?>"> <?=$product['manufacturer']; ?></a></span>


                        <?php if ($product['rating']) { ?>
                        <div class="rateyo" >

                        </div>
<script>
$(function(){

  $('.rateyo').rateYo({rating:'<?= (int)$product['rating']?>'});
});
                </script>


                        <?php }else{ ?>
						<div class="rating">
                                       <?php for ($j = 1; $j <= 5; $j++) { ?>

                                      <span class="fa fa-stack"> <i class="fa fa-star" aria-hidden="true"></i></span>

                                      <?php } ?>
                                  </div>
						<?php } ?>

                      <div class="dicnt algnvww"><?= $View1?> : <span><?=$product['viewed'] ?></span></div>

                    </div>
                </div><!--row-->

                <div class="row">
          <?php if ($product['price']) { ?>
          <div class="col-md-6">
            <?php if (!$product['special']) { ?>
            <div class="list-price-div">  <?= $text_price ?> <span><?php echo $product['price']; ?> </span></div>
            <?php } else { ?>
            <div class="list-price-div"> <?= $text_price ?> <span><?php echo $product['special']; ?></span> </div> <span class="overline"> <?= $Befor ?>:<?php echo $product['price']; ?></span>
            <?php } ?>
           <!--  <?php if ($product['tax']) { ?>
            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
            <?php } ?> -->
           </div>
          <?php } ?>


                  <div class="col-md-6">
                    <div class="qnty">
                      <strong><?= $text_quantity ?></strong>
                        <div class="input-group spinner">
                          <input class="form-control"  type="text"  id="input-quantity"  value="<?= $product['minimum'] ?>" name="quantity"  size="2">
                          <div class="input-group-btn-vertical">
                            <button class="btn" type="button"><i class="fa fa-caret-up"></i></button>
                            <button class="btn q-down" type="button"><i class="fa fa-caret-down"></i></button>
                            <input type="hidden" name="product_id" value="<?= $product['product_id'] ?>" />
                          </div>
                        </div>
                      </div>
                  </div>

                </div><!--row-->


                  <div class="row">
              <?php if($product['options']) { ?>
              <?php foreach ($product['options'] as $option) { ?>



                <?php if ($option['type'] == 'select' ) {  ?>

                     <div id="product">
                  <div class='col-md-6'>

                 <div class="form-group">
                      <label for="input-option<?php echo $option['product_option_id']; ?>" class="siz-clr"><?php echo $option['name']; ?></label>
                      <div class="dropdown">
                        <button class="btn _select_color dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                          <span class="caret _right"></span>
                          <span _text_display="<?php echo $text_select; ?>" class="color green"></span>
                        </button>
                        <ul class="dropdown-menu _select_color_drop" aria-labelledby="dropdownMenu1">
                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                          <?php if(isset($option_value['name'])){ ?>                           <li><span _text_display="<?php echo $option_value['name']; ?>" class="color <?php echo strtolower($option_value['name']); ?>"></span></li>
                        <?php } ?>
                        <?php }?>
                          <input type="hidden" name="_color" id="input-option<?php echo $option['product_option_id']; ?>" value="<?php echo $text_select; ?>">
                        </ul>
                      </div>
                    </div>

                  </div>
                  <?php }?>
                      <?php if ($option['type'] == 'radio'){ ?>
                  <div class="col-md-6 s1" >

                     <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
 <label class="siz-clr"><?php echo $option['name']; ?></label>
  <select  name ="option['<?php echo $option['product_option_id']; ?>']" id="input-option<?php echo $option['product_option_id']; ?>" class="siz-clr">
                  <option value="" selected><?= $please ?></option>

                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <?php if(isset($option_value['name'])){ ?>
              <option value="<?php echo $option_value['product_option_value_id']; ?>">
              <?= "".$option_value['name']."" ?>

                </option>
                <?php
                    } // if close
                } //foreach close ?>
                      </select>


                    </div>

                  </div> </div>

                  <?php }?>



                <div class="row">
                 <?php if ($option['type'] == 'text'){ ?>
               <div class="col-md-10 ">

          <div class="add_dtt">
<div > <span class="gurnty" ><?php echo $option['name'];?> :<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" disabled  style=" box-shadow:none; border:none; background:none; "/>  </span> </div>
          </div>

        </div>
        <?php }?>
        </div>
    <?php } ?> <?php }?>


    <div class="row">
                <div class="col-md-6">
					<div class="add_dtt">
						<span class="gurnty"><br/></span>
						<span><br/></span>
						  <span class="stock-out"><?php echo $product['stock_status'];?></span>
					</div>
				</div>

                <div class="col-md-6">
                <div class="add-crt">
                      <input type="button" value="<?php echo $button_wishlist; ?>" class="btn_wrap wishbtn" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                    </div>
                    <div class="add-crt">
                      <input id="button-cart" type="button" value="<?php echo $button_cart; ?>" class="btn_wrap" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
                    </div>
				</div>
				  </div>

 </div>
          </div>
        </div>
       </div>

    <?php if($i%2==0) { ?></div><?php } $i++; ?>
        <?php } ?>  
      </div><!-- end options -->


<div class="col-md-12 text-center">
<div class="col-md-3">
<div  style="vertical-align: top;display: inline-block;   ">
<?php echo $pagination; ?>
</div>
<div class="form-group input-group input-group-sm" style="vertical-align: top;display: inline-block;     margin: 20px 0; max-width: 30%;">
            
			<option value="" ><label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label> </option>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
			
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
</div>

</div> 

          
        

<!--
<div class=" col-md-6 text-right" style="float: right;"><?php  echo $results; ?></div> -->
      </div>
      
      <?php // }} ?>
      
      
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div> 
      <?php } ?>
      
      
    </div></div> </div>
<?php if ($products) { ?>

<div class="reltd-prod">

    <div class="container">
        <h4 class="cap-head"><?= $related?></h4>
        <div id="related-products" class="owl-carousel owl-theme">
            <?php foreach ($products as $product) { ?>
            <div class="row">
                <div class="item">
                    <figure>
                        <div class="img"  ><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive"> </a></div>
                        <figcaption>
                            <h4><strong><?php echo $product['name']; ?> </strong></h4>


                            <?php if ($product['price']) { ?>

                            <?php if (!$product['special']) { ?>
                            <strong><?= $text_price?> <?php echo $product['price']; ?>   </strong>
                            <?php } else { ?>
                            <span class="overline" style="display: block;"><?=$Befor?> :<?php echo $product['price']; ?></span>
                            <strong><?= $text_price?><?php echo $product['special']; ?> </strong>
                            <?php } ?>
                            <?php if ($product['tax']) { ?>
                            <!-- <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span> -->
                            <?php } ?>

                            <?php } ?>
                            <!-- <?php if ($product['rating']) { ?>
                        <div class="rateyo" >

                        </div>
<script>
$(function(){

  $('.rateyo').rateYo({rating:'<?= (int)$rating?>'});
});
                </script>

                        <?php } ?> -->

                        </figcaption>
                    </figure>
                </div></div>

            <?php } ?>




        </div>
    </div>
    <?php } ?>

</div>


      <?php echo $content_bottom; ?>
    <?php echo $column_right; ?>








<script type="text/javascript"><!--
$('#button-cart').on('click', function() {

    $("#personal-information-success").hide();

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
        $("#button-cart2").before("<div class='alert alert-success' ><a href='#' class='close' data-dismiss='alert'>&times;</a>Your added the product to  .</div>");


      if (json['success']) {

        $('#content').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

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

  
 




<script type="text/javascript">
    $(document).ready(function(){
      $('.spinner .btn:first-of-type').on('click', function() {
        var spinner=$(this).parent().parent();


      spinner.find('input').val( parseInt(spinner.find('input').val(), 10) + 1);
      });
     


      $('.spinner .btn:last-of-type').on('click', function() {
        var spinner=$(this).parent().parent();
      spinner.find('input').val( parseInt(spinner.find('input').val(), 10) - 1);
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

<?php  echo $footer; ?>
<script>
    $(document).ready(function() {
      $('input[name="notify-me"]').on('change', function(e){
         if(e.target.checked){
           $('#notify-me').modal();
         }
      });
      $('input[name="login-me"]').on('change', function(e){
         if(e.target.checked){
           window.location.href = 'index.php?route=account/login';
         }
      });
      $('.q-down').click(function(){
          if($('#input-quantity').val() == 0){
            $('#input-quantity').val('1');
          }
      });
  $("#related-products").owlCarousel({

      autoPlay: false, //Set AutoPlay to 3 seconds
      items : 4,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3],
    navigationText:false,
    navigation : true,
    pagination : false

  });
 

   $("#umay-like").owlCarousel({
      autoPlay: true, //Set AutoPlay to 3 seconds
      items :6,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3],
    navigationText:false,
    navigation : true,
    pagination : false

  });

  var mac1 = $("#mac1");
  var mac2 = $("#mac2");

  mac1.owlCarousel({
    singleItem : true,
    slideSpeed : 1000,
    navigation: true,
    pagination:false,
    afterAction : macPosition,
    responsiveRefreshRate : 200,
  });

  mac2.owlCarousel({
    items : 4,
    itemsDesktop      : [1199,4],
    itemsDesktopSmall     : [979,4],
    itemsTablet       : [768,3],
    itemsMobile       : [479,2],
    pagination:false,
    responsiveRefreshRate : 100,
    afterInit : function(el){
      el.find(".owl-item").eq(0).addClass("maced");
    }
  });

  function macPosition(el){
    var current = this.currentItem;
    $("#mac2")
      .find(".owl-item")
      .removeClass("maced")
      .eq(current)
      .addClass("maced")
    if($("#mac2").data("owlCarousel") !== undefined){
      centered(current)
    }
  }

  $("#mac2").on("click", ".owl-item", function(e){
    e.preventDefault();
    var number = $(this).data("owlItem");
    mac1.trigger("owl.goTo",number);
  });

  function centered(number){
    var mac2visible = mac2.data("owlCarousel").owl.visibleItems;
    var num = number;
    var found = false;
    for(var i in mac2visible){
      if(num === mac2visible[i]){
        var found = true;
      }
    }

    if(found===false){
      if(num>mac2visible[mac2visible.length-1]){
        mac2.trigger("owl.goTo", num - mac2visible.length+2)
      }else{
        if(num - 1 === -1){
          num = 0;
        }
        mac2.trigger("owl.goTo", num);
      }
    } else if(num === mac2visible[mac2visible.length-1]){
      mac2.trigger("owl.goTo", mac2visible[1])
    } else if(num === mac2visible[0]){
      mac2.trigger("owl.goTo", num-1)
    }

  }

});
</script>

<script>

_colors=$('._select_color_drop li');
    for (var i = _colors.length - 1; i >= 0; i--) {
        $(_colors[i]).click(function(){
            var color_text = $(this).find('span').attr('_text_display');
            var color_id = $(this).attr('value');
            var elemnt = $(this).closest('._select_color_drop').prev();
            elemnt.find('span.color').remove();
            $(this).find('span').clone().appendTo(elemnt);
            var contents = $(elemnt).contents();
            if (contents.length > 0) {
                if (contents.get(0).nodeType == Node.TEXT_NODE) {
                    $(elemnt).html(color_text).append(contents.slice(1));
                }
            }

            if($('[class=_color]').val() == undefined){
                elemnt.next().append("<input type='hidden' class='_color' value='"+color_id+"'>");
            }else{
                $('[class=_color]').val(color_id);
            }
        })
    };
 
 
$(document).ajaxStop(function(){
	 setTimeout('window.location.href=window.location.href;', 2000);
});
  </script>