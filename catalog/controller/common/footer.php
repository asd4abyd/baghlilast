<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_faq_manager'] = $this->language->get('text_faq_manager');
		$data['faq_manager'] = $this->url->link('information/faq', '', 'SSL');
		$data['faq_manager_status'] = $this->config->get('faq_manager_status');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['tips'] = $this->language->get('tips');
        $data['careers1'] = $this->language->get('careers1');

        $data['WHOLESALE'] = $this->language->get('WHOLESALE');

        $data['text_link'] = $this->language->get('text_link');

        $data['text_quick'] = $this->language->get('text_quick');

        $data['text_follow'] = $this->language->get('text_follow');

        $data['sub'] = $this->language->get('sub');

        $data['e1'] = $this->language->get('e1');

        $data['PAYMENT'] = $this->language->get('PAYMENT');

        $data['METHODS'] = $this->language->get('METHODS');





        

        $data['soci'] = $this->language->get('soci');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
        
        
        $data['tips_advices'] = $this->url->link('information/tipslist', '', true);
        $data['wholsale'] = $this->url->link('information/information&information_id=9', '', true);
        
        $data['careers'] = $this->url->link('information/careers', '', true);


        
         // Updated on 10-04-2017 start here
        $data['sitemap_href'] = $this->url->link('information/sitemap', '', true);
        $data['text_sitemap'] = $this->language->get('text_sitemap');
        $data['lang'] = $this->language->get('code');
        $data['direction'] = $this->language->get('direction');
                
        $data['email_error_login']=$this->language->get('text_email_error_login');
        $data['password_error_login']=$this->language->get('text_password_error_login');
        
        
        $this->load->model('catalog/information');

        $data['informations'] = array();

        foreach ($this->model_catalog_information->getInformationsForBottom() as $result) {
            //if ($result['bottom']) {
                $data['informations'][] = array(
                    'title' => $result['title'],
                    'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
                );
            //}
        }
        
        // Updated on 10-04-2017 end here
        

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}
