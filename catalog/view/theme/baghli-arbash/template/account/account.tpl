<?php echo $header; ?>

<script  type="text/javascript">
    

    function editInformation()
    {
        $("#image-loading").show();
        $("#personal-information-success").hide();

        var data = $('#information-data').serialize();
        //alert(data);

        $.ajax({
            url: 'index.php?route=account/edit',
            type: 'post',

            data: $('#information-data').serialize(),

            //success: success,
            success: function(data) {
                //alert('Success');
                $("#image-loading").hide();
                $("#information-data").before("<div class='alert alert-success' id='personal-information-success'><a href='#' class='close' data-dismiss='alert'>&times;</a>Your personal information has been successfully updated .</div>");

            }
    }) ;

}
    
    /*
     function editAddres()
    {
        var address_id = $('#address_id').val();
                //alert('address id : '+ address_id);return false;
        $("#image-loading").show();
        $("#personal-information-success").hide();

        var data = $('#delivery_address').serialize();
       alert(data);

        $.ajax({
            url: 'index.php?route=account/address/edit&address_id='+address_id,
            type: 'post',

            data: $('#delivery_address').serialize(),

            //success: success,
            success: function(data) {
                //alert('Success');
                $("#image-loading").hide();
                $("#delivery_address").before("<div class='alert alert-success' id='personal-information-success'><a href='#' class='close' data-dismiss='alert'>&times;</a>Your address has been successfully updated .</div>");

            }
    });

}*/
  //  function callAccount(){
        
        
// window.location.href ="http://localhost/baghli/index.php?route=account/account";


  //  }
       function changepassword()
    {

        $.ajax({
            url: 'index.php?route=account/password',

            type: 'post',

            data: $('#change_password').serialize(),


            success: function(data) {

                //  callAccount();change_password
                // alert($data);
                $("#image-loading").hide();
                $("#change_password").before("<div class='alert alert-success' id='personal-information-success'><a href='#' class='close' data-dismiss='alert'>&times;</a>Your password has been successfully updated .</div>");

            }
        });


        var pass1 = document.getElementById("pass1").value;
        var pass2 = document.getElementById("pass2").value;
        var ok = true;
        if (pass1 != pass2) {
            //alert("Passwords Do not match");
            document.getElementById("pass1").style.borderColor = "#e30000";
            document.getElementById("pass2").style.borderColor = "#e30900";
            alert("Passwords don't Match!!!");
            ok = false;

        }

        return ok;
        


        
        $("#image-loading").show();
        $("#personal-information-success").hide();

        var data = $('#change_password').serialize();
        //alert(data);




}


</script>
   

    <div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/innr-bnr-13.png" alt=""></div>
    
    
