<!DOCTYPE !html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
    
    <!-- favicon -->
    <link rel="shortcut icon" href="favicon.ico?"/>





    <!-- Bootstrap -->
    <link href="catalog/view/theme/baghli-arbash/css/bootstrap.css" rel="stylesheet">

    <!-- fonts Style -->
    <link href="catalog/view/theme/baghli-arbash/fonts/stylesheet.css" rel="stylesheet">

    <!-- fonts awesome -->
    <link href="catalog/view/theme/baghli-arbash/css/font-awesome.css" rel="stylesheet">

    <!-- fonts awesome -->
    <link href="catalog/view/theme/baghli-arbash/css/owl.carousel.css" rel="stylesheet">
    <link href="catalog/view/theme/baghli-arbash/css/owl.transitions.css" rel="stylesheet">
    <link href="catalog/view/theme/baghli-arbash/css/owl.theme.css" rel="stylesheet">


    <!-- Style -->
    <link href="catalog/view/theme/baghli-arbash/css/style.css" rel="stylesheet">

    <link href="catalog/view/theme/baghli-arbash/css/easyzoom.css" rel="stylesheet">
    <link href="catalog/view/theme/baghli-arbash/css/pygments.css" rel="stylesheet">
    <link href="catalog/view/theme/baghli-arbash/css/popup.css" rel="stylesheet">
    <link href="catalog/view/theme/baghli-arbash/css/jquerysctipttop.css" rel="stylesheet">




    <!-- Custome Style -->
    <link href="catalog/view/theme/baghli-arbash/css/custom-style.css" rel="stylesheet">

   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="catalog/view/theme/baghli-arbash/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="catalog/view/theme/baghli-arbash/js/jquery.rateyo.js"></script>

    <script type="text/javascript" src="catalog/view/theme/baghli-arbash/js/jquery.vticker.min.js"></script>

    <script src="catalog/view/theme/baghli-arbash/js/owl.carousel.js"></script>
    
  <script type="text/javascript" src="catalog/view/theme/baghli-arbash/js/jquery.rateyo.js"></script>
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <script src="catalog/view/theme/baghli-arbash/js/jquery-custom.js" type="text/javascript"></script>
    <script src="catalog/view/theme/baghli-arbash/js/general.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
 <script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>

    <script src="catalog/view/theme/baghli-arbash/js/npm.js" type="text/javascript"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<!-- for zoom images in products -->

    <script src="catalog/view/theme/baghli-arbash/js/jquery.elevatezoom.js" type="text/javascript"></script>

    <script src="catalog/view/theme/baghli-arbash/js/jquery.elevateZoom-3.0.8.min.js" type="text/javascript"></script>
    <!-- for zoom images in products -->

    <?php // print_r($direction); ?>

<?php if ($direction == 'rtl') { ?>



  <link rel="shortcut icon" href="favicon.ico?"/>

    <!-- Bootstrap -->
    <link href="catalog/view/theme/baghli-arbash/css/rtl/css/bootstrap.css" rel="stylesheet">

    <!-- fonts Style -->
    <link href="catalog/view/theme/baghli-arbash/css/rtl/fonts/stylesheet.css" rel="stylesheet">

    <!-- fonts awesome -->
    <link href="catalog/view/theme/baghli-arbash/css/rtl/css/font-awesome.css" rel="stylesheet">

    <!-- fonts awesome -->
    <link href="catalog/view/theme/baghli-arbash/css/rtl/css/owl.carousel.css" rel="stylesheet">
    <link href="catalog/view/theme/baghli-arbash/css/rtl/css/owl.transitions.css" rel="stylesheet">
    <link href="catalog/view/theme/baghli-arbash/css/rtl/css/owl.theme.css" rel="stylesheet">

    <!-- Style -->
    <link href="catalog/view/theme/baghli-arbash/css/rtl/css/style.css" rel="stylesheet">

    <!-- Custome Style -->
    <link href="catalog/view/theme/baghli-arbash/css/rtl/css/custom-style.css" rel="stylesheet">


    <!-- for zoom images in products -->

    <script src="catalog/view/theme/baghli-arbash/js/jquery.elevatezoom.js" type="text/javascript"></script>

    <script src="catalog/view/theme/baghli-arbash/js/jquery.elevateZoom-3.0.8.min.js" type="text/javascript"></script>
    <!-- for zoom images in products -->



    <?php }  ?>


    
 <!--   
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>-->
<?php foreach ($analytics as $analytic) { ?>

<?php echo $analytic; ?>
<?php } ?>
</head>
<body >


<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-103744173-1', 'auto');
    ga('send', 'pageview');

