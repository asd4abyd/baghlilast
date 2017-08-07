<?php echo $header; ?>
<div class="container">
  
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	<div class="container inner-container">
    	<div class="row">

			 <div class="col-md-9 inner-right-side">
			<h6><?php echo $heading_title; ?></h6>
			</div>
		</div>
		
		<div class="row checkout-page bs-wizard">

			<div class="col-xs-4 bs-wizard-step complete">

			  <div class="progress"><div class="progress-bar"></div></div>
			  <a href="#" class="bs-wizard-dot bsdot-active-a">1</a>
			  <div class="bs-wizard-info text-center">Delivery Details</div>
			</div>

			<div class="col-xs-4 bs-wizard-step complete"><!-- complete -->
			  <div class="progress"><div class="progress-bar"></div></div>
			  <a href="#" class="bs-wizard-dot bsdot-active-a">2</a>
			  <div class="bs-wizard-info text-center">Payment Methods</div>
			</div>

			<div class="col-xs-4 bs-wizard-step "><!-- complete -->
			  <div class="progress"><div class="progress-bar"></div></div>
			  <a href="#" class="bs-wizard-dot">3</a>
			  <div class="bs-wizard-info text-center">Confirm your order</div>
			</div>

		</div>
		
		<div class="row checkout-page-cont">
		  <div class="col-md-12">
			<h6 class="log-head">Select a payment method</h6>

		  </div>
		  <div class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2">
		  <?php if ($payment_methods) { ?>
			<ul class="sel-adderess chout2">
				<?php foreach ($payment_methods as $payment_method) { ?>
					<li><input type="button" class="payment-btn" value="<?php echo $payment_method['title']; ?>" data-id="<?php echo $payment_method['code']; ?>"></li>
				<?php } ?>
			  <!--<li><input type="button" value="paypal"></li>
			  <li><input type="button" value="Credit card"></li>
			  <li><input type="button" value="Net Banking"></li>
			  <li><input type="button" value="Cash on Delivery"></li>-->
			</ul>
		  <?php } ?>
		  </div>
		</div>
		
		
	</div>
      
      
      <?php echo $content_bottom; ?></div>
    </div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--

<?php if (!$logged) { ?>
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/login',
        dataType: 'html',
        success: function(html) {
           $('#collapse-checkout-option .panel-body').html(html);

			$('#collapse-checkout-option').parent().find('.panel-heading .panel-title').html('<a href="#collapse-checkout-option" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_option; ?> <i class="fa fa-caret-down"></i></a>');

			$('a[href=\'#collapse-checkout-option\']').trigger('click');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
<?php } else { ?>
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_address',
        dataType: 'html',
        success: function(html) {
            $('#collapse-payment-address .panel-body').html(html);

			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');

			$('a[href=\'#collapse-payment-address\']').trigger('click');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
<?php } ?>

// Checkout
$(document).delegate('#button-account', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/' + $('input[name=\'account\']:checked').val(),
        dataType: 'html',
        beforeSend: function() {
        	$('#button-account').button('loading');
		},
        complete: function() {
			$('#button-account').button('reset');
        },
        success: function(html) {
            $('.alert, .text-danger').remove();

            $('#collapse-payment-address .panel-body').html(html);

			if ($('input[name=\'account\']:checked').val() == 'register') {
				$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_account; ?> <i class="fa fa-caret-down"></i></a>');
			} else {
				$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
			}

			$('a[href=\'#collapse-payment-address\']').trigger('click');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

// Login
$(document).delegate('#button-login', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/login/save',
        type: 'post',
        data: $('#collapse-checkout-option :input'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-login').button('loading');
		},
        complete: function() {
            $('#button-login').button('reset');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#collapse-checkout-option .panel-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				// Highlight any found errors
				$('input[name=\'email\']').parent().addClass('has-error');
				$('input[name=\'password\']').parent().addClass('has-error');
		   }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

//payment process customise start........
$(document).delegate('.payment-btn', 'click', function() { 
	var payment_method = $(this).attr("data-id");
    $.ajax({
        url: 'index.php?route=checkout/payment_method/save',
        type: 'post',
        data: {'payment_method':payment_method,'agree':1,'comment':''},
        dataType: 'json',
		async: false,
        beforeSend: function() {
         	$('#button-payment-method').button('loading');
		},
        success: function(json) {
            $('.alert, .text-danger').remove();

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#button-payment-method').button('reset');
                
                if (json['error']['warning']) {
                    $('#collapse-payment-method .panel-body').prepend('<div class="alert alert-danger">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
            } else {
                location.href='<?php echo $proceed; ?>';
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
//payment process customise end........
//--></script>
<?php echo $footer; ?>
