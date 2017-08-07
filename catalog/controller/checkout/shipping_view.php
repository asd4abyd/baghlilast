<?php
class ControllerCheckoutShippingView extends Controller {
	public function index() {
		$this->load->language('checkout/checkout');
		$data = array();
		
		$this->load->model('account/address');

		$data['addresses'] = $this->model_account_address->getAddresses();
		
		$this->response->setOutput($this->load->view('checkout/shipping_view', $data));
	}
}