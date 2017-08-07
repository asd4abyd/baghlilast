
<br>
<div id="carousel_text" class="owl-carousel">
  <?php foreach ($yktcarousel as $key => $row) { ?>
  <div class="item text-center">
    <?php echo $row;?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#carousel_text').owlCarousel({
  items: <?php echo $count_item;?>,
  autoPlay: <?php echo empty($autoplay) ? '9000' : $autoplay;?>,
  singleItem: <?php echo $single == '1' ? 'true' : 'false';?>,
  navigation: <?php echo $navigation;?>,
  responsive: <?php echo $responsive;?>,
  responsiveRefreshRate : 200,
  responsiveBaseWidth: window,
  navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
  pagination: <?php echo $pagin;?>
});
--></script>