</script>

      <header>
      <div class="container">
            <div class="col-md-3 col-sm-12 col-xs-12">
                <div class="logo"> <a href="<?php echo $home; ?>"><img src="catalog/view/theme/baghli-arbash/images/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"></a>
                </div>
             </div>
            <div class="col-md-9 col-sm-12 col-xs-12 ">
              <div class="row">
                   
                    
                    <?php echo $search; ?>

                  <div class="col-md-5 col-sm-12 col-xs-12">
                   <ul class=" log-area col-sm-12 col-xs-12">
                       <?php if ($logged) { ?>
                      <li class="col-sm-3 col-xs-3"><a type="button" data-toggle="modal" href="<?php echo $logout; ?>"><i><img src="catalog/view/theme/baghli-arbash/images/login-ico.png" title="<?php echo $text_logout; ?>" alt="<?php echo $text_logout; ?>"></i><br> <?php echo $text_logout; ?></a>
                      </li>
                      
                       <li class="col-sm-3 col-xs-3"><a href="<?php echo $account; ?>"><i><img src="catalog/view/theme/baghli-arbash/images/reg-ico.png" title="<?php echo $text_account; ?>" alt="<?php echo $text_account; ?>"></i><br> <?php echo $text_account; ?></a>
                       </li>

                       <?php echo $cart;?>

                 <!--      <li class="col-sm-3 col-xs-3"><a href="<?php echo $shopping_cart;?>"><i><img src="catalog/view/theme/baghli-arbash/images/cart-ico.png" alt=""></i><br>  <?= $cart1?></a></li> -->

                       <?php }
                   else
                    {
                          ?>
                       <li class="col-sm-3 col-xs-3"><a type="button" data-toggle="modal" data-target="#myModal"><i><img src="catalog/view/theme/baghli-arbash/images/login-ico.png" title="<?php echo $text_login; ?>" alt="<?php echo $text_login; ?>"></i><br> <?php echo $text_login; ?></a></li>
                        <li class="col-sm-3 col-xs-3"><a href="<?php echo $register; ?>"><i><img src="catalog/view/theme/baghli-arbash/images/reg-ico.png" title="<?php echo $text_register; ?>" alt="<?php echo $text_register; ?>"></i><br> <?php echo $text_register; ?></a></li>

                        <?php echo $cart;?>
                      <!-- <li class="col-sm-3 col-xs-3"><a href="<?php echo $shopping_cart;?>"><i><img src="catalog/view/theme/baghli-arbash/images/cart-ico.png" alt=""></i><br> <?= $cart1 ;?></a></li> -->

                       <?php
                          }

                          ?>
               <li id="arabic-style" class="col-sm-3 col-xs-3"><a  href="" ><i><img src="catalog/view/theme/baghli-arbash/images/globe-ico.png" title="<?php echo $text_account; ?>" alt="<?php echo $text_account; ?>"></i><br><?php echo $language; ?></a></li>


                   </ul>
          </div>
        

                   <!-- Modal -->
                    <div class="modal sign-in fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h6><?php echo $sign_in; ?></h6>
                          </div>
                            <div id="login-error-msg" style="display:none;"></div>
                          <div class="modal-body">
                            <form action="<?php echo $action_login; ?>" method="post" enctype="multipart/form-data" name="popup_login_form" id="popup_login_form">
                        <label> <?php echo $email; ?></label>
                        <input type="text" name="email" value="" placeholder="<?php echo $email; ?>" id="input_email_login" class="form-control"/>
                        <label><?php echo $password; ?></label>
                        <input type="password" name="password" value="" placeholder="<?php echo $password; ?>" id="input_password_login" class="form-control"/>

                        <label><input type="checkbox" name="terms"> <?php echo $stay_sign_in; ?> <a href="<?php echo $forgotten;?>"><?php echo $forget_password_email;?></a></label
                        ></form>
                          </div>
                          <div class="modal-footer">
                            <button id="popup_login" type="submit" class="btn btn-primary algn-leftt"><?php echo $sign_in; ?></button>
                            <h4 class="sub_net"><?php echo $Dont_have_account; ?> <a href="<?php echo $action_sginUp ?>"><?php echo $sign_up; ?></a> </h4>
                          </div>
                        </div>
                      </div>
                    </div>

            </div>
            </div>
        </div>
    </header>

    <script>

  $(document).ready(function(e) {
    $('.cart').click(function(e) {
      e.preventDefault();
      $('.cart-popup').toggle();
      e.stopPropagation();

    });

    $(document).click(function(e){
      //e.preventDefault();
      $('.cart-popup').hide();
      e.stopPropagation();
    });
  });

</script>


<?php print_r($categories);?>

    <nav class="navbar navbar-default" role="navigation"> 
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>

      
      
          <!-- new code from index calling nested menu -->

      
      
    
        <!-- new code from index calling nested menu -->

      
      
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav" style="width: 100% ;">
          
       
          <li class="dropdown">

