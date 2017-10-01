<?php
class ControllerAccountAccount extends Controller {
	public function index() {


        if (!$this->customer->isLogged()) {

			$this->session->data['redirect'] = $this->url->link('account/account', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

	      	$data['customer_group'] = $this->config->get('config_customer_group_id');

		if ($this->config->get('config_customer_activity')) {
			$this->load->model('account/activity');

			$activity_data = array(
				'customer_id' => $this->customer->getId(),
				'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
			);

			$this->model_account_activity->addActivity('edit', $activity_data);
		}

		$this->load->language('account/account');
        $this->load->language('account/address');


		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

        
        $this->load->model('account/address');

        
		$this->load->model('account/custom_field');
        

		$data['custom_fields'] = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));
        

		if (isset($this->request->post['custom_field'])) {
			$data['account_custom_field'] = $this->request->post['custom_field'];
		} elseif (isset($customer_info)) {
			$data['account_custom_field'] = json_decode($customer_info['custom_field'], true);
		} else {
			$data['account_custom_field'] = array();
		}

         // var_dump($data['custom_fields']);exit;

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_my_account'] = $this->language->get('text_my_account');
		$data['text_my_orders'] = $this->language->get('text_my_orders');
		$data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_credit_card'] = $this->language->get('text_credit_card');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_recurring'] = $this->language->get('text_recurring');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_fullname'] = $this->language->get('entry_fullname');
        
        $data['email1'] = $this->language->get('email1');
        $data['Mobile'] = $this->language->get('Mobile');
        $data['Phone'] = $this->language->get('Phone');
        $data['delevar'] = $this->language->get('delevar');
        $data['Area'] = $this->language->get('Area');
             $data['Edit'] = $this->language->get('Edit');

        $data['Street'] = $this->language->get('Street');
        $data['Avenue2'] = $this->language->get('Avenue2');
        $data['Building'] = $this->language->get('Building');
        $data['Floor'] = $this->language->get('Floor');
        $data['Flat'] = $this->language->get('Flat');
        $data['Comments1'] = $this->language->get('Comments1');
        $data['ad'] = $this->language->get('ad');
        $data['Address1'] = $this->language->get('Address1');
        $data['addc'] = $this->language->get('addc');
        $data['eter'] = $this->language->get('eter');
        $data['name_c'] = $this->language->get('name_c');
        $data['num_c'] = $this->language->get('num_c');
        $data['exp_d'] = $this->language->get('exp_d');
        $data['use12'] = $this->language->get('use12');
        $data['change'] = $this->language->get('change');
        $data['Current'] = $this->language->get('Curren');
        $data['new_p'] = $this->language->get('new_p');
        $data['Confirm'] = $this->language->get('Confirm');
        $data['CHANGES'] = $this->language->get('CHANGES');
        $data['Order'] = $this->language->get('Order');
        $data['p_Order'] = $this->language->get('p_Order');
        $data['pr_Order'] = $this->language->get('pr_Order');
        $data['SORT'] = $this->language->get('SORT');

        $data['Block1'] = $this->language->get('Block1');

        $data['Hello'] = $this->language->get('Hello');

        $data['usrt'] = $this->language->get('usrt');

        $data['PROFILE'] = $this->language->get('PROFILE');

        $data['Personal_Information'] = $this->language->get('Personal_Information');


        $data['fullname1'] = $this->language->get('fullname1');


		$data['Default'] = $this->language->get('Default');

		$data['vip'] = $this->language->get('vip');


		$data['kuwatian_people'] = $this->language->get('kuwatian_people');





		$data['column_order_id'] = $this->language->get('column_order_id');

        $data['column_date_added'] = $this->language->get('column_date_added');

        $data['column_status'] = $this->language->get('column_status');

        $data['column_total'] = $this->language->get('column_total');




		$data['edit'] = $this->url->link('account/edit', '', true);
		$data['password'] = $this->url->link('account/password', '', true);
		$data['address'] = $this->url->link('account/address', '', true);
        $data['address_form'] = $this->url->link('account/address/edit', '', true);
        $data['address_book'] = $this->url->link('account/address', '', true);
        $data['action'] = $this->url->link('account/password', '', true);      
        $data['openOrder'] = $this->url->link('account/order', '', true);
     //   $data['previosOrder'] = $this->url->link('account/order/info&orders[order_id]', '', true);




