<?php echo $header; ?>


    <div class="innr-banner"><img src="catalog/view/theme/baghli-arbash/images/innr-bnr-13.png" alt=""></div>
    
    
<div class="container">
 
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
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


   <!--   <h2><?php echo $text_my_account; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
        <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      </ul> -->


        <!--    <?php if ($credit_cards) { ?>
         <h2><?php echo $text_credit_card; ?></h2>
         <ul class="list-unstyled">
           <?php foreach ($credit_cards as $credit_card) { ?>
           <li><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
           <?php } ?>
         </ul>
         <?php } ?> -->




        <!--     <h2><?php echo $text_my_orders; ?></h2>
             <ul class="list-unstyled">
               <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
               <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
               <?php if ($reward) { ?>
               <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
               <?php } ?>
               <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
               <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
               <li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
             </ul>

             -->



        <!--   <h2><?php echo $text_my_newsletter; ?></h2>
           <ul class="list-unstyled">
             <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
           </ul>
           -->



         <div class="container inner-page">
            
             <div class="heading"><span><strong>User </strong> Profile</span></div>

             <div class="row profile">
             <div class="col-md-12">
                 <div class="profile-sidebar">
                     <!-- SIDEBAR USERPIC -->
				<div class="profile-userpic" style="display:none;">
					<img src="images/user.jpg" class="img-responsive" alt="">
				</div>
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-job">
						Hello
					</div>
					<div class="profile-usertitle-name">	    
		
            <label class="col-sm-2 control-label" >
           
           <?php echo $fullname; ?>
           
           
            </label>
            
            
            
					</div>
					
				</div>
				<!-- END SIDEBAR USER TITLE -->
				<!-- SIDEBAR MENU -->
				<!--<div class="profile-usermenu">
					<ul class="nav">
						<li class="active">
							<a href="#">
							<i class="glyphicon glyphicon-home"></i>
							Overview </a>
						</li>
						<li>
							<a href="#">
							<i class="glyphicon glyphicon-user"></i>
							Account Settings </a>
						</li>
						<li>
							<a href="#" target="_blank">
							<i class="glyphicon glyphicon-ok"></i>
							Tasks </a>
						</li>
						<li>
							<a href="#">
							<i class="glyphicon glyphicon-flag"></i>
							Help </a>
						</li>
					</ul>
				</div>-->
				<!-- END MENU -->
			</div>
		</div>
		<div class="col-md-12">
            <div id="personal_info">
            <div class="profile-content clearfix">
            
             <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
             
			   <h4>
          
           <strong>Personal Information</strong> 
            
             <button href="<?php echo $edit; ?>"  class="btn btn-primary pull-right">Edit</button>
             
              </h4>
              
               <div class="tbl-scrl">
                   <table class="prof-info" width="100%" border="0" cellspacing="0" cellpadding="0">
                     
                      <tr>
                        <td><i>Full Name <span class="req">* </span></i></td>
                        
                        <td><input type="text"  value="<?php echo $fullname; ?>"  class="form-control"></td>
                        
                      </tr>
                      
                      <tr>
                       
                        <td><i>Email <span class="req">* </span></i></td>
                        
                        <td><input type="email" value="<?php echo $email; ?>" class="form-control" required></td>
                        
                      </tr>
                      
                      <tr>
                       
                        <td><i>Mobile Number <span class="req">* </span></i></td>
                        
                        <td><input type="text" value="<?php echo $mobile; ?>" class="form-control"></td>
                     
                      </tr>
                      
                      <tr>
                        <td><i>Phone Number</i></td>
                        <td><input type="text" value="<?php echo $telephone; ?>" class="form-control"></td>
                      </tr>
                    </table>
                </div>
                </form>
                
                <br>
                </div>
                
                
                <?php // var_dump($address_form); ?>
                
                
                <form action="<?php echo $address_form; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">

                <h4><strong>Delivery Address</strong> <button href="<?php echo $address_form; ?>" class="btn btn-primary pull-right">Edit</button></h4>
                <div class="tbl-scrl">
                   <table class="prof-info" width="100%" border="0" cellspacing="0" cellpadding="0">
                     
                     
                      <tr>
                      
          
                                           <?php 
                                           
                                           
                                       //   print_r ($addressesInformation);
                                            
                                                 $address1 = $addressesInformation['address_1']; 
                                                 $area = $addressesInformation['custom_field'][3] ;
                                                 $Block = $addressesInformation['custom_field'][4] ;
                                                 $street= $addressesInformation['custom_field'][5];
                                                 $Avenue= $addressesInformation['custom_field'][6]; 
                                                 $Building_Number= $addressesInformation['custom_field'][7]; 
                                                 $Floor_Number= $addressesInformation['custom_field'][8];
                                                 $Flat_Number= $addressesInformation['custom_field'][9];
                                                 $Comments= $addressesInformation['custom_field'][10];
 
                                              ?>
                                              
                                              
                        <td><i for="input-address-1"><?php echo $entry_address_1; ?><span class="req">* </span></i></td>
                        <td><input name="address_1" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" type="text" value=" <?php echo $address1; ?> " class="form-control" required></td>
                        <?php if ($error_address_1) { ?>
                          <div class="text-danger"><?php echo $error_address_1; ?></div>
                        <?php } ?>
                                             

                        
                      </tr>

              
                       
                      <tr>
              

                        
                        
                          
                     
                           
                        <td><i>Area <span class="req">* </span></i></td>
                        
                        <td><input type="text" value="<?php echo $area  ;?>" class="form-control" required></td>
                        
                      

                      </tr>
                      
                      
                      <!--<tr>
                        <td><i>Governorate <span class="req">* </span></i></td>
                        <td><input type="text" value="Governorate" class="form-control"></td>
                      </tr>-->
                      
                      <tr>
                       
                        <td><i>Block <span class="req">* </span></i></td>
              
                        

                        <td>
                                 <input type="text" value="<?php echo $Block; ?>" class="form-control" required>
                                 
                         </td>

                     
                      </tr>
                      
                      
                      <tr>
                        <td><i>Street <span class="req">* </span></i></td>
                                                
                                                
                      

                        <td><input type="text" value="<?php echo $street; ?>" class="form-control" required></td>
                      </tr>
                       
                       
                       <tr>
                       
                       
                        <td><i>Avenue </i></td>
                        
                        

                        <td><input type="text" value="<?php echo $Avenue; ?>" class="form-control"></td>
                        
                        
                       </tr>
                      
                      
                      <tr>
                       
                        <td><i>Building Number <span class="req">* </span></i></td>
                        

                        <td><input type="text" value="<?php echo $Building_Number; ?>" class="form-control" required></td>
                        
                      </tr>
                      
                      
                      
                      <tr>
                       
                        <td><i>Floor Number </i></td>
                        

                        <td><input type="text" value="<?php echo $Floor_Number; ?>" class="form-control"></td>
                        
                      </tr>
                      
                      
                      <tr>
                       
                        <td><i>Flat Number</i></td>
                        

                        <td><input type="text" value="<?php echo $Flat_Number; ?>" class="form-control"></td>
                        
                      </tr>
                      
                      
                      <tr>
                       
                        <td><i>Comments</i></td>
                        
                        
                        <td><textarea cols="60" rows="5"> <?php echo $Comments; ?></textarea></td>
                        
                      </tr>
                      
                        
                    </table>
                </div>
                </form>

                
                <br>

                <h4>
                
                <!--
                <a href="<?php echo $address; ?>"><?php echo $text_address; ?></a> -->
                <strong>Address Book </strong>
               <!--
                <button  href="<?php echo $address_form;?>"  type="button"  data-toggle="modal" data-target="#myModal22" class="btn btn-primary pull-right">
                Add New
                </button> -->
                
                 <a style="color:#fff;" class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModal22"  href="index.php?route=account/address/add">
                 Add New </a>
                 
                <!-- Button trigger modal -->
                </h4>
                
                 
                <!-- Modal -->
                <div class="modal fade add-adrs" id="myModal22" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    </div>
                  </div>
                </div>
                
                

                <div class="row"> <!-- address -->
                         
                   <!-- default from address to insert it in account -->
                    
                     <?php if ($addresses) { ?>
                          
                          
                     <?php  // var_dump($addresses); ?>

                    
                        <?php foreach ($addresses as $result) { ?>
                        

                        
                        
                        <div class="col-md-4 del-book">
                         
                          <section>
                           
                            <?php echo $result['address']; ?>
                            
                            <hr>
                            
                            <div class="radio">  
                                <a href="<?php echo $result['update']; ?>" class="btn btn-info"><?php echo $button_edit; ?></a> &nbsp; 
                                <a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><?php echo $button_delete; ?>
                                </a>
                            </div>
                            
                          </section>
                          
                        </div>

                          <?php } ?>

                      <?php } else { ?>
                      
                      


                      <p><?php echo $text_empty; ?></p>
                      <?php } ?>
                            
                   
                </div><!-- end address -->

                <br>
                
                
                <div class="add_card">
                <h4><strong>Add a card</strong> </h4>
                    <div class="sub_cardd">
                    <h6>Enter your card information:</h6>
                    
                    <div class="row">
                    
                    	<div class="col-md-3 form-group">
                        <label>Name on Card</label>
                      	<input name="name_card" type="text" class="form-control">
                      	</div>
                        
                        <div class="col-md-4 form-group">
                        <label>Card Number</label>
                      	<input name="card_number" type="text" class="form-control">
                      	</div>
                        
                        <div class="col-md-3 form-group expiryy">
                        <label>Expiration Date</label>
                           
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
                                      <div class="input-group-btn-vertical">
                                        <button class="btn" type="button"><i class="fa fa-caret-up"></i></button>
                                        <button class="btn" type="button"><i class="fa fa-caret-down"></i></button>
                                      </div>
                                    </div>
                          
     				    </div>
                        </div>
 
                      	</div>
                        
                        <div class="col-md-2 form-group">
                      	<input name="" type="button" value="Add Your Card" class="btn btn-lg btn-primary button_card">
                      	</div>

                    </div>
                    
                    <div class="tick_wrap">  
                    <input name="" type="checkbox" value=""><label>Use this card across all of Al-Baghli & Al-Arbash  int’l Co W.L.L. </label>
                    </div>
                    
                    </div>
                
                
                
                
                
                
                </div>
                
                
                
                
                
                

                <h4> <strong>Change Password</strong> </h4>
                
                <div class="tbl-scrl"> 
                   <form action="<?php echo $action_password; ?>" method="POST" enctype="multipart/form-data" class="form-horizontal">
       
        <fieldset>
         
          <legend><?php echo $text_password; ?></legend>
          
