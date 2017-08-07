<form action="<?php echo $action; ?>" method="post">

  <input type="hidden" id="access_key" name="access_key" value="<?php echo $nbk_access_key; ?>">
  <input type="hidden" id="profile_id" name="profile_id" value="<?php echo $nbk_profile_id; ?>">
  <input type="hidden" id="transaction_uuid" name="transaction_uuid" value="<?php echo $transaction_uuid; ?>">
  <input type="hidden" id="signed_field_names" name="signed_field_names" value="access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency,bill_to_address_line1,bill_to_address_city,bill_to_address_country,bill_to_email,bill_to_surname,bill_to_forename">
  <input type="hidden" id="unsigned_field_names" name="unsigned_field_names">
  <input type="hidden" id="signed_date_time" name="signed_date_time" value="<?php echo gmdate("Y-m-d\TH:i:s\Z"); ?>">
  <input type="hidden" id="locale" name="locale" value="en-us">
  <input type="hidden" id="transaction_type" name="transaction_type" value="authorization">
  <input type="hidden" id="reference_number" name="reference_number" value="<?php echo $order_id; ?>">
  <input type="hidden" id="amount" name="amount" value="<?php echo number_format($amount, 2); ?>">
  <input type="hidden" id="currency" name="currency" value="KWD">
  <input type="hidden" id="signature" name="signature" value="<?php echo $signedParams; ?>">


  <input type="hidden" name="success_url" value="<?php echo $success_url; ?>" />

  <input type="hidden" name="cancel_url" value="<?php echo $cancel_url; ?>" />

  <input type="hidden" name="description" value="<?php echo $description; ?>" />

  <input type="hidden" name="order_id" value="<?php echo $order_id; ?>" />

  <input type="hidden" name="bill_to_forename" value="<?php echo $bill_to_forename; ?>" />
  <input type="hidden" name="bill_to_surname" value="<?php echo $bill_to_surname; ?>" />
  <input type="hidden" name="bill_to_address_city" value="<?php echo $bill_to_address_city; ?>" />
  <input type="hidden" name="bill_to_address_line1" value="<?php echo $bill_to_address_line1; ?>" />
  <input type="hidden" name="bill_to_address_postal_code" value="<?php echo $bill_to_address_postal_code; ?>" />
  <input type="hidden" name="bill_to_address_country" value="<?php echo $bill_to_address_country; ?>" />

  <input type="hidden" name="ship_to_address_city" value="<?php echo $ship_to_address_city; ?>" />
  <input type="hidden" name="ship_to_address_line1" value="<?php echo $ship_to_address_line1; ?>" />
  <input type="hidden" name="ship_to_address_postal_code" value="<?php echo $ship_to_address_postal_code; ?>" />
  <input type="hidden" name="ship_to_forename" value="<?php echo $ship_to_forename; ?>" />
  <input type="hidden" name="ship_to_surname" value="<?php echo $ship_to_surname; ?>" />
  <input type="hidden" name="ship_to_address_country" value="<?php echo $ship_to_address_country; ?>" />

  <input type="hidden" name="bill_to_phone" value="<?php echo $bill_to_phone; ?>" />

  <input type="hidden" name="bill_to_email" value="<?php echo $bill_to_email; ?>" />

  <!--<div class="buttons">

    <div class="pull-right">-->

      <input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" />

  <!--  </div>

  </div>-->

</form>