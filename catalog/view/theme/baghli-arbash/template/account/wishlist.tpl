<?php echo $header; ?>


<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/innr-bnr-16.png" alt=""></div>
  

   <div class="container inner-page">
   <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>

       <div class="content"></div>
      <div class="heading"><span><strong><?php echo $heading_title; ?></strong></span> <div class="sort pull-right"> <?= $sort1 ?>
            <select class="form-control"  id="input-sort" onchange="location = this.value";>
            
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>

              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
             
            </select>
            </div>
  </div>

 <div class="row">
<?php if ($products) { ?>
 <?php $i=1; foreach ($products as $product) { ?>
    <?php if($i%2==1) { ?><div class="row innr-shpng-cart clearfix"><?php } ?>

     <div class="col-md-6 col-sm-6">

              <div class="row">
              <!-- image list div -->
              <div class="col-md-6 list-imageNew new_align">
                <a href="<?= $product['href']; ?>"><img src="<?= $product['thumb']; ?>" alt=""></a>
                <div class="offer-label"><?php echo round(100 - ($special_amt*100/$price_amt))."% "; ?><span>OFF</span> </div>
              </div>
              <!-- lsit details div -->
              <div class="col-md-6 proLst-cont updte_design">
                <!-- title section -->
                <div class="row">
                    <div class="col-md-12">
                      <h4 class="cart-h4"><a href="<?= $product['href']; ?>"><strong><?= $product['name'] ?></strong></a></h4>
                      <span><a href="index.php?route=product/manufacturer/info&manufacturer_id=<?=$product['brand_id']?>"><?= $product['brand']; ?></a></span>
                      <span class="save"><?= $add ?>: <?= $product['date_added'];?> </span>



              <?php if ($product['rating']) { ?>
                        <div class="rateyo" >
                          
                        </div>
<script>
$(function(){

  $('.rateyo').rateYo({rating:'<?= (int)$product['rating']?>'});
});
                </script>

                        <?php } ?>


                  
                      <div class="dicnt algnvww"><?= $Viwed1 ?> : <span><?=$product['viewed'] ?></span></div>

                    </div>
                </div><!--row-->
                <div class="row">
                  <div class="col-md-6">
                   <?php if (!$product['special']) { ?>
                 <div class="list-price-div">  <?= $price ?>:   <span><?php echo $product['price']; ?></span> </div>
                  <?php  } else { ?>

                    <div class="list-price-div"> <?= $price ?> :<span> <?php echo $product['special']; ?></span> </div>
                     <?php    } ?> 
                     <?php if (!$product['special']) { ?>
            
                        <div class="list-price-div"> <span> <?php echo $product['special']; ?></span> </div>
          
                <?php } else { ?>
                        <span class="overline"><?= $Befor ?> : <?php echo $product['price']; ?> </span>
      
                  
            <?php } ?> 
                    
                  </div>
                  <div class="col-md-6">
                    <div class="qnty">
                      <strong><?= $Quantity ?></strong>
                        <div class="input-group spinner">
                          <input class="form-control"  type="text"  id="input-quantity"  value="<?= $product['minmum'] ?>" name="quantity"  size="2">
                          <div class="input-group-btn-vertical">
                            <button class="btn" type="button"><i class="fa fa-caret-up"></i></button>
                            <button class="btn q-down" type="button"><i class="fa fa-caret-down"></i></button>
                            <input type="hidden" name="product_id" value="<?= $product['product_id'] ?>" />
                          </div>
                        </div>
                      </div>
                   
                  </div>
                </div><!--row-->
                <?php if ($options){ ?>
                 <?php foreach ($options as $option) { ?>  
                <div class="row">
                  <div class='col-md-6'>
                  <?php if ($option['type'] == 'select' && $option['name']=='color'&&$option['product_option_value']['product_id']==$product['product_id']) {  ?>
                 <div class="form-group">
                      <label for="input-option<?php echo $option['product_option_id']; ?>" class="siz-clr"><?php echo $option['name']; ?></label>
                      <div class="dropdown">
                        <button class="btn _select_color dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Green
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
                    <?php }?> <!-- end of select color -->
                  </div> <!--  <div class='col-md-6'> color-->



                  <div class="col-md-6 s1" >

<?php if ($option['type'] == 'radio'  && $option['name']=='size' && $option['product_option_value']['product_id']==$product['product_id']) { ?>
                     <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
 <label class="siz-clr"><?php echo $option['name']; ?></label>
  <select  name ="option['<?php echo $option['product_option_id']; ?>']" id="input-option<?php echo $option['product_option_id']; ?>" class="siz-clr"> 
                  <option value="" selected>Please Select</option> 
                  
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
                    <?php }?>
                  </div> <!--  <div class="col-md-6"> size-->
                </div>
                
                
                
                    
                <?php if ($option['type'] == 'text' && $option['product_option_value']['product_id']==$product['product_id']) { ?>
                    
                <div class="col-md-16" >
          <div class="add_dtt" >
            
                   <div > <span class="gurnty" ><?php echo $option['name'];?> :<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" disabled  style=" box-shadow:none; border:none; background:none; "/>  </span> </div>
                 
           
          </div>    
        </div>
<?php }?>
         
               
         
          <?php }?> <!-- foreach option!-->
              <?php }?>  <!-- end if option-->
 <div class="add_dtt">
<div class="stock_clear">
                
                 <span class="<?php echo $stock_css_class;?>"><?php echo $stock;?></span>
                 

                
               </div>
</div>            
                <div>
                <div class="col-md-6 s" >
                   <div class="add-crt ">
            <input id="button-cart" onclick="cart.add('<?php echo $product['product_id'];?>')" value="<?= $addtocart?>" class="btn_wrap add_algn" type="button"  <?php if($stock_css_class!='lightgrn'){echo 'disabled=""';} ?>>
          </div>
                     <div class="add-crt">
                    <input name="" onClick="window.location.href='<?php echo $product['remove']; ?>'" type="button" value="<?= $Delete ?>" class="btn_wrap delte">
                    </div>
        </div>
        </div>
              </div>
            </div>
 
 </div> <!-- <div class="col-md-6 col-sm-6">-->

<?php if($i%2==0) { ?></div><?php } $i++; ?>
        <?php } ?> <!-- foreach-->

 </div>
 <?php }   else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
           

 </div> </div>







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

    <script>

    //RATING STAR START HERE

      $(function () {

  var rating = "<?= $product['rating']?>";

        $(".counter").text(rating);

        $("#rateYo1").on("rateyo.init", function () { console.log("rateyo.init"); });

        $("#rateYo1").rateYo({

          rating: rating,
          numStars: 5,
          precision: 2,
          starWidth: "64px",
          spacing: "5px",
    rtl: true,
          multiColor: {
            startColor: "#000000",
            endColor  : "#ffffff"
          },
          onInit: function () {


            console.log("On Init");
          },
          onSet: function () {

            console.log("On Set");
          }
        }).on("rateyo.set", function () { console.log("rateyo.set"); })
          .on("rateyo.change", function () { console.log("rateyo.change"); });

        $(".rateyo").rateYo();

        $(".rateyo-readonly-widg").rateYo({

          rating:rating,
          numStars: 5,
          precision: 2,
          minValue: 1,
          maxValue: 5
        }).on("rateyo.change", function (e, data) {

          console.log(data.rating);
        });
      });
    </script>

    <script>
      // ===== Scroll to Top ====
    $(window).scroll(function() {
      if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
        $('#return-to-top').fadeIn(200);    // Fade in the arrow
      } else {
        $('#return-to-top').fadeOut(200);   // Else fade out the arrow
      }
    });
    $('#return-to-top').click(function() {      // When arrow is clicked
      $('body,html').animate({
        scrollTop : 0                       // Scroll to top of body
      }, 500);
    });
    </script>
    

    <script>
  //DROPDOWN ON CLICK DEVICE
  $(function () {
    ww = document.body.clientWidth;
    if (ww < 1030) {
      $('.navbar-collapse a').click(function () {

        if ($(this).closest("li").children("ul").length) {
          if ($(this).parent("li").hasClass('expnd')) {
            window.location = this.href;
          }

          $('.navbar-collapse a').removeClass('disabled');
          $(this).parent("li").addClass("expnd");
    $('.navbar-collapse a').not(this).parent("li").removeClass("expnd");
        }
      });
    }
  })

  </script>
  <script>

_colors=$('._select_color_drop li');
    for (var i = _colors.length - 1; i >= 0; i--) {
        $(_colors[i]).click(function(){
            var color_text = $(this).find('span').attr('_text_display');
            var elemnt = $(this).closest('._select_color_drop').prev();
            elemnt.find('span.color').remove();
            $(this).find('span').clone().appendTo(elemnt);
            var contents = $(elemnt).contents();
            if (contents.length > 0) {
                if (contents.get(0).nodeType == Node.TEXT_NODE) {
                    $(elemnt).html(color_text).append(contents.slice(1));
                }
            }
            if($('[name=_color]').val() == undefined){
                elemnt.next().append("<input type='hidden' name='_color' value='"+color_text+"'>");
            }else{
                $('[name=_color]').val(color_text);
            }

        })
    };
  </script>
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
window.location.href='http://localhost/baghli/index.php?route=account/wishlist&remove=products[product_id]';
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
        $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

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
       <?php echo $footer; ?>