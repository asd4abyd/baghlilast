<?php echo $header; ?>
<div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/innr-bnr-21.png" alt=""></div>
<div class="container">
  	
	<div class="container inner-page">

	<?php if ($error_warning) { ?><div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div><?php } ?>

    	<div class="heading"><span><strong><?php echo $heading_title; ?></strong></span></div>

       <div class="register">

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="fileForm" role="form">
            
              <!-- new order -->


              <div class="row"> <!-- first row -->
               
                <div class="col-sm-6">
                  <div class="row">
                    <div class="form-group col-sm-12">
                    <label for="firstname"><?php echo $entry_firstname; ?><span class="req">* </span></label>
						<input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
						<?php if ($error_firstname) { ?><div class="text-danger"><?php echo $error_firstname; ?></div><?php } ?>
                    </div>
                  </div>
                </div>
                
                <div class="col-sm-6">
                  <div class="row">
                    <div class="form-group col-sm-12">
                      <label for="lastname"><?php echo $entry_lastname; ?> <span class="req">* </span></label>
						  <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
						  <?php if ($error_lastname) { ?><div class="text-danger"><?php echo $error_lastname; ?></div><?php } ?>
                      </div>
                  </div>
                </div>

              </div><!-- first row -->


                <div class="row"> <!-- second row-->

                <div class="col-sm-6">
                  <div class="row">
                    <div class="form-group col-sm-12">
                      <label for="fullname"><?php echo $entry_fullname; ?> </label>
						  <input type="text" name="fullname" value="<?php echo $fullname ; ?>" placeholder="<?php echo $entry_fullname; ?>" id="input-fullname" class="form-control" />
						  <?php if ($error_fullname) { ?><div class="text-danger"><?php echo $error_fullname; ?></div><?php } ?>
                      </div>
                  </div>
                </div>



                    <div class="col-sm-6">
                        <div class="row">
                    <div class="form-group col-sm-12">
                        <label for="input-mobile"><?php echo $entry_mobile; ?> <span class="req">*
                                    <?php echo $text_mobile_hint; ?> </span></label>
                        <input type="tel" name="mobile" value="<?php echo $mobile; ?>" placeholder="<?php echo $entry_mobile; ?>" id="input-mobile" class="form-control" />
                        <?php if ($error_mobile) { ?><div class="text-danger"><?php echo $error_mobile; ?></div><?php } ?>
                        </div>
                    </div>

                    </div>
                </div> <!-- second row-->




                <div class="row"> <!-- third row-->



                    <div class="col-sm-6">
                      <div class="row">

                    <div class="form-group col-sm-12">
                    <label for="input-email"><?php echo $entry_email; ?> <span class="req">* </span> </label>
					   <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
					   <?php if ($error_email) { ?><div class="text-danger"><?php echo $error_email; ?></div><?php } ?>
                    </div>
                      </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="row">

                    <div class="form-group col-sm-12">
                    <label for="input-email"><?php echo $entry_recovery_email; ?></label>
                       <input type="email" name="recovery_email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_recovery_email; ?>" id="input-email" class="form-control" />
					   <?php if ($error_recovery_email) { ?><div class="text-danger"><?php echo $error_recovery_email; ?></div><?php } ?>
                    </div>

                        </div>
                    </div>

                </div> <!-- third row-->





                <div class="row"> <!-- 4th row-->

                <div class="col-sm-6">
                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label for="input-password"><?php echo $entry_password; ?> <span class="req">*
                                    <?php echo $text_password_hint; ?></span></label>
                            <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                            <?php if ($error_password) { ?><div class="text-danger"><?php echo $error_password; ?></div><?php } ?>
                        </div>

                    </div>
                </div>


                    <div class="col-sm-6">
                        <div class="row">

                        <div class="form-group col-sm-12">
                            <label for="input-confirm"><?php echo $entry_confirm; ?> <span class="req">* </span></label>
                            <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
                            <?php if ($error_confirm) { ?><div class="text-danger"><?php echo $error_confirm; ?></div><?php } ?>
                        </div>
                        </div>
                    </div>

                    </div> <!-- 4th row-->


                    <div class="row"> <!-- 5th row-->
                        <div class="col-sm-6">
                            <div class="row">


                            <div class="form-group col-sm-12">
                    <label for="input-telephone"><?php echo $entry_telephone; ?></label>
						<input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
						<?php if ($error_telephone) { ?><div class="text-danger"><?php echo $error_telephone; ?></div><?php } ?>
                    </div>

                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="row">


                            <div class="form-group col-sm-12 col-agreeReg">
                        <input type="checkbox" id="agree" name="agree" value="1"> <label for="terms"><?php echo $text_agree; ?></label><br>
                        <input type="checkbox" checked id="newsletter" name="newsletter" value="1"> <label for="terms"><?php echo $entry_newsletter; ?></label>
                    </div>

                    </div>


                  </div>

              </div><!-- 5th row-->


                <script src='https://www.google.com/recaptcha/api.js'></script>


                <div class="g-recaptcha" data-sitekey="6Le1RScUAAAAADZsYDODqJrvYjaDymzSKjVmKhJa"></div>

                <div class="form-group">
                    <center><input class="btn btn-lg btn-primary" type="submit" name="submit_reg" value="<?php echo $value ?>"></center>
                </div>
            </fieldset>
            </form><!-- ends register form -->

        </div>
    </div>

</div>


<script type="text/javascript"><!--
// Sort the custom fields
$('#account .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
		$('#account .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#account .form-group').length) {
		$('#account .form-group:first').before(this);
	}
});

$('#address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
		$('#address .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#address .form-group').length) {
		$('#address .form-group:first').before(this);
	}
});

$('input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('.custom-field').hide();
			$('.custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('#custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('#custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}


		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php echo $footer; ?>
