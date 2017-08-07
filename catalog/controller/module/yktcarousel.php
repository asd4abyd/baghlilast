<?php
class ControllerModuleYktcarousel extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		// carousel setting
		if($setting['count_item'] > 0) {
			$data['count_item'] = $setting['count_item'];
		} else {
			$data['count_item'] = 1;
		}

		if($setting['single'] > 0) {
			$data['single'] = $setting['single'];
		} else {
			$data['single'] = 0;
		}

		if($setting['autoplay'] > 0) {
			$data['autoplay'] = $setting['autoplay'];
		} else {
			$data['autoplay'] = 0;
		}

		if($setting['navigation'] == true) {
			$data['navigation'] = $setting['navigation'];
		} else {
			$data['navigation'] = false;
		}

		if($setting['responsive'] == true) {
			$data['responsive'] = $setting['responsive'];
		} else {
			$data['responsive'] = false;
		}

		if($setting['pagin'] == true) {
			$data['pagin'] = $setting['pagin'];
		} else {
			$data['pagin'] = false;
		}
		
		// carousel text
		$data['yktcarousel'] = array();

		foreach($setting['slider_text'] as $key => $row) {
			$data['yktcarousel'][] = $row;
		}

		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/yktcarousel.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/yktcarousel.tpl', $data);
		} else {
			return $this->load->view('default/template/module/yktcarousel.tpl', $data);
		}
	}
}