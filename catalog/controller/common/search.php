<?php
class ControllerCommonSearch extends Controller {
	public function index() {
		$this->load->language('common/search');

		$data['text_search'] = $this->language->get('text_search');


		$data['Category'] = $this->language->get('Category');

		$data['Brands'] = $this->language->get('Brands');

		$data['select'] = $this->language->get('select');

        $data['all'] = $this->language->get('all');



        if (isset($this->request->get['search'])) {
			$data['search'] = $this->request->get['search'];
		} else {
			$data['search'] = '';
		}

		return $this->load->view('common/search', $data);
	}
}