<!--
           <div class="form-group required">
           
            <label class="col-sm-2 control-label" for="input-currentpassword"><?php echo $entry_currentpassword; ?></label>
            
            <div class="col-sm-10">
             
              <input type="password" name="currentpassword" value="<?php echo $currentpassword; ?>" placeholder="<?php echo $entry_currentpassword; ?>" id="input-currentpassword" class="form-control" />
              <?php  // if ($error_currentpassword) { ?>
              <div class="text-danger"><?php // echo $error_currentpassword; ?></div>
              <?php // } ?>
              
            </div>
            
          </div>  
        
-->
          
          <div class="form-group required">
           
            <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
            
            <div class="col-sm-10">
             
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php // echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
              
            </div>
            
          </div>
          
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
            <div class="col-sm-10">
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php // echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
            </div>
          </div>
          
        </fieldset>
        
        
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
        
        
      </form>  
          
                </div>
                
                
        <script>
              
                </script>
                

                
            </div>
		</div>
	</div>

      <div class="row">
        <div class="col-md-12">
          <div class="odrtab-contDiv">
            <div class="row">
              <div class="col-md-12">
                <h4><strong>Order</strong></h4>
                
              </div>
            </div>
          	<div class="row">
      				<div class="panel panel-login">
      					<div class="panel-heading">
                                 
      							<div class="col-xs-6">
      								<a href="<?php echo $openOrder; ?>" class="active" id="login-form-link">Open Order </a>
      							</div>
      							
      							<div class="col-xs-6">
      								<a href="<?php echo $previousOrder; ?>" id="register-form-link">Previous Order</a>
      							</div>
      						<hr>
      					</div>
      					<div class="panel-body">
      						<div class="">
      							<div class="col-lg-12">
      							
      							
      							
      								<form id="login-form" role="form" style="display: block;">
                        <div class="orders">
                        <h4 class="clearfix">Open Orders <div class="sort pull-right">Sort By
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
                                    <th>Onrder ID</th>
                                    <th>Order Time</th>
                                    <th>Order Status</th>
                                    <th>Order Amount</th>
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
        
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>


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