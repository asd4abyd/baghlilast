<?php
class ControllerInformationTipslist extends Controller {
	public function index() {
		$this->load->language('information/tips');

		$this->load->model('catalog/information');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['text_title']=$this->language->get('text_title');

        $data['text_tipslist']=$this->language->get('text_tipslist');


        $this->document->setTitle($data['text_title']);
			//$this->document->setDescription($information_info['meta_description']);
			//$this->document->setKeywords($information_info['meta_keyword']);

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_title'),
				'href' => $this->url->link('information/tipslist')
			);
            
			$data['heading_title'] = $data['text_title'];
            $extension = 'tips';
            $data['extensions'] = array();

            $extension = 'tips';
            $this->load->model('extension/extension');

            $this->load->model('extension/module');
            $this->load->language('extension/module/' . $extension);

            $module_data = array();
        
        
        // Listing all Tips & Advices Start here Created by JIjo on 11-04-2017
        
        if (!isset($this->request->get['module_id'])) {
			


				$modules = $this->model_extension_module->getModulesByCode($extension);
                $extensions = $this->model_extension_extension->getInstalled('module');
        
				foreach ($modules as $module) {
					$module_data[] = array(
						'module_id' => $module['module_id'],
						'name'      => $module['name'],
						'setting'  => $module['setting'],
                        'href'     => $this->url->link('information/tipslist','module_id='.$module['module_id'])
					);
				}
                //$data['modules']=$module_data;
				$data['extensions'][] = array(
					'name'      => $this->language->get('heading_title'),
					'modules'    => $module_data,
					'installed' => in_array($extension, $extensions),
					'lang_id'   => $this->config->get('config_language_id')
				);

        
            $data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('information/tipslist', $data));
        
			
    }      // Listing all Tips & Advices End here Created by JIjo on 11-04-2017
    else      // Detailed Tips & Advices Start here Created by JIjo on 11-04-2017
    {
        $tips_id = (int)$this->request->get['module_id'];
        $modules = $this->model_extension_module->getModulesByCodeId($extension,$tips_id);
                $extensions = $this->model_extension_extension->getInstalled('module');
        foreach ($modules as $module) {
					$module_data[] = array(
						'module_id' => $module['module_id'],
						'name'      => $module['name'],
						'setting'  => $module['setting'],
                        'href'     => $this->url->link('information/tipslist','module_id=',$module['module_id'])
					);
				}
                //$data['modules']=$module_data;
				$data['extensions'][] = array(
					'name'      => $this->language->get('heading_title'),
					'modules'    => $module_data,
					'installed' => in_array($extension, $extensions),
					'lang_id'   => $this->config->get('config_language_id')
				);
        

  
$tips_json_array=json_decode($module['setting']);

foreach($tips_json_array->module_description as $key=>$tips_settings)
{
 if($key==$this->config->get('config_language_id'))
{
        
        	$data['description']=html_entity_decode($tips_settings->description);

}
}

      
            $data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
        
        $this->response->setOutput($this->load->view('information/tip_detailed', $data));
    }
     // Deatailed Tips & Advices Start here Created by JIjo on 11-04-2017
    }
	
}