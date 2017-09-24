<?php

//include('catalog\controller\information\contact.php');

class ControllerInformationCareers extends Controller { // Controller - This is a controller file. Information - This is the folder it is in. Static - This file name is static.php
      
     public function index() {
      $this->language->load('information/careers'); // Optional. This calls for your language file

       $this->document->setTitle($this->language->get('heading_title')); // Optional. Set the title of your web page.
         
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_message'] = $this->language->get('text_success');
		$data['button_continue'] = $this->language->get('button_continue');
		$data['resume'] = $this->language->get('resume');
		$data['full'] = $this->language->get('full');

		$data['email'] = $this->language->get('email');


		$data['mob'] = $this->language->get('mob');

		$data['mob1'] = $this->language->get('mob1');

		$data['Comment'] = $this->language->get('Comment');
		
		$data['sub'] = $this->language->get('sub');




         
  //       if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
		// 	$mail = new Mail();
		// 	$mail->protocol = $this->config->get('config_mail_protocol');
		// 	$mail->parameter = $this->config->get('config_mail_parameter');
		// 	$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		// 	$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		// 	$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		// 	$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		// 	$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		// 	$mail->setTo($this->config->get('config_email'));
		// 	$mail->setFrom($this->request->post['email']);
		// 	$mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
		// 	$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
		// 	$mail->setText($this->request->post['enquiry']);
		// 	$mail->send();

		// 	$this->response->redirect($this->url->link('information/contact/success'));
		// }


//		$this->data['breadcrumbs'] = array(); // Breadcrumbs for your website. 
//		$this->data['breadcrumbs'][] = array(
//			'text'			=> $this->language->get('text_home'),
//			'href'			=> $this->url->link('common/home'),           
//			'separator'		=> false
//		);
//		$this->data['breadcrumbs'][] = array(
//			'text'			=> $this->language->get('heading_title'),
//			'href'      	=> $this->url->link('information/careers'),
//			'separator' 	=> $this->language->get('text_separator')
//		);   
         
         if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}
 

	if (isset($this->error['Phone'])) {
			$data['error_phone'] = $this->error['Phone'];
		} else {
			$data['error_phone'] = '';
		}
         
         	if (isset($this->error['enquiry'])) {
			$data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$data['error_enquiry'] = '';
		}
        
         
         
      
		$data['button_submit'] = $this->language->get('button_submit');

		// $data['action'] = $this->url->link('information/contact', '', true);
        
        
 		$this->load->model('tool/image');
       if ($this->config->get('config_image')) {
			$data['image'] = $this->model_tool_image->resize($this->config->get('config_image'), $this->config->get($this->config->get('config_theme') . '_image_location_width'), $this->config->get($this->config->get('config_theme') . '_image_location_height'));
		} else {
			$data['image'] = false;
		}
         
         
          $data['telephone'] = $this->config->get('config_telephone');
         
          $data['comment'] = $this->config->get('config_comment');

		if($this->request->post){
			
			if (isset($this->request->post['name'])) {
	         	$data['name'] = $this->request->post['name'];
			} else {
				$data['name'] = $this->customer->getFirstName();
			}
	        if (isset($this->request->post['email'])) {
				$data['email'] = $this->request->post['email'];
			} else {
				$data['email'] = $this->customer->getEmail();
			}
			if (isset($this->request->post['Phone'])) {
				$data['Phone'] = $this->request->post['Phone'];
			} else {
				$data['Phone'] ='';
			}
			if (isset($this->request->post['o-phone'])) {
				$data['o-phone'] = $this->request->post['o-phone'];
			} else {
				$data['o-phone'] ='';
			}
			if (isset($this->request->post['enquiry'])) {
				$data['enquiry'] = $this->request->post['enquiry'];
			} else {
				$data['enquiry'] = '';
			}
			// // here must send the email
			// $mail = new Mail();
			// $mail->protocol = $this->config->get('config_mail_protocol');
			// $mail->parameter = $this->config->get('config_mail_parameter');
			// $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			// $mail->smtp_username = $this->config->get('config_mail_smtp_username');
			// $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			// $mail->smtp_port = $this->config->get('config_mail_smtp_port');
			// $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			// $mail->setTo($this->config->get('config_email'));
			// $mail->setFrom($this->request->post['email']);
			// $mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
			// $mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
			// $mail->setText($this->request->post['enquiry']);
			// $mail->send();
			$this->response->redirect($this->url->link('information/careers/success'));
        } 
         

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');


		// Text from language file
	//	$this->data['heading_title']= $this->language->get('heading_title'); // Get "heading title" from language file. $this->data['something'] will allow you to call for this variable from the template file.
	//	$this->data['text_content']	= $this->language->get('text_content');

		// We call this Fallback system
      if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/careers.tpl')) { // if file exists in your current template folder
         $this->template = $this->config->get('config_template') . '/template/information/careers.tpl'; // get it
      } else {
         $this->template = 'default/template/information/careers.tpl'; // or else get the file from the default folder (this is a fall back folder) always remember to have your template file in the default folder.
      }
      
      $this->children = array( // Required. The children files for the page.
         'common/column_left', // Column left which will allow you to place modules at the left of your page.
         'common/column_right',
         'common/content_top',
         'common/content_bottom',
         'common/footer', // your footer of your website
         'common/header'
      );
         
        $data['button_submit'] = $this->language->get('button_submit');

		$data['action'] = $this->url->link('information/careers', '', true);
		
    //  $this->response->setOutput($this->render()); // Let's display it all!
     $this->response->setOutput($this->load->view('information/careers', $data));

     }
    
    
    public function validate() {
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
			$this->error['enquiry'] = $this->language->get('error_enquiry');
		}


		if ((strlen(utf8_decode($this->request->post['Phone'])) < 3) || (strlen(utf8_decode($this->request->post['Phone'])) > 15) || preg_match('/[^\d]/is', $this->request->post['Phone']) ) {
      		$this->error['Phone'] = $this->language->get('error_phone');
    	}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
			$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}

		return !$this->error;
	}
    
    public function success() {
		$this->load->language('information/careers');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/careers')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_message'] = $this->language->get('text_success');

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/success',$data));

	}
}
?>