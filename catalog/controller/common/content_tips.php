<?php
class ControllerCommonContentTips extends Controller {
	public function index() {
		$this->load->model('design/layout');

		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'common/home';
		}

		$layout_id = 0;

		if ($route == 'product/category' && isset($this->request->get['path'])) {
			$this->load->model('catalog/category');

			$path = explode('_', (string)$this->request->get['path']);

			$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));
		}

		if ($route == 'product/product' && isset($this->request->get['product_id'])) {
			$this->load->model('catalog/product');

			$layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
		}

		if ($route == 'information/information' && isset($this->request->get['information_id'])) {
			$this->load->model('catalog/information');

			$layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
		}

		if (!$layout_id) {
			$layout_id = $this->model_design_layout->getLayout($route);
		}

		if (!$layout_id) {
			$layout_id = $this->config->get('config_layout_id');
		}

                $data['extensions'] = array();

        		$extension = 'tips';
                $this->load->model('extension/extension');

		        $this->load->model('extension/module');
				$this->load->language('extension/module/' . $extension);
                $this->load->language('common/tips_advice');
                $data['tips_advice'] = $this->language->get('tips_advice');
                $data['headline'] = $this->language->get('headline');
                $data['viewAll'] = $this->language->get('viewAll');






        $module_data = array();

				$modules = $this->model_extension_module->getModulesByCode($extension);
                $extensions = $this->model_extension_extension->getInstalled('module');
        
				foreach ($modules as $module) {
					$module_data[] = array(
						'module_id' => $module['module_id'],
						'name'      => $module['name'],
						'setting'  => $module['setting']
					);
				}
                //$data['modules']=$module_data;
				$data['extensions'][] = array(
					'name'      => $this->language->get('heading_title'),
					'modules'    => $module_data,
					'installed' => in_array($extension, $extensions),
					'lang_id'   => $this->config->get('config_language_id')
				);
        
        //echo '<pre>';
        //print_r($modules);
        
        $data['view_all_href']= $this->url->link('information/tipslist');
        
		return $this->load->view('common/tips_advice', $data);
	}
}