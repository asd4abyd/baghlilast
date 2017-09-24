<?php echo $header;?>

<?php // print_r($categories);die();?>

<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/innr-bnr-20.png" alt=""></div>

<div class="container">


  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    
        <div class="container inner-page"><!-- inner-page -->

     <div class="heading"><span><strong><?php echo $heading_title; ?></strong></span></div>
     
      
          <ul class="sitemap">
           
           
           	<li><a href="<?php echo $home;?>"><?=$Home?></a></li>
     

           
           	<li id="products-color"> <?= $product?> 
           	
           	<ul>
           	
            <?php foreach ($categories as $category_1) { ?>
            <li><a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a>
              <?php if ($category_1['children']) { ?>
              
              <ul>
                <?php foreach ($category_1['children'] as $category_2) { ?>
                <li><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
                  <?php if ($category_2['children']) { ?>
                  
                  <ul>
                    <?php foreach ($category_2['children'] as $category_3) { ?>
                    <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                  
                  <?php } ?>
                </li>
                <?php } ?>
              </ul>
              
              <?php } ?>
            </li>
            <?php } ?>
            </ul>
            </li>
            
            <li><a href="<?php echo $Brands;?>"><?= $brand ?></a></li>
           	<li><a href="<?php echo $wishlist;?>"><?= $WHISHLIST?></a></li>
           	
           	<li><a href="<?php echo $about_us;?>"><?= $ABOUT?></a></li>
           	<li><a href="<?php echo $contact;?>"><?= $CONTACT ?></a></li>
           	<li><a href="<?php echo $faq;?>"><?= $FAQ ?></a></li>
           	<li><a href="<?php echo $privacy;?>"><?= $PRIVACY ?></a></li>
           	<li><a href="<?php echo $tips;?>"><?= $TIPS?></a></li>





          </ul>
      
        
        
        
        
<!--
        <ul class="sitemap">
        	<li><a href="index.html">Home</a></li>
            <li><a href="listing.html">Product</a>
                <ul>
                    <li><a href="listing.html">Baby Products</a></li>
                    <li><a href="listing.html">Beauty & Health Care</a></li>
                </ul>
            </li>
            <li><a href="brands.html">Brands</a></li>
			<li><a href="wishlist.html">WhishList</a></li>
			<li><a href="about-us.html">About Us</a></li>
			<li><a href="contact-us.html">Contact Us</a></li>
			<li><a href="faqs.html">FAQ</a></li>
			<li><a href="privacy-statement.html">Privacy Statement</a></li>
			<li><a href="careers.html">Careers</a></li>
			<li><a href="tips-advice.html">Tips & Advices</a></li>

        </ul>
        
        
-->
        
<!--
        <div class="col-sm-6">
         
          <ul>
            <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
              <ul>
                <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                <li><a href="<?php echo $history; ?>"><?php echo $text_history; ?></a></li>
                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
              </ul>
            </li>
            <li><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a></li>
            <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
            <li><a href="<?php echo $search; ?>"><?php echo $text_search; ?></a></li>
            <li><?php echo $text_information; ?>
              <ul>
                <?php foreach ($informations as $information) { ?>
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } ?>
                <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
              </ul>
            </li>
          </ul>
          
        </div>
        
-->
      </div>
      
        </div><!-- inner-page -->
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
    

<?php echo $footer; ?>


<style type="text/css">
	
	ul {
		list-style: disc;

	}
</style>