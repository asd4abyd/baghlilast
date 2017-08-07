<?php

define ('HMAC_SHA256', 'sha256');

class ControllerExtensionPaymentNBK extends Controller {
	public function index() {
		$this->load->language('extension/payment/nbk');
		
		$data['button_confirm'] = $this->language->get('button_confirm');
		
		$this->load->model('checkout/order');

		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

		$mode = $this->config->get('nbk_mode');
		if($mode == 1)
		{
			$data['action'] = "https://secureacceptance.cybersource.com/pay";
		}
		else
		{
			$data['action'] = "https://testsecureacceptance.cybersource.com/pay";
		}
        
        $data['amount'] = $order_info['total'];
        $data['order_id'] = $this->session->data['order_id'];
        $data['description'] = $this->config->get('config_name');

        //print_r($order_info);

        /*if(str_replace(array('+','/','='), array('-','_','.'), base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5('xSTOreKneT8794@#$'), (!empty($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : $_SERVER['SERVER_NAME']), MCRYPT_MODE_CBC, md5(md5('xSTOreKneT8794@#$'))))) != $this->config->get('knet_ak'))
		{
			$knetError = 'KNET Activation Key is not valid. <br>Please purchase KNET Payment Gateway extension from <a href="http://x-store.in" target="_blank">x-store.in</a>';
			$this->session->data['error'] = $knetError;
			$this->redirect($this->url->link('checkout/cart'));
		}*/

		$data['bill_to_forename'] = $order_info['payment_firstname'];
		$data['bill_to_surname'] = $order_info['payment_lastname'];
		$data['bill_to_address_city'] = $order_info['payment_city'];
		$data['bill_to_address_line1'] = $order_info['payment_address_1'] . "\r\n" . $order_info['payment_address_2'];		
		$data['bill_to_address_postal_code'] = $order_info['payment_postcode'];
		$data['bill_to_address_country'] = $order_info['payment_iso_code_2'];
		$data['bill_to_email'] = $order_info['email'];
		$data['bill_to_phone'] = $order_info['telephone'];
		$data['ship_to_address_city'] = $order_info['shipping_city'];
		$data['ship_to_address_line1'] = $order_info['shipping_address_1'] . "\r\n" . $order_info['shipping_address_2'];
		$data['ship_to_address_postal_code'] = $order_info['shipping_postcode'];
		$data['ship_to_forename'] = $order_info['shipping_firstname'];
		$data['ship_to_surname'] = $order_info['shipping_lastname'];
		$data['ship_to_address_country'] = $order_info['shipping_iso_code_2'];

		/*$data['billing_fullname'] = $order_info['payment_firstname'] . ' ' . $order_info['payment_lastname'];
        
		if ($order_info['payment_address_2']) {
            $data['billing_address']  = $order_info['payment_address_1'] . "\r\n" . $order_info['payment_address_2'] . "\r\n" . $order_info['payment_city'] . "\r\n" . $order_info['payment_zone'] . "\r\n";
        } else {
            $data['billing_address']  = $order_info['payment_address_1'] . "\r\n" . $order_info['payment_city'] . "\r\n" . $order_info['payment_zone'] . "\r\n";
        }
		
        $data['billing_postcode'] = $order_info['payment_postcode'];

		if ($this->cart->hasShipping()) {
			$data['delivery_fullname'] = $order_info['shipping_firstname'] . ' ' . $order_info['shipping_lastname'];
			
			if ($order_info['shipping_address_2']) {
				$data['delivery_address'] = $order_info['shipping_address_1'] . "\r\n" . $order_info['shipping_address_2'] . "\r\n" . $order_info['shipping_city'] . "\r\n" . $order_info['shipping_zone'] . "\r\n";
			} else {
				$data['delivery_address'] = $order_info['shipping_address_1'] . "\r\n" . $order_info['shipping_city'] . "\r\n" . $order_info['shipping_zone'] . "\r\n";
			}
		
        	$data['delivery_postcode'] = $order_info['shipping_postcode'];
		} else {
			$data['delivery_fullname'] = $order_info['payment_firstname'] . ' ' . $order_info['payment_lastname'];
			
			if ($order_info['payment_address_2']) {
				$data['delivery_address'] = $order_info['payment_address_1'] . "\r\n" . $order_info['payment_address_2'] . "\r\n" . $order_info['payment_city'] . "\r\n" . $order_info['payment_zone'] . "\r\n";
			} else {
				$data['delivery_address'] = $order_info['shipping_address_1'] . "\r\n" . $order_info['payment_city'] . "\r\n" . $order_info['payment_zone'] . "\r\n";
			}
		
        	$data['delivery_postcode'] = $order_info['payment_postcode'];			
		}*/
		
        /*$data['email_address'] = $order_info['email'];
        $data['customer_phone_number']= $order_info['telephone'];*/
        $data['success_url'] = $this->url->link('checkout/success', '', 'SSL');
        $data['cancel_url'] = $this->url->link('checkout/payment', '', 'SSL');
        $data['nbk_access_key'] = $this->config->get('nbk_access_key');
        $data['nbk_profile_id'] = $this->config->get('nbk_profile_id');
        $data['transaction_uuid'] = uniqid();
        $data['signed_date_time'] = gmdate("Y-m-d\TH:i:s\Z");

        // Create signed data
        $params = array();
        $params['access_key'] = $this->config->get('nbk_access_key');
        $params['profile_id'] = $this->config->get('nbk_profile_id');
        $params['transaction_uuid'] = $data['transaction_uuid'];
        $params['signed_field_names'] = "access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency,bill_to_address_line1,bill_to_address_city,bill_to_address_country,bill_to_email,bill_to_surname,bill_to_forename";
        $params['unsigned_field_names'] = '';//'bill_to_forename,bill_to_surname,bill_to_address_city,bill_to_address_line1,bill_to_address_postal_code,bill_to_email,bill_to_phone,ship_to_address_city,ship_to_address_line1,ship_to_address_postal_code,ship_to_forename,ship_to_surname';
        $params['signed_date_time'] = $data['signed_date_time'];
        $params['locale'] = "en-us";
        $params['payment_method'] = "card";
        $params['transaction_type'] = "authorization";
        $params['reference_number'] = $this->session->data['order_id'];
        $params['amount'] = number_format($order_info['total'], 2);
        $params['currency'] = "KWD";
        $params['bill_to_forename'] = $order_info['payment_firstname'];
		$params['bill_to_surname'] = $order_info['payment_lastname'];
		$params['bill_to_address_city'] = $order_info['payment_city'];
		$params['bill_to_address_line1'] = $order_info['payment_address_1'] . "\r\n" . $order_info['payment_address_2'];
		$params['bill_to_address_postal_code'] = $order_info['payment_postcode'];
		$params['bill_to_address_country'] = $order_info['payment_iso_code_2'];
		$params['bill_to_email'] = $order_info['email'];
		$params['bill_to_phone'] = $order_info['telephone'];
		$params['ship_to_address_city'] = $order_info['shipping_city'];
		$params['ship_to_address_line1'] = $order_info['shipping_address_1'] . "\r\n" . $order_info['shipping_address_2'];
		$params['ship_to_address_postal_code'] = $order_info['shipping_postcode'];
		$params['ship_to_forename'] = $order_info['shipping_firstname'];
		$params['ship_to_surname'] = $order_info['shipping_lastname'];
		$params['ship_to_address_country'] = $order_info['shipping_iso_code_2'];		

        $data['signedParams'] = $this->sign($params, $this->config->get('nbk_secret_key'));

        /*$this->log->write('Parameters: ');
        $this->log->write(implode(",", $params));
        $this->log->write('Data array: ');
        $this->log->write(implode(",", $data));*/

        
        //if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/payment/nbk.tpl')) {
            return $this->load->view('extension/payment/nbk.tpl', $data);
        //} else {
         //   return $this->load->view('default/template/extension/payment/nbk.tpl', $data);
       // }
	}

	
	public function response() {
		//var_dump($_REQUEST);

		$this->load->language('extension/payment/nbk');
		
		if (isset($this->session->data['order_id'])) {
			$order_id = $this->session->data['order_id'];
		} else {
			$order_id = 0;
		}

		$this->load->model('checkout/order');
				
		$order_info = $this->model_checkout_order->getOrder($order_id);
		
		if (!$order_info) {
			$this->session->data['error'] = $this->language->get('error_no_order');
			
			$this->response->redirect($this->url->link('checkout/cart'));
		}
		
		$orderAmt = 0;
		$comment = $this->session->data['comment'];
		if (isset($this->session->data['order_id'])) {
			$this->cart->clear();
			
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);	
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
		}	
		
