
<?php
header("Content-Type:   application/vnd.ms-excel; charset=utf-8");
header("Content-Disposition: attachment; filename=TotalCustomers.xls");  //File name extension was wrong
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: private",false);




foreach ($oResult as $rsops ) { ?>
id : <?php echo  $rsops['customer_id'] ; ?>
first name :<?php echo  $rsops['firstname'] ; ?>
last : <?php echo  $rsops['lastname'] ; ?>

<?php }?>



