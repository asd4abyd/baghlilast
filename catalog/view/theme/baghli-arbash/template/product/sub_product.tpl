
<?php echo $header; ?>


<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/innr-bnr-01.png" alt=""></div>

<div class="container inner-page">
    <?php
    $heading_title_pieces = explode(" ", $heading_title);
    ?>


    <div class="content"></div>


    <div class="heading"><span><strong><?php echo $heading_title_pieces[0];?></strong>
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

                            <input  type="text" class="form-control" name="search" placeholder="<?= $search ?>">
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



    <div class="row innr-shpng-cart clearfix">

        <?php if ($products) { ?>
        <?php $counter = 0; ?>
        <?php foreach ($products as $product) { ?>

        <?php if(($counter%2)!=0){
        //if($counter == 1 ){ ?>
        <?php echo '<div class="row innr-shpng-cart clearfix">' ; ?>
            <?php } ?>
    <?php $counter++; ?>
        <!--product new-->
        
        
        <?php //  print_r($product); ?>
        <div class="col-md-6 col-sm-6">

            <div class="row">
                <!-- image list div -->
                <div class="col-md-6 list-imageNew new_align">

                    <a href="<?php echo $product['href']; ?>">
                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
                    </a>


                   <div class="offer-label"><?php echo round(100 - ($special_amt*100/$price_amt))."% "; ?>
                     <span>OFF</span>
                   </div>
                </div>
                
       <
                <!-- lsit details div -->
                <div class="col-md-6 proLst-cont updte_design">
                    <!-- title section -->
                    <div class="row">
                        <div class="col-md-12">
                            <h4 class="cart-h4"><a href="<?php echo $product['href']; ?>"><strong><?php echo $product['name']; ?></strong></a></h4>
                            <span><a href="index.php?route=product/manufacturer/info&manufacturer_id=<?php echo $product['manufacturer_id']?>"> <?=$product['manufacturer']; ?></a></span>
                            <div> Model # :<?php echo $product['model'] ?></div>
                            <div>     </div>



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

                            <div class="list-price-div">  <?= $text_price ?> <span><?php echo $product['price']; ?> </span></div>
                            <?php } else { ?>
                            <div class="list-price-div"> <?= $text_price ?> <span><?php echo $product['special']; ?></span> </div> <span class="overline"> <?= $Befor ?>:<?php echo $product['price']; ?></span>
                            <?php } ?>

                        </div> <!--row price -->
                        <?php } ?>

                        <div class="col-md-6"><!--row Quantity -->
                            <div class="qnty">
                                <strong><?= $text_quantity ?></strong>
                                <div class="input-group spinner">

                                    <input  type="text"  id="input-quantity"  value="<?= $product['minimum'] ?>" class="form-control" name="quantity" size="2">
                                    <div class="input-group-btn-vertical">
                                        <button class="btn" type="button"><i class="fa fa-caret-up"></i></button>
                                        <button class="btn q-down" type="button"><i class="fa fa-caret-down"></i></button>
                                        <input type="hidden" name="product_id" value="<?= $product['product_id'] ?>" />
                                    </div>
                                </div>
                            </div>

                        </div><!--row Quantity -->


                    </div><!--row-->


                    <div class="row">

                        <div class="col-md-6">
                            <div class="add_dtt">
                                <span class="gurnty"><br/></span>
                                <span><br/></span>
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
            <?php
            if(($counter%2)==0) {
                echo "</div>" ; ?>
            <?php //$counter=0;
            }  ?>
<?php } ?>
<?php } ?>

    </div>
        <!--product new-->


<div style="clear:both;" ></div>
<div class="row">
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
</div>
</div>


<script>
    $(function(){

        $('.rateyo').rateYo({rating:'<?= (int)$product['rating']?>'});
    });



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

<?php echo $footer; ?>
