<?php if(sizeof($addresses) > 0) {
foreach($addresses as $address) {
?>
<div class="col-md-4">
	<ul class="sel-adderess">
		<li class="sel-name"><?php echo $address['firstname'].' '.$address['lastname']; ?></li>
		<li><?php echo $address['address_1']; ?></li>
		<li><?php echo $address['address_2']; ?></li>
		<li><?php echo $address['city']; ?></li>
		<li><?php echo $address['zone']; ?></li>
		<li><?php echo $address['country']; ?></li>
		<li><?php echo $address['postcode']; ?></li>
		<li><input type="button" value="Deliver to this address" onClick="location.href='<?php echo $proceed; ?>'"></li>
		<li class="towbtns"><input type="button" value="Edit" onClick="location.href='<?php echo $update.'='.$address['address_id']; ?>'"><input type="button" value="Delete" onClick="location.href='<?php echo $delete.'='.$address['address_id']; ?>'"></li>

	</ul>
</div>
<?php } } ?>