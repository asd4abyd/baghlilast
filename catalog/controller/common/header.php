<?php
class ControllerCommonHeader extends Controller {
	public function index() {
        

		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'catalog/view/theme/baghli-arbash/images/logo.png' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
        $data['sign_in'] = $this->language->get('sign_in');
        $data['email'] = $this->language->get('email');



        $data['text_product'] = $this->language->get('text_product');


        $data['brands'] = $this->language->get('brands');

        $data['about'] = $this->language->get('about');


        $data['Contact'] = $this->language->get('Contact');

        $data['cart1'] = $this->language->get('cart1');

        $data['arabic'] = $this->language->get('arabic');


        $data['email'] = $this->language->get('email');


		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
        $data['forgotten'] = $this->url->link('account/forgotten');
        
        $data['email_error_login']=$this->language->get('text_email_error_login');
        $data['password_error_login']=$this->language->get('text_password_error_login');
        $data['stay_sign_in']=$this->language->get('stay_sign_in');
        $data['forget_password_email']=$this->language->get('forget_password_email');
        $data['Dont_have_account']=$this->language->get('Dont_have_account');
        $data['sign_up']=$this->language->get('sign_up');


        //Login
        $data['entry_email'] = $this->language->get('entry_email');
        $data['password'] = $this->language->get('password');
        $data['button_login'] = $this->language->get('button_login');
        $data['email'] = $this->language->get('email');;

        $data['action_login'] = $this->url->link('account/login', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
        $data['forgotten'] = $this->url->link('account/forgotten', '', true);
        $data['brand_link'] = $this->url->link('product/manufacturer', '', true);
        $data['aboutus_link'] = $this->url->link('information/information&information_id=4', '', true);
        $data['contactus_link'] = $this->url->link('information/contact', '', true);

        $data['action_sginUp'] = $this->url->link('account/register', '', true);


        // load manufacturer in header
        $this->load->model('catalog/manufacturer');
      $this->load->model('catalog/product');
        $this->load->model('catalog/category');
        $this->load->model('tool/image');
        
        
        
        if (isset($this->request->get['manufacturer_id'])) {
			$manufacturer_id = (int)$this->request->get['manufacturer_id'];
		} else {
			$manufacturer_id = 0;
		}
       // $id= $this->model_catalog_manufacturer->man_id();
     $data['results1'] = $this->model_catalog_manufacturer->getManufacturers();
    //   print_r ($data['results1']);die();
        //   print_r ( $data['results1']['manufacturer_id']);die();


      //  $data['href'] = $this->url->link('product/manufacturer', 'path=' . $data['results1']['manufacturer_id'] );

        $data['manu'] = array();

        foreach ($data['results1'] as $res) {
          // print_r($res);die();
           // $id= $this->model_catalog_manufacturer->man_id();
            $data['manu'][] = array(
                'name' => $res['name'],
                'image' => $this->model_tool_image->resize($res['image'],38,38),
                //'href' => $this->url->link('product/manufacturer', 'manufacturer_id=' . $res['manufacturer_id'])
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $res['manufacturer_id']),
                'manufacturer_id' =>$res['manufacturer_id'],
                'catem_info'=>array($this->model_catalog_manufacturer->getManufacturerCategories($res['manufacturer_id']))
              //  'brand_categ'=>array($this->model_catalog_manufacturer->getCategoriesManufacrurers())

            );
          

        }
    // $data['brands_info'] = $this->model_catalog_manufacturer->getManufacturers();

        $categoryInManfufacturer=$this->model_catalog_manufacturer->getManufacturerCategories($manufacturer_id);

        
        $data['manufact_category']= $categoryInManfufacturer;
        
        
        
        
        
        
        $data['categ'] = array();
        
         foreach ($data['manufact_category'] as $catem) {
           //  print_r($catem);die();
            $data['categ'][] = array(
                'id' => $catem['category_id'],
                'name' => $catem['name'],
                'image' => $this->model_tool_image->resize($catem['image'],38,38),
                //'href' => $this->url->link('product/manufacturer', 'manufacturer_id=' . $res['manufacturer_id'])
                'href' => $this->url->link('product/category', 'path=' . $catem['category_id']),

            );


        }
    


		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as &$category) {
            
           // print_r($category);
            
			if ($category['top']) {
				// Level 2
				$children_data = array();
                
                $children_data22 = array();


				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as &$child) {
                    //print_r($child);
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true 
					);
                    
                  //  print_r($child);
                //    . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '')

                    $children22 = $this->model_catalog_category->getCategories($child['category_id']);

                    $children3=array();

                    foreach ($children22 as $child22) {

                    //   print_r($child22);

					$filter_data22 = array(
						'filter_category_id22'  => $child22['category_id'],
						'filter_sub_category22' => true
					);

                  //  print_r($child);
                //    . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '')

                        $children3[] = array(
						'name'  => $child22['name'] ,
						'href'  => $this->url->link('product/category', 'path=' . $child['category_id'] . '_' . $child['category_id']),
                        'image' => $child22['image']
					);
                    }

                    $category['children'][]= array(
                        'name'  => $child['name'] ,
                        'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
                        'image' => $child['image'],
                        'children'=>$children3
                    );


                }

				// Level 1
//				$data['categories'][] = array(
//					'name'     => $category['name'],
//					'children' => $children_data,
//					'column'   => $category['column'] ? $category['column'] : 1,
//					'href'     => $this->url->link('product/category', 'path=' . $category['category_id']),
//                    'image'    => $this->model_tool_image->resize($category['image'],30,38),
//                    'brand_categ'=>array($this->model_catalog_manufacturer->getCategoriesManufacrurers($category['category_id'])),
//                //    'man_id'=> $res['manufacturer_id'],
//                    'href1' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $res['manufacturer_id'])
//				);
			}
		}
//print_r($categories);exit();


		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
}
