<?php require_once(DIR_KNET.'e24PaymentPipe.inc.php');
class  ControllerExtensionPaymentKNET extends Controller {
    public function index() {
        $this->load->language('extension/payment/knet');
        
        $data['button_confirm'] = $this->language->get('button_confirm');
        
        $this->load->model('checkout/order');

        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
        
        $data['action'] = $this->url->link('extension/payment/knet/makepayment', '', 'SSL');
        
        $data['amount'] = $order_info['total'];
        $data['order_id'] = $this->session->data['order_id'];
        $data['description'] = $this->config->get('config_name');
        
        $data['billing_fullname'] = $order_info['payment_firstname'] . ' ' . $order_info['payment_lastname'];
        
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
        }
        
        $data['email_address'] = $order_info['email'];
        $data['customer_phone_number']= $order_info['telephone'];
        
        $data['success_url'] = $this->url->link('checkout/success');
        $data['cancel_url'] = $this->url->link('checkout/checkout', '', true);
        
        return $this->load->view('extension/payment/knet', $data);
        
       // if (file_exists( 'extension/payment/knet')) {
       //     return $this->load->view( 'extension/payment/knet', $data);
       // } else {
          //  return $this->load->view('extension/payment/knet', $data);
       // }
       
       if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/knet.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/payment/knet.tpl';
        } else {
            $this->template = 'baghli-arbash/template/payment/knet.tpl';
        }   
       $this->render();
       
       
    }
    
    public function makepayment()
    {
        
        $this->load->language('extension/payment/knet');
        
        $this->load->model('checkout/order');
        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
        $trackID = date('YmdHis');

        $host = "https://" . $_SERVER['HTTP_HOST'];
        $successUrl = $host . '/baghli/success.php';
        $errorUrl = $host . '/baghli/error.php';
        $payment = new e24PaymentPipe;
        $payment->setErrorUrl($errorUrl);
        $payment->setResponseURL($successUrl);
        $payment->setLanguage($this->language->get('lang_code'));
        $payment->setCurrency($this->language->get('currency_code')); //USD
        $payment->setResourcePath(DIR_KNET);
        $payment->setAlias($this->config->get('knet_alias'));
        $payment->setAction("1"); // 1 = Purchase
        $payment->setAmt($order_info['total']);
        $payment->setTrackId($trackID);
        $payment->performPaymentInitialization();

        if (strlen($payment->getErrorMsg()) > 0) 
        {
		
            $this->session->data['error'] = $payment->getErrorMsg();
            $this->response->redirect($this->url->link('checkout/cart'));
        }
        else
        {
            $this->session->data['order_total'] = $order_info['total'];
            $message = 'PaymentID: ' . $payment->paymentId . "\n";
            $message .= 'TrackID: ' . $trackID . "\n";
            $message .= 'Amount: ' . $order_info['total'] . "\n";
            $message .= 'Time: ' . date('d-m-Y H:i:s') . "\n";
            //Save details in DB before redirecting user to KNET. Else redirect to cart.
            
            if($order_info)
            {
                $this->load->model('extension/payment/knet');
                $voidOrderStatus = 16;
                $this->model_extension_payment_knet->change_order_status($order_info, $voidOrderStatus, $message);
                header('Location: ' . $payment_id = $payment->paymentPage . '?PaymentID=' . $payment->paymentId);
            }
            else
            {
				
                $this->response->redirect($this->url->link('checkout/cart'));
            }
        }
    }
    
    public function error()
    {
	
        $this->session->data['error'] = $this->language->get('error_declined');
        $this->redirect($this->url->link('checkout/cart'));
    }
    
    public function success() {
		
	
  $this->load->language('extension/payment/knet');
        
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
            
            $orderAmt = $this->session->data['order_total'];
            unset($this->session->data['order_total']);
        }    
        
        //Read URL params
        $paymentID = $_GET['PaymentID'];
        $presult = $_GET['Result'];
        $postdate = substr($_GET['PostDate'], 2, 4) . "/" . substr($_GET['PostDate'], 0, 2) . "/" . date("Y");
        $tranid = $_GET['TranID'];
        $auth = $_GET['Auth'];
        $ref = $_GET['Ref'];
        $trackid = $_GET['TrackID'];
        
        $message = 'PaymentID: ' . $paymentID . "\n";
        $message .= 'Result: ' . $presult . "\n";
        $message .= 'Amount: ' . $orderAmt . "\n";
        $message .= 'PostDate: ' . $postdate . "\n";
        $message .= 'TranID: ' . $tranid . "\n";
        $message .= 'Auth: ' . $auth . "\n";
        $message .= 'Ref: ' . $ref . "\n";
        $message .= 'TrackID: ' . $trackid . "\n";
        $message .= 'Time: ' . date('H:i:s') . "\n";
        
        $orderStatusID = 0;
        if ($presult == 'CAPTURED') {
            $order_comment = $comment;
            $order_comment = "<br><br>KNET Details:<br>";
            $order_comment = $message;
            $this->model_checkout_order->addOrderHistory($order_id, $this->config->get('config_order_status_id'), $order_comment, true);            
            $paymentMessage = $this->language->get('payment_success');
            $orderStatusID = $this->config->get('config_order_status_id');    //Set order_status_id = 'Pending'            
        } else {
            $failedOrderStatus = 10;            
            $paymentMessage = $this->language->get('payment_failed');
            $this->model_checkout_order->addOrderHistory($order_id, $failedOrderStatus, $paymentMessage, false);
            $orderStatusID = $failedOrderStatus;    //Set order_status_id = 'Failed'
        }        
        
        $data['paymentID'] = $paymentID;
        $data['result']= $presult;
        $data['paymentDate'] = $postdate;
        $data['amount']= $orderAmt;
        $data['transID'] = $tranid;
        $data['trackID'] = $trackid;
        $data['refID'] = $ref;
        $data['paymentTime'] = date('H:i:s');
        $data['payment_message'] = $paymentMessage;
        
        $this->model_checkout_order->addOrderHistory($order_id, $orderStatusID, $message, false);
        
    
        
        $data['continue'] = $this->url->link('checkout/cart');
        
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
        
        $data['button_continue'] = $this->language->get('button_continue');
        
       // if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . 'extension/payment/knet_success')) {
          //  $this->response->setOutput($this->load->view($this->config->get('config_template') . 'extension/payment/knet_success', $data));
        //} else {
            $this->response->setOutput($this->load->view('extension/payment/knet_success', $data));



        //}
 }
}
?>