<div class="container">
 


  <?php if ($success) { ?>
  <!--<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div> -->
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


         <div class="container inner-page">
            
             <div class="heading"><span><strong><?= $usrt ?> </strong> <?= $PROFILE ?></span></div>

             <div class="row profile">
             <div class="col-md-12">
                 <div class="profile-sidebar">
                     <!-- SIDEBAR USERPIC -->

				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-job">
                        <label class="col-md-12 control-label" ><?= $Hello ?></label>
					</div>
					<div class="profile-usertitle-name">	    
		
                         <label class="col-md-12 control-label" ><?php echo $fullname; ?> </label>
                    </div>
					
				</div>

			</div>
		</div>
		<div class="col-md-12">
            <div id="personal_info">

            <div class="profile-content clearfix">
            
             <form action="" onsubmit="event.preventDefault();" method="post" enctype="multipart/form-data" class="form-horizontal" id="information-data">

			   <h4>

                   <strong><?= $Personal_Information ?></strong>

             <button onClick="javascript:editInformation();" class="btn btn-primary pull-right"><?= $Edit?></button>
             
              </h4>
              
               <div class="tbl-scrl">
                   <div id='image-loading' style="display: none;position: relative;left:50%">
                       <img width="50" height="50" src="https://68.media.tumblr.com/695ce9a82c8974ccbbfc7cad40020c62/tumblr_o9c9rnRZNY1qbmm1co1_500.gif" alt="">
                   </div>

                   <table class="prof-info" width="100%" border="0" cellspacing="0" cellpadding="0">
                     
                      <tr>

                        <td><i><?= $fullname1 ?><span class="req">* </span></i></td>
                        
                        <td><input type="text" name='fullname'  value="<?php echo $fullname; ?>"  class="form-control"></td>
                        
                      </tr>
                      
                      <tr>
                       
                        <td><i><?=$email1?> <span class="req">* </span></i></td>
                        
                        <td><input type="email" name="email" value="<?php echo $email; ?>" class="form-control " required></td>
                        
                      </tr>
                      
                      <tr>
                       
                        <td><i><?= $Mobile ?> <span class="req">* </span></i></td>
                        
                        <td><input  type="tel" name="mobile" value="<?php echo $mobile; ?>" class="form-control numeric"></td>
                     
                      </tr>
                      
                      <tr>
                        <td><i><?= $Phone ?></i></td>
                        <td><input  name="telephone" type="tel" value="<?php echo $telephone; ?>" class="form-control numeric"></td>
                      </tr>

                    </table>

                </div>
                 <input type="hidden" name="edit-ajax" value="true">
                </form>

                <br>

                </div>
                
                
                <?php // var_dump($address_form); ?>






                <div id="delivery_address">
   <!--
                <form action="" onsubmit="event.preventDefault();" method="post" enctype="multipart/form-data" class="form-horizontal" id="delivery_address">
-->
                    <!--
                <h4><strong><?= $delevar?> </strong>
                    <button href="<?php echo $address_form; ?>" onClick="javascript:editAddres();" class="btn btn-primary pull-right"><?= $Edit?>
                    </button></h4> -->
                    <h4><strong><?= $delevar?> </strong><a style="color:#fff; font-size: 14px;" href="<?php echo $addressesInformation['update']; ?>" class="btn btn-primary pull-right"><?= $Edit?></a></h4>

                <div class="tbl-scrl">
                  
                  
                    <div id='image-loading' style="display: none;position: relative;left:50%">
                       <!--<img src="catalog/view/theme/baghli-arbash/images/loading.gif" alt=""> -->
                       <img width="50" height="50" src="https://68.media.tumblr.com/695ce9a82c8974ccbbfc7cad40020c62/tumblr_o9c9rnRZNY1qbmm1co1_500.gif" alt="">
                    </div>
                  
                   <table class="prof-info" width="100%" border="0" cellspacing="0" cellpadding="0">
                     
                     
                      <tr>
                      
          
                                           <?php 
                                           
                                           
                                         //print_r($addressesInformation);exit;
                                        
                                                $address_id = $addressesInformation['address_id'];
                                                 $address1 = $addressesInformation['address_1']; 
                                                 $area = $addressesInformation['custom_field'][3] ;
                                                 $Block = $addressesInformation['custom_field'][4] ;
                                                 $street= $addressesInformation['custom_field'][5];
                                                 $Avenue= $addressesInformation['custom_field'][6]; 
                                                 $Building_Number= $addressesInformation['custom_field'][7]; 
                                                $Floor_Number= $addressesInformation['custom_field'][8];
                                                // $Flat_Number= $addressesInformation['custom_field'][9];
                                                 $Comments= $addressesInformation['custom_field'][10];
 
                                              ?>
                                              
                                              
                        <td><i for="input-address-1"><?php echo $entry_address_1; ?><span class="req">* </span></i></td>
                        <td><input name="address_1" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" type="text" value=" <?php echo $address1; ?> " class="form-control" required></td>
                        <?php if ($error_address_1) { ?>
                          <div class="text-danger"><?php echo $error_address_1; ?></div>
                        <?php } ?>
                                             

                        
                      </tr>

              
                       
                      <tr>
              

                           
                        <td><i><?= $Area ?> <span class="req">* </span></i></td>
                        
                        <td><input type="text" name="area" value="<?php echo $area  ;?>" class="form-control" required></td>
                        
                      

                      </tr>
                      
                    
                      <tr>
                       
                        <td><i> <?= $Block1 ?> <span class="req">* </span></i></td>
              
                        

                        <td>
                                 <input type="text" name="block" value="<?php echo $Block; ?>" class="form-control" required>
                                 
                         </td>

                     
                      </tr>
                      
                      
                      <tr>
                        <td><i> <?= $Street;  ?><span class="req">* </span></i></td>
                                                
                                                
                      

                        <td><input type="text" name="street" value="<?php echo $street; ?>" class="form-control" required></td>
                      </tr>
                       
                       
                       <tr>
                       
                       
                        <td><i><?= $Avenue2 ?> </i></td>
                        
                        

                        <td><input type="text" name="avenue" value="<?php echo $Avenue; ?>" class="form-control"></td>
                        
                        
                       </tr>
                      
                      
                      <tr>
                       
                        <td><i> <?=$Building?> <span class="req">* </span></i></td>
                        

                        <td><input type="text" name="building_number" value="<?php echo $Building_Number; ?>" class="form-control numeric" required></td>
                        
                      </tr>
                      
                      
                      
                      <tr>
                       
                        <td><i><?= $Floor?> </i></td>
                        

                        <td><input type="text" name="Floor_Number" value="<?php echo $Floor_Number; ?>" class="form-control numeric"></td>
                        
                      </tr>
                      
                   <!--
                      <tr>
                       
                        <td><i><?= $Flat?></i></td>
                        

                        <td><input type="text" name="Flat_Number" value="<?php echo $Flat_Number; ?>" class="form-control"></td>
                        
                      </tr>
                      -->
                      
                      <tr>
                       
                        <td><i> <?= $Comments1?></i></td>
                        
                        
                        <td><textarea name="Comments" cols="60" rows="5"> <?php echo $Comments; ?></textarea></td>
                        
                      </tr>
                      
                        
                    </table>
                </div>
                                
                        <input type="hidden" name="edit-ajax" value="true">
                        <input type="hidden" id="address_id" name="address_id" value="<?php echo $address_id; ?>" >

                <!-- </form> -->
                </div>
                

                <div class="adress_content">
                <h4>
                

                <strong> <?=  $Address1 ?></strong>

                
                 <a style="color:#fff; font-size: 14px;" class="btn btn-primary pull-right"   href="index.php?route=account/address/add">
             <?php echo $ad ?> </a>

                <!-- Button trigger modal -->
                </h4>


                <!-- Modal -->
                <!--
                <div class="modal fade add-adrs" id="myModal22" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    </div>
                  </div>
                </div> -->

             <!--  <table id="actul-table"> -->
                <!--    <td> -->
                <div class="row" id="css-table"> <!-- address -->
                   <!-- default from address to insert it in account -->
                     <?php if ($addresses) { ?>
                     <?php // var_dump($addresses); ?>
                        <?php foreach ($addresses as $result) { ?>
                        <div class="col-md-4 del-book same-height" >

                          <section>
                           <p>
                              <?php echo $result['address']; ?></p>
                              <div class="inbottom">
                            <hr>
                            <div class="radio">  
                                <a href="<?php echo $result['update']; ?>" class="btn btn-info"><?php echo $button_edit; ?></a> &nbsp;
                                <a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><?php echo $button_delete; ?>
                                </a>
                            </div>
                              </div>
                          </section>

<!--
</td>
                        </table>


-->
                           <script>

                          ///      $( document ).ready(function() {
                              //      var heights = $(".del-book").map(function() {
                                          //  return $(this).height();
                                   //     }).get(),
//
                                  //      maxHeight = Math.max.apply(null, heights);

                                ///    $(".del-book").height(maxHeight);
                        //        });
                            </script>




                        </div>
                          <?php } ?>
                      <?php  } else { ?>
                      <p><?php echo $text_empty; ?></p>
                      <?php  } ?>
                </div><!-- end address -->
            </div>

                <div class="add_card">
                <h4><strong><?= $addc ?></strong> </h4>
                    <div class="sub_cardd">
                    <h6><?= $eter?>:</h6>
                    
                    <div class="row">
                    	<div class="col-md-3 form-group">
                        <label><?= $name_c?></label>
                      	<input name="" type="text" class="form-control">
                      	</div>
                        
                        <div class="col-md-4 form-group">
                        <label><?=$num_c?></label>
                      	<input name="" type="text" class="form-control">
                      	</div>
                        
                        <div class="col-md-3 form-group expiryy">
                        <label><?= $exp_d?></label>
                           
                        <div class="lat_wrap">   
                        <div class="align_sec">
                                     <div class="input-group spinner">
                                      <input type="text" class="form-control" value="1">
                                      <div class="input-group-btn-vertical">
                                        <button class="btn" type="button"><i class="fa fa-caret-up"></i></button>
                                        <button class="btn" type="button"><i class="fa fa-caret-down"></i></button>
                                      </div>
                                    </div>
                        </div>
     
     				 	<div class="align_sec">	
                                     <div class="input-group newspinn">
                                      <input type="text" class="form-control" value="2017">
                                      <input type="text" class="form-control" value="2017">
                                      <div class="input-group-btn-vertical">
                                        <button class="btn" type="button"><i class="fa fa-caret-up"></i></button>
                                        <button class="btn" type="button"><i class="fa fa-caret-down"></i></button>
                                      </div>
                                    </div>
                          
     				    </div>
                        </div>
 
                      	</div>
                        
                        <div class="col-md-2 form-group">
                      	<input name="" type="button" value="<?=$ad?>" class="btn btn-lg btn-primary button_card">
                      	</div>

                    </div>
                    
                    <div class="tick_wrap">  
                    <input name="" type="checkbox" value=""><label><?= $use12?> </label>
                    </div>
                    
                    </div>

                </div>
                

                
                <div class="change_password_profile">

                <h4> <strong><?=$change?></strong> </h4>
                
                <div class="tbl-scrl"> 
                
                <div id='image-loading' style="display: none;position: relative;left:50%">
                       <!--<img src="catalog/view/theme/baghli-arbash/images/loading.gif" alt=""> -->
                       <img width="50" height="50" src="https://68.media.tumblr.com/695ce9a82c8974ccbbfc7cad40020c62/tumblr_o9c9rnRZNY1qbmm1co1_500.gif" alt="">
                    </div>
                 
                 <form action=""  onsubmit="event.preventDefault();" id="change_password">
                  
                   <table  class="prof-info" width="100%" border="0" cellspacing="0" cellpadding="0">
                     

                      <tr>
                        <td><i><?=$new_p?> <span class="req">* </span></i></td>
                        <td><input type="password" name="password" value="<?php echo $password;?>" id="pass1" class="form-control" required></td>
                        
                         <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
              
                      </tr>
                      

                      <tr>
                        <td><i><?=$Confirm?> <span class="req">* </span></i></td>
                        <td><input type="password" name="confirm" id="pass2" value="<?php echo $confirm; ?>" class="form-control" required></td>
                        
                         <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
                      </tr>

    

                      
                      <tr>
                          <td colspan="2"><button   class="btn btn-info pull-right" onClick="changepassword();"  id="move_password"><?= $CHANGES?></button></td>
                      </tr>
                      


                      </table>
                      
                                       <input type="hidden" name="password-ajax" value="true">

                      </form>

                </div><!-- end change password -->

                </div>
               
            </div>
		</div>
	</div>

        <div class="row">
        <div class="col-md-12">
          <div class="odrtab-contDiv">
            <div class="row">
              <div class="col-md-12">
                <h4><strong><?= $Order?></strong></h4>
                
              </div>
            </div>
            <div class="row">
              <div class="panel panel-login">
                <div class="panel-heading">
                                 
                    <div class="col-xs-6">
                      <a href="<?php echo $openOrder; ?>&notcomplete" class="active" id="login-form-link"><?= $p_Order?> </a>
                    </div>
                    
                    <div class="col-xs-6">
                      <a href="<?php echo $openOrder; ?>&complete" id="register-form-link"><?= $pr_Order?></a>
                    </div>
                  <hr>
                </div>
                <div class="panel-body">
                  <div class="">
                    <div class="col-lg-12">
                    
                    
                    
                      <form id="login-form" role="form" style="display: block;">
                        <div class="orders">
                        <h4 class="clearfix"><?=$p_Order?> <div class="sort pull-right"><?=$SORT?>
                            <select class="form-control">
                              <option>Best Match</option>
                                <option>Newest</option>
                                <option>Most Selling</option>
                                <option>Most Rated</option>
                            </select>
                          </div>
                            
                            
                            

                            </h4>

                            <div class="tbl-scrl clearfix">
                               <table class="orders" width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <th><?php echo $column_order_id; ?></th>
                                    <th><?php echo $column_date_added; ?></th>
                                    <th><?php echo $column_status;  ?></th>
                                    <th><?php echo $column_total; ?></th>
                                    <th></th>
                                  </tr>
                                  
                                 <?php if($orders) { ?>


                                 <?php foreach($orders as $order) { ?>
                                 
                                  <tr>
                                    <td><a class="btn btn-default new-odr-btn"><?php echo $order['order_id']; ?></a></td>
                                    <td><?php echo $order['date_added']; ?></td>
                                    <td><?php echo $order['status']; ?></td>
                                    <td><?php echo $order['total']; ?></td>
                                    <td><div class="rateyo"></div>
                                    <a class="review" href="<?php echo $order['view']; ?>">Review</a>
                                    </td>
                                  </tr>
                                
                                <?php }} ?>
                                  </table>
                                  </div>

                      </div>
                      </form>
                      
                      
                      
<!--
                      <form id="register-form" role="form" style="display: none;">
                        <div class="orders">
                        <h4 class="clearfix">Previous Orders <div class="sort pull-right">Sort By
                            <select class="form-control">
                              <option>Best Match</option>
                                <option>Newest</option>
                                <option>Most Selling</option>
                                <option>Most Rated</option>
                            </select>
                          </div></h4>

                            <div class="tbl-scrl clearfix">
                               <table class="orders" width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <th>Onrder ID</th>
                                    <th>Order Time</th>
                                    <th>Order Status</th>
                                    <th>Order Amount</th>
                                    <th></th>
                                  </tr>

                                  <tr>
                                    <td><a class="btn btn-default new-odr-btn">OD506965574352077000</a></td>
                                    <td>Fri, 2nd Sep'16</td>
                                    <td>Delivered on Wed, 7th Sep'16</td>
                                    <td>KD 32</td>
                                    <td><div class="rateyo"></div>
                                    <a class="review" href="#">Review</a>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td><a class="btn btn-default new-odr-btn">OD506965574352077000</a></td>
                                    <td>Fri, 2nd Sep'16</td>
                                    <td>Delivered on Wed, 7th Sep'16</td>
                                    <td>KD 32</td>
                                    <td><div class="rateyo"></div>
                                    <a class="review" href="#">Review</a>
                                    </td>
                                  </tr>
                                </table>
                                  </div>

                      </div>
                      </form>
                      
-->
                      
                      
                      
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      				</div>
      		  </div>
          </div>
        </div>
      </div>
    </div>
        
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script>
    $('.numeric').on('input', function (event) {
        this.value = this.value.replace(/[^0-9]/g, '');
    });


</script>
<script>
/*** Added by Jijo on 17-04-2017 Start here  ***/

$(document).ready(function(){
     $('#subscription_newsletter').on("click",function(e){
         e.preventDefault();

    
var newsletter=$('#newsletter').val();
     
   $.ajax({
                  url: "index.php?route=account/Newsletter/SubscribeNewsletter",
                  type: "POST",
      data: {'newsletter':newsletter},
        success: function(result){
               $("#subscription_msg").html(result);
            $('#newsletter').val('');
        }});      
         
         
         
    
});
        });
        
        
/*** Added by Jijo on 17-04-2017 End here  ***/        

</script>
<?php echo $footer; ?> 