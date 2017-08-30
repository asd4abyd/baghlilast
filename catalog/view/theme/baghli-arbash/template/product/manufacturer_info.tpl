<?php echo $header; ?>
<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/innr-bnr-01.png" alt="">
    
    <div class="alert"> </div>

</div>

<div class="container">
    <div class="container inner-page">
        <div class="content">

        </div>
        <div class="heading">
            
            <span><strong><?php echo $heading_title; ?></strong></span>
        </div>


    <?php $cateroies_visit = array(); ?>
    <?php if ($products) { ?>
    <?php $cat_id = 0;  $counter = 0; ?>
    <div class="row brands-page">
        <?php $i=1; foreach ($products as $product_l1) { ?>
        <?php $founded_key =  array_search($product_l1['category_id'], $cateroies_visit); ?>


        <?php if (gettype($founded_key) == 'boolean'){ ?>
        <?php $cat_id = $product_l1['category_id'];   ?>
        <?php $cateroies_visit[$counter] = $cat_id ; $counter++;?>
        <?php $index = 0; ?>

        <div class="col-sm-12 bran_details">
            <?php if(count($product_l1['category_id'])>0){ ?><br/>
            <a href="<?php echo  $product_l1['href_category'] ?>" class="baran_button">SEE ALL</a>
            <?php } ?>

        </div>
        <?php  foreach ($products as $product) {   ?>
        <?php if($cat_id == $product['category_id'] ) { ?>
        <?php if($i%3==1) { ?><div class="row innr-shpng-cart clearfix"><?php } ?>


            <div class="col-sm-4 col-md-4">
                <figure>
                    <a href="<?php echo $product['href']; ?>">
                        <?php if($product['thumb']) { ?>
                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
                        <?php } else { ?>
                        <img src="catalog/view/theme/baghli-arbash/images/brand.png" alt="">
                        <?php } ?>
                    </a>
                    <figcaption>
                        <h4><?php echo $product['name']; ?> </h4>
                        <h3 class="brand_namee2"><a href=" index.php?route=product/manufacturer/info&manufacturer_id=<?php echo $product['manufacturer_id']; ?>"><?php echo $product['brand']; ?></a></h3>
                    </figcaption>
                </figure>
            </div>




            <?php if($i%3==0) { ?></div><?php } $i++; ?>
        <?php $index++; ?>
        <?php if( $index== 3) break;?>
        <?php } }  }?>
        <?php } ?>
    </div>
    <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
    </div>
    <?php } else { ?>
    <p><?php echo $text_empty; ?></p>
    <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
    </div>
    <?php } ?>

</div>
</div>
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



    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
        alert(1);

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



</script>


<script>

    //RATING STAR START HERE

    $(function () {

        var rating = 1.6;

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

            rating: rating,
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

            if($('[class= _color]').val() == undefined){
                elemnt.next().append("<input type='hidden' class='_color' value='"+color_id+"'>");
            }else{
                $('[class=_color]').val(color_id);
            }
        })
    };

</script>
</div>

<?php echo $footer; ?>