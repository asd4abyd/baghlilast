<?php 
    class  ModelExtensionPaymentKNET extends Model 
    {    
        public function change_order_status($order_info, $order_status_id, $comment = '') 
        {        
            //$order_info = $this->getOrder($order_id); 
//var_dump($order_info);			
            if ($order_info) 
            {            
                $order_id = $order_info['order_id'];            
                // Fraud Detection            
                if ($this->config->get('config_fraud_detection')) 
                {                
                    $this->load->model('checkout/fraud');                                
                    $risk_score = $this->model_checkout_fraud->getFraudScore($order_info);                                
                    if ($risk_score > $this->config->get('config_fraud_score')) 
                    {                    
                        $order_status_id = $this->config->get('config_fraud_status_id');                
                    }            
                }                        

                // Blacklist            
                $status = false;                        
                $this->load->model('account/customer');                        
              
              

                // $notify = false;            
                // $this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = '" . (int)$order_status_id . "', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");
                $this->db->query("INSERT INTO " . DB_PREFIX . "order_history SET order_id = '" . (int)$order_id . "', order_status_id = '" . (int)$order_status_id . "', notify = '0', comment = '" . $this->db->escape($comment) . "', date_added = NOW()");        
            }    
        }

        public function getMethod($address, $total) {
            $this->load->language('extension/payment/knet');        
            $method_data = array();            
            $method_data = array('code' => 'knet',
                                    'title' => $this->language->get('text_title'),
                                    'terms'      => '',
                                    'sort_order' => $this->config->get('knet_sort_order')
                                    );
                                    
            return $method_data;
        }
    }
?>