        /* ------ get customer data ------ */



         
        /* ------ get customer order ------ */


if (isset($this->request->get['page'])) {
   $page = $this->request->get['page'];
  } else {
   $page = 1;
  }

	$data['orders'] = array();

		$this->load->model('account/order');

		$order_total = $this->model_account_order->getTotalOrders();

		$results = $this->model_account_order->getOrders(($page - 1) * 10, 10);

		foreach ($results as $result) {
			$product_total = $this->model_account_order->getTotalOrderProductsByOrderId($result['order_id']);
			$voucher_total = $this->model_account_order->getTotalOrderVouchersByOrderId($result['order_id']);

			$data['orders'][] = array(
				'order_id'   => $result['order_id'],
				'name'       => $result['firstname'] . ' ' . $result['lastname'],
				'status'     => $result['status'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'products'   => ($product_total + $voucher_total),
				'total'      => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
				'view'       => $this->url->link('account/order/info', 'order_id=' . $result['order_id'], true),
			);
		}
     //   $data['previousOrder'] = $this->url->link('account/order/info&order_id='.$data[orders][view], '', true);
      //  $data['previosOrder'] = $this->url->link('account/order/info&order_id='.$data[orders][view], true);


        /* ------ get customer order ------ */


        $this->session->data['success'] = $this->language->get('text_edit');

        $this->load->model('account/customer');

        $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

        //print_r($customer_info);exit;
		//$customer_group_id = $this->customer->getCustomerGroupId();


		//print_r($customer_group_id);

     //   $customer_group = $this->model_account_customer->CustomerGroup();

	//	print_r($customer_group);
        
        $data['addresses'] = array();
        
        $address_id =$this->customer->getAddressId();
        
    //    print_r($address_id);
        
		$default_Address = $this->model_account_address->getAddress($address_id);


        
        $data['addressesInformation'] =$default_Address;
        $data['addressesInformation']['update'] = $this->url->link('account/address/edit', 'address_id=' .  $data['addressesInformation']['address_id'], true);

		$results = $this->model_account_address->getAddresses();

        
		foreach ($results as $result) {
            
        
            if ($result['custom_field']) {
				foreach ($result['custom_field'] as $custom_value) {
					
                    
                    // print_r($custom_value);

                    
					$format =  $custom_value;
					break;
				}
			} else {
				$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
			}
            
            
            
			if ($result['address_format']) {
				$format = $result['address_format'];
			} else {
				$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
			}

			$find = array(
				'{firstname}',
				'{lastname}',
				'{company}',
				'{address_1}',
				'{address_2}',
				'{city}',
				'{postcode}',
				'{zone}',
				'{zone_code}',
				'{country}'
			);

			$replace = array(
				'firstname' => $result['firstname'],
				'lastname'  => $result['lastname'],
				'company'   => $result['company'],
				'address_1' => $result['address_1'],
				'address_2' => $result['address_2'],
				'city'      => $result['city'],
				'postcode'  => $result['postcode'],
				'zone'      => $result['zone'],
				'zone_code' => $result['zone_code'],
				'country'   => $result['country']
			);

			$data['addresses'][] = array(
				'address_id' => $result['address_id'],
				'address'    => str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format)))),
				'update'     => $this->url->link('account/address/edit', 'address_id=' . $result['address_id'], true),
				'delete'     => $this->url->link('account/address/delete', 'address_id=' . $result['address_id'], true)
			);
		}

        
    

		
		
        if (isset($this->request->post['fullname'])) {
			$data['fullname'] = $this->request->post['fullname'];
		} elseif (!empty($customer_info)) {
			$data['fullname'] = $customer_info['fullname'];
		} else {
			$data['fullname'] = '';
		}
		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($customer_info)) {
			$data['email'] = $customer_info['email'];
		} else {
			$data['email'] = '';
		}
        
        if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

      
        
        if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} elseif (!empty($customer_info)) {
			$data['telephone'] = $customer_info['telephone'];
		} else {
			$data['telephone'] = '';
		}
        
          if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['error_telephone'];
		} else {
			$data['error_telephone'] = '';
		}
        
        if (isset($this->request->post['mobile'])) {
			$data['mobile'] = $this->request->post['mobile'];
		} elseif (!empty($customer_info)) {
			$data['mobile'] = $customer_info['mobile'];
		} else {
			$data['mobile'] = '';
		}
        
        
          if (isset($this->error['mobile'])) {
			$data['error_mobile'] = $this->error['mobile'];
		} else {
			$data['error_mobile'] = '';
		}
        
          
      if (isset($this->request->post['address_1'])) {
			$data['address_1'] = $this->request->post['address_1'];
		} elseif (!empty($address_info)) {
			$data['address_1'] = $address_info['address_1'];
		} else {
			$data['address_1'] = '';
		}
        
        
        if (isset($this->error['address_1'])) {
			$data['error_address_1'] = $this->error['address_1'];
		} else {
			$data['error_address_1'] = '';
		}
        
          if (isset($this->request->post['area'])) {
			$data['area'] = $this->request->post['area'];
		} elseif (!empty($address_info)) {
			$data['area'] = $address_info['area'];
		} else {
			$data['area'] = '';
		}
        
           if (isset($this->error['area'])) {
			$data['area'] = $this->error['area'];
		} else {
			$data['area'] = '';
		}
        
        
         if (isset($this->request->post['block'])) {
			$data['block'] = $this->request->post['block'];
		} elseif (!empty($address_info)) {
			$data['block'] = $address_info['block'];
		} else {
			$data['block'] = '';
		}
        
         if (isset($this->error['block'])) {
			$data['block'] = $this->error['block'];
		} else {
			$data['block'] = '';
		}
        
           if (isset($this->request->post['street'])) {
			$data['street'] = $this->request->post['street'];
		} elseif (!empty($address_info)) {
			$data['street'] = $address_info['street'];
		} else {
			$data['street'] = '';
		}
        
         if (isset($this->error['street'])) {
			$data['street'] = $this->error['street'];
		} else {
			$data['street'] = '';
		}
        
          if (isset($this->request->post['avenue'])) {
			$data['avenue'] = $this->request->post['avenue'];
		} elseif (!empty($address_info)) {
			$data['avenue'] = $address_info['avenue'];
		} else {
			$data['avenue'] = '';
		}
        
         if (isset($this->error['avenue'])) {
			$data['avenue'] = $this->error['avenue'];
		} else {
			$data['avenue'] = '';
		}
        
           if (isset($this->request->post['building_number'])) {
			$data['building_number'] = $this->request->post['building_number'];
		} elseif (!empty($address_info)) {
			$data['building_number'] = $address_info['building_number'];
		} else {
			$data['building_number'] = '';
		}
        
         if (isset($this->error['building_number'])) {
			$data['building_number'] = $this->error['building_number'];
		} else {
			$data['building_number'] = '';
		}
        
         if (isset($this->request->post['Floor_Number'])) {
			$data['Floor_Number'] = $this->request->post['Floor_Number'];
		} elseif (!empty($address_info)) {
			$data['Floor_Number'] = $address_info['Floor_Number'];
		} else {
			$data['Floor_Number'] = '';
		}
        
         if (isset($this->error['Floor_Number'])) {
			$data['Floor_Number'] = $this->error['Floor_Number'];
		} else {
			$data['Floor_Number'] = '';
		}
        
          if (isset($this->request->post['Flat_Number'])) {
			$data['Flat_Number'] = $this->request->post['Flat_Number'];
		} elseif (!empty($address_info)) {
			$data['Flat_Number'] = $address_info['Flat_Number'];
		} else {
			$data['Flat_Number'] = '';
		}
        
         if (isset($this->error['Flat_Number'])) {
			$data['Flat_Number'] = $this->error['Flat_Number'];
		} else {
			$data['Flat_Number'] = '';
		}
        
         if (isset($this->request->post['Comments'])) {
			$data['Comments'] = $this->request->post['Comments'];
		} elseif (!empty($address_info)) {
			$data['Comments'] = $address_info['Comments'];
		} else {
			$data['Comments'] = '';
		}
        
         if (isset($this->error['Comments'])) {
			$data['Comments'] = $this->error['Comments'];
		} else {
			$data['Comments'] = '';
		}
        
        if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}
        
        if (isset($this->error['confirm'])) {
			$data['error_confirm'] = $this->error['confirm'];
		} else {
			$data['error_confirm'] = '';
		}
        
        if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}
        
        if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}
        
        
        
