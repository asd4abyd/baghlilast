
<?php if (count($languages) > 1) { ?>
<?php if ( $languages[0]['name'] == 'English') { ?>
<div class="pull-right">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
    <?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] !== $code) { ?>
    <button  class="btn btn-link btn-block language-select" id="aslink" type="button" name="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></button>
    <?php } ?>

    <?php } ?>
    <input type="hidden" name="code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </form>
</div>
<?php }else
{ ?>
<div class="pull-left">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
    <?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] !== $code) { ?>
    <button class="btn btn-link btn-block language-select" id="aslink" type="button" name="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></button>
    <?php } ?>

    <?php } ?>
    <input type="hidden" name="code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </form>
</div>
<?php }?>
<?php } ?>
