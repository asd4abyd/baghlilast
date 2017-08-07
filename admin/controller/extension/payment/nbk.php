<?php 

class ControllerExtensionPaymentNBK extends Controller {

	private $error = array();

	public function index() {
	
		$this->load->language('extension/payment/nbk');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('nbk', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['entry_access_key'] = $this->language->get('entry_access_key');
		$data['entry_profile_id'] = $this->language->get('entry_profile_id');
		$data['entry_secret_key'] = $this->language->get('entry_secret_key');
		$data['entry_mode'] = $this->language->get('entry_mode');
		//$this->data['entry_ak'] = $this->language->get('entry_ak');
		$data['entry_status'] = $this->language->get('entry_status');		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_test'] = $this->language->get('text_test');
		$data['text_live'] = $this->language->get('text_live');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

  		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

 		if (isset($this->error['access_key'])) {
			$data['error_access_key'] = $this->error['access_key'];
		} else {
			$data['error_access_key'] = '';
		}
		
		if (isset($this->error['profile_id'])) {
			$data['error_profile_id'] = $this->error['profile_id'];
		} else {
			$data['error_profile_id'] = '';
		}
		
		if (isset($this->error['secret_key'])) {
			$data['error_secret_key'] = $this->error['secret_key'];
		} else {
			$data['error_secret_key'] = '';
		}
		
//		if (isset($this->error['ak'])) {
//			$this->data['error_ak'] = $this->error['ak'];
//		} else {
//			$this->data['error_ak'] = '';
//		}

  		$data['breadcrumbs'] = array();
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/payment/nbk', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);				

		$data['action'] = $this->url->link('extension/payment/nbk', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');		

		if (isset($this->request->post['nbk_access_key'])) {
			$data['nbk_access_key'] = $this->request->post['nbk_access_key'];
		} else {
			$data['nbk_access_key'] = $this->config->get('nbk_access_key');
		}
		
		if (isset($this->request->post['nbk_profile_id'])) {
			$data['nbk_profile_id'] = $this->request->post['nbk_profile_id'];
		} else {
			$data['nbk_profile_id'] = $this->config->get('nbk_profile_id');
		}
		
		if (isset($this->request->post['nbk_secret_key'])) {
			$data['nbk_secret_key'] = $this->request->post['nbk_secret_key'];
		} else {
			$data['nbk_secret_key'] = $this->config->get('nbk_secret_key');
		}
		
		/*if (isset($this->request->post['nbk_ak'])) {
			$data['nbk_ak'] = $this->request->post['nbk_ak'];
		} else {
			$data['nbk_ak'] = $this->config->get('nbk_ak');
		}*/
		
		if (isset($this->request->post['nbk_status'])) {
			$data['nbk_status'] = $this->request->post['nbk_status'];
		} else {
			$data['nbk_status'] = $this->config->get('nbk_status');
		}

		if (isset($this->request->post['nbk_mode'])) {
			$data['nbk_mode'] = $this->request->post['nbk_mode'];
		} else {
			$data['nbk_mode'] = $this->config->get('nbk_mode');
		}

		$data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');


        $this->response->setOutput($this->load->view('extension/payment/nbk.tpl', $data));

		/*$this->template = 'payment/nbk.tpl';

		$this->children = array(
			'common/header',
			'common/footer'
		);				

		$this->response->setOutput($this->render());*/
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/nbk')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}		

		if (!$this->request->post['nbk_access_key']) {
			$this->error['access_key'] = $this->language->get('error_access_key');
		}
		
		if (!$this->request->post['nbk_profile_id']) {
			$this->error['profile_id'] = $this->language->get('error_profile_id');
		}
		
		if (!$this->request->post['nbk_secret_key']) {
			$this->error['secret_key'] = $this->language->get('error_secret_key');
		}
		
		/*if (!$this->request->post['nbk_ak']) {
			$this->error['ak'] = $this->language->get('error_ak');
		}*/

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}

?>