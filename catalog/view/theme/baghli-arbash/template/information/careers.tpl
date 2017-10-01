<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
	<?php echo $content_top; ?>


	<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/innr-bnr-07.png" alt=""></div>

    <div class="container inner-page">
    	<div class="heading"><span><strong><?= $heading_title ?></strong></span></div>

       <div class="careers">




           <!-- form for careers -->

            <form role="form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

           <center><h4><strong><?= $resume?></strong></h4></center>

    <div class="form-group col-md-5 col-md-offset-1 col-sm-6">

				<input type="text" class="form-control" onkeyup="javascript:nonum(this)" onkeypress="javascript:RemoveSpecialChar(this)" id="name" name="name" placeholder="<?= $full?>" required>

				<?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>


				<input type="email" onkeyup="javascript:emailVal(this)" onkeypress="javascript:emailVal(this)" class="form-control" id="email" name="email" placeholder="<?= $email?>" required>

				<?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>

				<input type="text" class="form-control" onkeypress="noAlpha(this)" onpaste="return false;" onkeyup="noAlpha(this)" id="mobile" name="mobile" placeholder="<?= $mob?>" required>

                  <?php if ($error_phone) { ?>
              <div class="text-danger"><?php echo $error_phone;?></div>
              <?php } ?>

                <input type="text" onkeypress="noAlpha(this)" onpaste="return false;" onkeyup="noAlpha(this)" class="form-control" id="PhoneNo" name="mobile" placeholder="<?= $mob?>" required>

     </div>

          <div class="form-group col-md-5 col-sm-6 right-flds">

         <!--    <input type="file" class="form-control" id="subject" name="subject" placeholder="Subject" required> -->

            <label><?= $Comment?></label>

            <textarea class="carer-comments" name="enquiry"></textarea>

             <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>

          </div>

          <div class="form-group col-md-12">
            <center><button type="submit" id="submit" name="submit" class="btn btn-primary"><?= $sub ?></button></center>
          </div>
        </form>





        </div>

    </div>
</div>

<script language="javascript" type="text/javascript">
    function nonum(obj) {
        reg = /[^a-zA-Z ]/;
        obj.value = obj.value.replace(reg, "");
        obj.value = obj.value.toUpperCase();

    }
</script>

<script language="javascript" type="text/javascript">
    function RemoveSpecialChar(obj) {

        if (obj.value != '' && obj.value.match(/^[\w ]+$/) == null) {
            obj.value = obj.value.replace(/[\W]/g, '');
        }
    }
</script>

<script language="javascript" type="text/javascript">
    function emailVal(obj) {
        reg =^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$;
        obj.value = obj.value.replace(reg, "");


    }
</script>

<script language="javascript" type="text/javascript">
    function noAlpha(obj) {
        reg = /[^0-9]/g;
        obj.value = obj.value.replace(reg, "");
    }
</script>


<?php echo $footer; ?>