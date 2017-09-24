<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
	<?php echo $content_top; ?>


	<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/innr-bnr-07.png" alt=""></div>

    <div class="container inner-page">
    	<div class="heading"><span><strong><?= $heading_title ?></strong></span></div>

       <div class="careers">

            <form role="form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

           <center><h4><strong><?= $resume?></strong></h4></center>

    <div class="form-group col-md-5 col-md-offset-1 col-sm-6">

				<input type="text" value="" class="form-control" id="name" name="name" placeholder="<?= $full?>" required>

				<?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>


				<input type="email" value="" class="form-control" id="email" name="email" placeholder="<?= $email?>" required>

				<?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>

				<input type="text" class="form-control" id="mobile" name="mobile" placeholder="<?= $mob?>" required>

                  <?php if ($error_phone) { ?>
              <div class="text-danger"><?php echo $error_phone;?></div>
              <?php } ?>

                <input type="text" class="form-control" id="PhoneNo" name="mobile" placeholder="<?= $mob?>" required>

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
<?php echo $footer; ?>