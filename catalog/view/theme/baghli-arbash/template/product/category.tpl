<?php  echo $header; ?>

<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/innr-bnr-01.png" alt=""></div>


<div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

    <div class="container inner-page">
        <?php
    $heading_title_pieces = explode(" ", $heading_title);
    ?>


        <div class="content"><!-- alert message class -->


        </div><!-- alert message class -->


        <div class="heading">
            <span><strong><?php echo $heading_title_pieces[0];?></strong>

                <?php
         for($i=1; $i< count($heading_title_pieces); $i++){
         echo $heading_title_pieces[$i]." ";
         }
        ?>

          </span>

            <div class="sort pull-right">
                <div class="row">

                    <div class="col-sm-6 sort-search">
                        <div class="input-group"><!-- /input-group -->
                            <form action="" method="Post" class="input-group">

                                <input  type="text" value="<?=array_key_exists('search',$_POST)? $_POST['search']:'' ;?>" class="form-control" name="search" placeholder="<?= $search ?>">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" style="margin-top:0;" type="submit"><?= $Go?></button>
                                </div>

                            </form>
                        </div><!-- /input-group -->
                    </div>

                    <?php // print_r($sorts); ?>



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


        <div class="row">

            <?php  foreach ($categories as $category) { ?>


            <?php // print_r ($category['id']==101); ?>

            <div class="col-sm-12 col-md-4 img">
                <div class="row brands-page">
                    <div class="col-sm-12 bran_details">
                        <h4 class="ban_title"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a> </h4>
                    </div>

                    <div class="col-sm-12 col-md-12 img" style=" max-height: 500px; min-height: 500px; margin-bottom:30px">
                        <figure>
                            <a href="<?php echo $category['href']; ?>">

                                <?php if ((strpos($category['image'], 'jpg') !== false) || (strpos($category['image'], 'png') !== false)) { ?>
                                <img style=" max-height: 350px; min-height: 350px;" src="<?php echo $category['image']; ?>" title="<?php echo $category['name'];?>" />
                                <?php } else { ?>
                                <img style=" max-height: 350px; min-height: 350px;" src="catalog/view/theme/baghli-arbash/images/brand.png" alt="">
                                <?php } ?>
                            </a>

                        </figure>
                    </div>


                </div>
            </div>

            <?php  } ?>


            <div class="row brands-page">


                <?php $i=1; foreach ($products as $product) { ?>
                <?php if($i%2==1) { ?>

                <?php } ?>
                <!--product new-->

                <div class="col-md-6 col-sm-6">



                    <div class="row">
                        <!-- image list div -->
                        <div class="col-md-6 list-imageNew new_align">
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/></a>
                        </div>
                        <!-- lsit details div -->
                        <div class="col-md-6 proLst-cont updte_design">
                            <!-- title section -->
                            <div class="row">
                                <div class="col-md-12">
                                    <h4 class="cart-h4"><a href="<?php echo $product['href']; ?>"><strong><?php echo $product['name']; ?></strong></a></h4>
                                    <span><?php echo $brand_name; ?><a href="index.php?route=product/manufacturer/info&manufacturer_id=<?php echo $product['manufacturer_id']?>"> <?=$product['manufacturer']; ?></a></span><br>
                                    <span class="cart-h4"><?php echo $article_no; ?><?php echo $product['model']; ?></span><br>





                                    <?php if ($product['rating']) { ?>

                                    <div class="rateyo" >

                                    </div>


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

                                <div class="col-md-6"> <!--row price -->

                                    <?php if (!$product['special']) { ?>

                                    <div class="list-price-div">  <?= $text_price ?> <span><input style="border:0px;" type="text" name="mainprice" id="mainprice" value="<?php echo $product['price']; ?>" />
                                        <input type="hidden" name="basicprice" id="basicprice" value="<?php echo $product['price']; ?>" />
                                        <input type="hidden" name="price_width_option" id="price_width_option" value="<?php echo $product['price']; ?>" />
                                       </span></div>

                                    <?php } else { ?>
                                    <div class="list-price-div"> <?= $text_price ?> <span><?php echo $product['special']; ?></span> </div> <span class="overline"> <?= $Befor ?>:<?php echo $product['price']; ?></span>
                                    <input type="hidden" name="mainprice" id="mainprice" value="<?php echo $product['special']; ?>" />
                                    <?php } ?>

                                </div> <!--row price -->
                                <?php } ?>

                                <div class="col-md-6"><!--row Quantity -->
                                    <div class="qnty">
                                        <strong><?= $text_quantity ?></strong>






                                        <div class="input-group spinner">
                                            <input type="text" class="form-control" value="<?= $product['minimum'] ?>">
                                            <div class="input-group-btn-vertical">
                                                <button class="btn" type="button"><i class="fa fa-caret-up"></i></button>
                                                <button class="btn q-down" type="button"><i class="fa fa-caret-down"></i></button>
                                                <input type="hidden" name="product_id" value="<?= $product['product_id'] ?>" />

                                            </div>
                                        </div>


                                    </div>

                                </div><!--row Quantity -->


                            </div><!--row-->



                            <!-- options section start -->

                            <div class="row" id="product">
                              <?php
				$counter = 0;




				if ($product['options']){

				foreach ($product['options'] as $option) { ?>

                                <?php // print_r($option); ?>


                                <div id="thisIsOriginal" style="visibility: hidden;"><?php // echo $price; ?></div>


                                <?php if ($option['type'] == 'select') { ?>
                                <div class='col-md-6'>
                                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">


                                        <?php // print_r($option['name']); ?>

                                        <label for="" class="siz-clr"><?php echo $select; ?><?php echo $option['name'] ?></label>


                                        <div class="dropdown">


                                            <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control select">
                                                <option value="" selected><?php echo "Select"; ?></option>
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>


                                                <option id="price" value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>

                                                    <?php // print_r($option_value); ?>


                                                    <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix'].$option_value['price']; ?>)
                                                    <?php } ?>

                                                    <?php // echo $option_value['option_description']; ?>
                                                    <?php  // echo $option_value['option_title'] ; ?>
                                                </option>


                                                <?php } ?>
                                            </select>


                                        </div>




                                    </div>
                                </div>
                                <?php } ?>






                                <?php
				  $counter++;
				  if($counter==4) break;?>

                                <?php } ?>
                                <?php } ?>
                            </div>
                            <!-- options section end -->

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="add_dtt"> <?php if ($product['options']){ ?>
                                        <?php foreach ($product['options'] as $option) { ?>
                                        <?php if ($option['type'] == 'text') { ?>
                                        <span class="gurnty">
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input  type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" readonly/>
            </div>
            </span><?php }} } ?>
                                        <span class="stock-out"><?php echo $product['stock_status'];?></span>
                                    </div>
                                </div>

                                <!-- buttons -->
                                <div class="col-md-6">
                                    <div class="add-crt">

                                        <input type="button" value="<?php echo $button_wishlist; ?>" class="btn_wrap wishbtn" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">

                                    </div>
                                    <div class="add-crt">


                                        <input id="button-cart" type="button" value="<?php echo $button_cart; ?>" class="btn_wrap wishbtn" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
                                    </div>
                                </div>

                            </div>



                        </div>
                    </div>
                </div><!--product new-->

                <?php //if($i%2==0) { ?>

                <?php if($i==2) { ?>
                <div class="row innr-shpng-cart clearfix"></div><br/>
                <?php $i=1; }else{ ?>
                <?php $i++; ?>
                <?php } ?>
                <?php } ?>
            </div><!-- end options -->
            <!--product new-->
            <!--
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


                    <div class=" col-md-6 text-right" style="float: right;"><?php  echo $results; ?></div> -->


            <?php // }} ?>


            <?php if (isset($cateSearchries) && isset($products)&&!$cateSearchries && !$products) { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>

        </div>

    </div>


    <?php if ($products) { ?>

    <div class="reltd-prod">

        <div class="container">
            <h4 class="cap-head"><?= $related?></h4>
            <div id="related-products" class="owl-carousel owl-theme">
                <?php foreach ($products as $product) { ?>

                <div class="row">
                    <div class="item">
                        <figure>
                            <div class="img"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive"> </a></div>

                            <figcaption>
                                <h4 style="width: 93%"><strong><?php echo $product['name']; ?> </strong></h4>


                                <?php if ($product['price']) { ?>

                                <?php if (!$product['special']) { ?>
                                <strong><?= $text_price?> <?php echo $product['price']; ?> </strong>
                                <?php } else { ?>
                                <span class="overline"><?=$Befor?> :<?php echo $product['price']; ?></span>
                                <strong><?= $text_price?><?php echo $product['special']; ?> </strong>
                                <?php } ?>


                                <?php } ?>

                            </figcaption>
                        </figure>
                    </div></div>

                <?php } ?>




            </div>


        </div>

    </div>
        <?php } ?>











    <?php echo $content_bottom; ?>
    <?php echo $column_right; ?>







    <script type="text/javascript"><!--
        $('#button-cart').on('click', function() {

          //  $("#personal-information-success").hide();

            $.ajax({
                url: 'index.php?route=checkout/cart/add',
                type: 'post',
                data: $('#product input[type=\'text\'],  #product select'),
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


        $(document).ajaxStop(function(event){
            event.preventDefault();
            setTimeout('window.location.href=window.location.href;', 350);
        });
    </script>



    <!--

   <div id="dialog" style=" display: none;  min-height:2500px;   left: 0px;    width: 100%;    z-index: 999; position: absolute; top:0px; height: 100%; background: url(images/ui-bg_dots-small_65_a6a6a6_2x2.png) 50% 50% repeat rgba(166, 166, 166, 0.75);">
   <div style="  top: inherit !important;  display: block;     bottom: 0 !important;   z-index: 1002;    position: fixed;    left: 0px;    padding: .2em;    width: 100% !important;  ">
    <a style="  left: 0px; position: absolute; bottom: 0px; width: 100%;       zoom: 1;  border: 1px solid #be1d2d;    background: #fff;     padding: 15px;     overflow: auto;
 z-index: 9999"  align = "center">

         <span class="ui-icon ui-icon-closethick">close</span>

        <div class="proprice"><h4><?php echo $text_price; ?></h4><span>85:000 KWD</span></div>
        <a href="<?php echo $go_cart_link; ?>"  <div class="gotoCart"><button class="gobtnCart"><?php echo $go_cart; ?></button></div> </a>
    </div>
    </div>
    -->


</div>

    <script type="text/javascript">
        $(document).ready(function() {
            $('.option').change(function() {
                var OriginalPrice = $('#thisIsOriginal').text();
                var OriginalCurrency = OriginalPrice.substring(0, 1);
                OriginalPrice = OriginalPrice.substring(1);

                var newPriceValue = $('.option :selected').text();
                var position1 = newPriceValue.indexOf("(");
                var position2 = newPriceValue.indexOf(")");
                position1 = position1+3;
                var finalPriceValue = newPriceValue.substring(position1, position2);
                if(newPriceValue.indexOf('.') == -1)
                {
                    finalPriceValue = "0";
                }
                finalPriceValue = parseFloat(finalPriceValue) + parseFloat(OriginalPrice);
                finalPriceValue = finalPriceValue.toFixed(2);

                $('#priceUpdate').text(OriginalCurrency + finalPriceValue);
            });

            $('#input-option366').change(function () {
                var option_price =  $('option:selected', this).text() ;
                option_price = option_price.replace('(', '');
                option_price = option_price.replace(')', '');
                option_price = option_price.replace('KD', '');
                var option_price_array = option_price.split("+");
                var final_price = 0;
                if(option_price_array.length!=0){
                    final_price = parseFloat(option_price_array[1]) + parseFloat($('#basicprice').val());
                }else{
                    var option_price_array1 = option_price.split("-");
                    final_price = parseFloat(option_price_array[1]) - parseFloat($('#basicprice').val());
                }
                $('#mainprice').val(final_price+' KD');
            });

            $('.select').change(function () {
                var option_price =  $('option:selected', this).text() ;
                option_price = option_price.replace('(', '');
                option_price = option_price.replace(')', '');
                option_price = option_price.replace('KD', '');
                var option_price_array = option_price.split("+");
                var final_price = 0;
                if(option_price_array.length>1){
                    final_price = parseFloat(option_price_array[1]) + parseFloat($('#basicprice').val());
                }else{
                    var option_price_array1 = option_price.split("-");
                    final_price = parseFloat($('#basicprice').val()) - parseFloat(option_price_array1[1]) ;
                }
                $('#price_width_option').val(final_price);
                $('#mainprice').val(final_price+' KD');

                $('#input-quantity').trigger("change");
            });


            $('#input-quantity').change(function () {
                var qty =  $(this).val() ;

                var p = parseFloat($('#price_width_option').val());
                $('#mainprice').val(p*parseInt(qty)+' KD');

            });
        });
    </script>


    <script type="text/javascript">
        function functioncart(){
            $("#dialog").show();
            /*
            $("#dialog").dialog({
                modal: true,
                autoOpen: false,
                title: "jQuery Dialog",
                width: 800,
                height: 110
            });

            $("#btnShow8").click(function () {
                $('#dialog').dialog('open');
            });*/
        }
    </script>

<script type="text/javascript">

    $(document).ready(function(){
        $('.spinner .btn:first-of-type').on('click', function() {
            var spinner=$(this).parent().parent();


            spinner.find('input').val( parseInt(spinner.find('input').val(), 10) );


        });



        $('.spinner .btn:last-of-type').on('click', function() {
            var spinner=$(this).parent().parent();
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


//    $('.q-down').click(function(){
//        if($('#input-quantity').val() == 0){
//            $('#input-quantity').val('1');
//        }
//    });



</script>





    <?php  echo $footer; ?>



