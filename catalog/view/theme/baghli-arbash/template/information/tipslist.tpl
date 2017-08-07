<?php echo $header; ?>
<?php 
	if($heading_title=='ABOUT US')
		$image = 'innr-bnr-18.png';
	else if($heading_title=='SITEMAP')
		$image = 'innr-bnr-20.png';
	else if($heading_title=='TIPS & ADVICES')
		$image = 'innr-bnr-11.png';
	else if($heading_title=='FAQS')
		$image = 'innr-bnr-09.png';
	else if($heading_title=='PRIVACY STATEMENT')
		$image = 'innr-bnr-10.png';
	else if($heading_title=='TERMS AND CONDITION')
		$image = 'innr-bnr-19.png';
	else
		$image = 'innr-bnr-11.png';
?>
<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/<?php echo $image; ?>" alt=""></div>
<div class="container">
    <div class="container inner-page">
      <div class="heading"><span><strong><?php echo $text_title; ?></strong></span></div>
        <?php //echo $content_top; ?>
<?php if ($extensions) { ?>

<?php foreach ($extensions as $extension) {
?>
        		<div class="innr-tips">
		<strong><?php echo $text_tipslist; ?></strong><br>
		
		<ul>

<?php
foreach($extension['modules'] as $module)
{
  //var_dump($module['setting']);die();
  
$tips_json_array=json_decode($module['setting']);

foreach($tips_json_array->module_description as $key=>$tips_settings)

{
 if($key==$extension['lang_id'])
{
        ?>
        	<li><a href="<?php echo $module['href'];?>"><?php echo $tips_settings->title;?></a></li>
            <?php
}
}
}
?>
		  
        </ul>

        </div>
<?php
  }
                    }
?>
      <?php echo $content_bottom; ?>
	</div>
    <?php echo $column_right; ?>
</div>
<?php echo $footer; ?>