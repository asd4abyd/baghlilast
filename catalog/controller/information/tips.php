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
		
			$this->document->setTitle($data['text_title']);
			//$this->document->setDescription($information_info['meta_description']);
			//$this->document->setKeywords($information_info['meta_keyword']);

			$data['breadcrumbs'][] = array(
				'text' => $information_info['title'],
				'href' => $this->url->link('information/tipslist')
			);

			$data['heading_title'] = $data['text_title'];

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('information/tipslist', $data));
        
			}

	
}