		//Read request object params
		$reason_code 		= $_REQUEST['reason_code'];
		$card_type 			= $_REQUEST['req_card_type'];
		$card_number 		= $_REQUEST['req_card_number'];
		$signed_date_time 	= $_REQUEST['signed_date_time'];
		$card_expiry_date	= $_REQUEST['req_card_expiry_date'];
		$currency 			= $_REQUEST['req_currency'];
		$reference_number	= $_REQUEST['req_reference_number'];
		$decision	 		= $_REQUEST['decision'];
		$transaction_id		= $_REQUEST['transaction_id'];
		$amount 			= $_REQUEST['req_amount'];
		$payer_auth_reason_code = $_REQUEST['payer_authentication_reason_code'];
		$req_message 			= $_REQUEST['message'];
		$payment_method 	= $_REQUEST['req_payment_method'];
		$request_token 		= $_REQUEST['request_token'];
		
		$message = 'Reason Code: ' . $reason_code . "\n";
		$message .= 'Decision: ' . $decision . "\n";
		$message .= 'Amount: ' . $amount . "\n";
		$message .= 'Datetime: ' . $signed_date_time . "\n";
		$message .= 'TransactionID: ' . $transaction_id . "\n";
		$message .= 'Card Type: ' . $card_type . "\n";
		$message .= 'Card Number: ' . $card_number . "\n";
		$message .= 'Card Expiry Date: ' . $card_expiry_date . "\n";
		$message .= 'Currency: ' . $currency . "\n";
		$message .= 'Ref. Number: ' . $reference_number . "\n";
		$message .= 'Payer authentication reason code: ' . $payer_auth_reason_code . "\n";
		$message .= 'Message: ' . $req_message . "\n";
		$message .= 'Payment Method: ' . $payment_method . "\n";
		$message .= 'Request Token: ' . $request_token . "\n";