<a  href="<?php echo $categories[0]['href'];?>" class="dpDown-main-a dropdown-toggle disabled" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="product"></span> <?= $text_product?><!--<b class="caret"></b>--></a>

  <ul class="dropdown-menu multi-level">
      
      
     <?php $index = 0; ?>
     
     
               <?php foreach ($categories as $category) { ?>
      
                     <?php   print_r ($category)  ?>

      

        

     <?php

            $class = '';
            switch ($index) {
                 case 0:
                    $class="product" ;
                    break;

                case 1:
                     $class="brands" ;
                    break;
                case 2:
                     $class="cleaning" ;
                    break;
                case 3:
                     $class="k-wear" ;
                    break;

                case 4:
                     $class="bath" ;
                    break;
                case 5:
                     $class="laundry" ;
                    break;
                case 6:
                     $class="waste" ;
                    break;

                case 7:
                     $class="storage" ;
                    break;
                case 8:
                     $class="wish-list" ;
                    break;
                default:
                    $class="product" ;
            }

$index++;
     ?>
              <li class="dropdown-submenu" >
                  <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" ><span class="<?php echo $class ?>"></span><?php echo $category['name']; ?></a>
                  
               

                  <?php  if($category['children']) { ?>
                  
        <ul class="dropdown-menu wMore">  
            <?php foreach($category['children'] as $children){ ?>
            
            <?php // print_r($children); ?>
            
           <li>
               <a href="<?php echo $children['href']; ?>">
              <img width="38" height="38" src="<?php echo $children['image']; ?>"> &nbsp <?php echo $children['name']; ?>
               
               </a>
               <?php //print_r($children); ?>
               <ul>
                    <li>
                  <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" ><?php echo $category['name']; ?></a>
                     </li>
               </ul>
             <?php } ?>
                       
             <?php  }  ?>
                             
            </li>
        </ul>
     
     
     
     </li>


              <?php
                }
                ?>

 </ul>
          </li>




          <!-- drop down menu for brands  -->

          <?php // print_r ($results1); ?>

          <li class="dropdown">

              <a  href="<?php echo $brand_link; ?>" class="dpDown-main-a dropdown-toggle disabled" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="brands"></span> <?= $brands ?> </a>

              <ul class="dropdown-menu">

                  <?php $index = 0; ?>
                  <?php  foreach ($results1 as $results1) { ?>

                  <?php // print_r ($results1); ?>

                  <?php

            $class = '';
            switch ($index) {
                 case 0:
                    $class="apple" ;
                    break;

                case 1:
                     $class="brands" ;
                    break;
                case 2:
                     $class="cleaning" ;
                    break;
                case 3:
                     $class="k-wear" ;
                    break;

                case 4:
                     $class="bath" ;
                    break;
                case 5:
                     $class="laundry" ;
                    break;
                case 6:
                     $class="waste" ;
                    break;

                case 7:
                     $class="storage" ;
                    break;
                case 8:
                     $class="wish-list" ;
                    break;
            //    default:
             //       $class="product" ;
            }

$index++;
     ?>
                  <?php  }?>
                  <?php // print_r($manu); ?>
                  <?php //print_r($data_info);?>
                  
              
                  
<?php foreach($manu as $link){ ?>
 <?php // print_r($link['catem_info']);?>
                  

                  <li >
                      <a href="<?php echo $link['href']; ?>">
                          <img src="<?php echo $link['image'];?>"> &nbsp <?php echo $link['name'];?>
                      </a>
                      
                      
                   <!--   
                      <ul class="dropdown-menu">
                          <?php foreach($link['catem_info'] as $brand){ ?>
                          
                          <?php // print_r($brand);die(); ?>
                          
                            <?php foreach($brand as $brand_info){ ?>
                          
                           <?php  // print_r($brand_info);die(); ?>

                         <li> 
                              <a href='<?php echo "http://localhost/baghli/index.php?route=product/category&path=".$brand_info["category_id"] ?>'> <img width="38" height="38" src="<?php echo 'http://localhost/baghli/image/'.$brand_info['image'];?>"> &nbsp<?php echo $brand_info['name'] ?></a>
                          </li>
                          
                            <?php } ?>
                          
                          
                         <?php  } ?>
                      </ul>
                      -->
                      
                 </li>
                  <?php  } ?>
              </ul>

    


            
          </li>


   <!--    <li>
         <a href="<?php echo $brand_link; ?>" ><span class="brands"></span> <?= $brands ?> </a>
       </li> -->


        <li>
          <a href="<?php echo $wishlist; ?>"><span class="wish-list"></span> <?= $text_wishlist ?> </a>
        </li>
        <li>
          <a href="<?php echo $aboutus_link; ?>"><span class="about-us"></span> <?= $about ; ?> </a>
        </li>
        <li>
          <a href="<?php echo $contactus_link; ?>"><span class="contact-us"></span> <?= $Contact ?> </a>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>