// var_dump($customer_info);exit();

    //   $this->model_account_address->editAddress($this->request->get['address_id'], $this->request->post);
        
    //    print_r($this->model_account_address->editAddress($this->request->get['address_id']);exit;
        
//        
//        	if ($this->config->get('config_customer_activity')) {
//				$this->load->model('account/activity');
//
//				$activity_data = array(
//					'customer_id' => $this->customer->getId(),
//					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
//				);
//
//				$this->model_account_activity->addActivity('address_edit', $activity_data);
//			}


        
        
        // added for create password 
        
        
//         if (isset($this->error['currentpassword'])) {
//			$data['error_currentpassword'] = $this->error['currentpassword'];
//		} else {
//			$data['error_currentpassword'] = '';
//		}

		if (isset($this->error['confirm'])) {
			$data['error_confirm'] = $this->error['confirm'];
		} else {
			$data['error_confirm'] = '';
		}

		// $data['action'] = $this->url->link('account/password', '', true);

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}
        
        
//		if (isset($this->request->post['currentpassword'])) {
//			$data['currentpassword'] = $this->request->post['currentpassword'];
//		} else {
//			$data['currentpassword'] = '';
//		}

		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}
        
        // end of password addition 
        
        
        
            
            


		$data['credit_cards'] = array();
		
		$files = glob(DIR_APPLICATION . 'controller/extension/credit_card/*.php');
		
		foreach ($files as $file) {
			$code = basename($file, '.php');
			
			if ($this->config->get($code . '_status') && $this->config->get($code . '_card')) {
				$this->load->language('extension/credit_card/' . $code);

				$data['credit_cards'][] = array(
					'name' => $this->language->get('heading_title'),
					'href' => $this->url->link('extension/credit_card/' . $code, '', true)
				);
			}
		}
		
		$data['wishlist'] = $this->url->link('account/wishlist');
		$data['order'] = $this->url->link('account/order', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		
		if ($this->config->get('reward_status')) {
			$data['reward'] = $this->url->link('account/reward', '', true);
		} else {
			$data['reward'] = '';
		}		
		
		$data['return'] = $this->url->link('account/return', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
		$data['recurring'] = $this->url->link('account/recurring', '', true);
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		
		$data['header'] = $this->load->controller('common/header');
        
	    // add account  for address language
         
		$this->load->language('account/address');
        $this->load->language('account/password');



		// add the model of address

		$this->load->model('account/address');
        
		$data['text_address_book'] = $this->language->get('text_address_book');
		$data['text_empty'] = $this->language->get('text_empty');
        
        
        $data['entry_address_1'] = $this->language->get('entry_address_1');


		$data['button_new_address'] = $this->language->get('button_new_address');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_back'] = $this->language->get('button_back');




		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		
        
        	// Custom Fields
		$this->load->model('account/custom_field');

		$data['custom_fields'] = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

		if (isset($this->request->post['custom_field'])) {
			$data['account_custom_field'] = $this->request->post['custom_field'];
		} elseif (isset($customer_info)) {
			$data['account_custom_field'] = json_decode($customer_info['custom_field'], true);
		} else {
			$data['account_custom_field'] = array();
		}
        
        
        if (isset($this->error['custom_field'])) {
			$data['error_custom_field'] = $this->error['custom_field'];
		} else {
			$data['error_custom_field'] = array();
		}

        
        $account_info=$data['account_custom_field'];
        //$data["our_full_name"]= $account_info[13];
		
		$this->response->setOutput($this->load->view('account/account', $data));
        
	}
	protected function validate() {
		if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

        if ((utf8_strlen(trim($this->request->post['address_1'])) < 1) || (utf8_strlen(trim($this->request->post['address_1'])) > 32)) {
			$this->error['address_1'] = $this->language->get('error_address_1');
		}
        

        
        if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if ($this->request->post['confirm'] != $this->request->post['password']) {
			$this->error['confirm'] = $this->language->get('error_confirm');
		}

        
		if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if (($this->customer->getEmail() != $this->request->post['email']) && $this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_exists');
		}

		if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}

		// Custom field validation
		$this->load->model('account/custom_field');

		$custom_fields = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));

		foreach ($custom_fields as $custom_field) {
			if (($custom_field['location'] == 'account') && $custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['custom_field_id']])) {
				$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
			} elseif (($custom_field['location'] == 'account') && ($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
				$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
			}
		}

		return !$this->error;
	}



	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

}