		$order_comment = $comment;
		$order_comment .= "<br><br>NBK Details:<br>";
		$order_comment .= $message;
		
		$orderStatusID = 0;
		if ($reason_code == '100' || $reason_code == '110') {			
			$this->model_checkout_order->addOrderHistory($order_id, $this->config->get('config_order_status_id'), $order_comment, true);			
			$paymentMessage = 'Your order has been successfully processed! Thanks for shopping with us.';
			$orderStatusID = $this->config->get('config_order_status_id');	//Set order_status_id = 'Pending'			
		} else {
			$failedOrderStatus = 10;
			$paymentMessage = 'Error processing payment. Order failed.';
			$this->model_checkout_order->addOrderHistory($order_id, $failedOrderStatus, $order_comment, false);
			$orderStatusID = $failedOrderStatus;	////Set order_status_id = 'Failed'
		}		
		
		$data['payment_message'] = $paymentMessage;
		$data['reason_code'] = $reason_code;
        $data['decision']= $decision;
		$data['signed_date_time'] = $signed_date_time;
		$data['amount']= $amount;
        $data['transID'] = $transaction_id;
        $data['card_number'] = $card_number;
		$data['card_expiry_date'] = $card_expiry_date;
		$data['currency'] = $currency;
		$data['reference_number'] = $reference_number;
		$data['payer_auth_reason_code'] = $payer_auth_reason_code;
		$data['message'] = $req_message;
		$data['request_token'] = $request_token;
		
		//$this->model_checkout_order->update($order_id, $orderStatusID, $message, false);
        
		$data['continue'] = $this->url->link('checkout/cart');
        
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
        
        $data['button_continue'] = $this->language->get('button_continue');
        
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/payment/nbk_success.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/extension/template/payment/nbk_success.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/extension/payment/nbk_success.tpl', $data));
        }
	}

	public function sign ($params, $secretKey) {
	  return $this->signData($this->buildDataToSign($params), $secretKey);
	}

	public function signData($data, $secretKey) {
	    return base64_encode(hash_hmac('sha256', $data, $secretKey, true));
	}

	public function buildDataToSign($params) {
	        $signedFieldNames = explode(",",$params["signed_field_names"]);
	        foreach ($signedFieldNames as $field) {
	           $dataToSign[] = $field . "=" . $params[$field];
	        }
	        return $this->commaSeparate($dataToSign);
	}

	public function commaSeparate ($dataToSign) {
	    return implode(",",$dataToSign);
	}
}
?>