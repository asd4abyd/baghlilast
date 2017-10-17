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
		$data['text_wholesale'] = $this->language->get('text_wholesale');



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

		//start added by ghole

		// Menu


		// $data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);


		list($eventsLeftId)=$this->model_catalog_category->getMainMenuCategory();

		//if(isset($this->session->data['serviceType'] ) && $this->session->data['serviceType'] =='events'){

		$leftCategoriesList = $this->model_catalog_category->getCategoryChildrenWithProducts([$eventsLeftId]);


		$data['Categories_childern_products']=$leftCategoriesList;



        //end add by ghole
        
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


		$categories0=$categories;

		//print_r($categories0);

		if(count($categories0)){

			foreach($categories0 as &$child1) {

		//	print_r($child1['category_id']);




			$categories1 = $this->model_catalog_category->getCategories($child1['category_id']);// the first children for main category

			//print_r($categories1);

			$tempChildren=[];
			foreach($categories1 as &$child2) {

			//	print_r($child2);

				$tempChildren=array(
					'name'  => $child2['name'] ,
					'href'  => $this->url->link('product/category', 'path=' . $child2['parent_id'] . '_' . $child2['category_id'] . '_' .$child2['category_id']),
					'image' => 'image/'.$child2['image'],
				);

		//		print_r($tempChildren);


			/*___________________________________________*/


					$categories2 = $this->model_catalog_category->getCategories($child2['category_id']);// the second children for main category
				// print_r($categories2);

					$tempChildren2=[];
					foreach($categories2 as &$child3) {
						$tempChildren2=array(
							'name'  => $child3['name'] ,
							'href'  => $this->url->link('product/category', 'path=' . $child3['parent_id'] . '_' . $child3['category_id'] . '_' .$child3['category_id']),
							'image' => 'image/'.$child3['image'],
						);

					//	print_r($tempChildren2);




						$categories3 = $this->model_catalog_category->getCategories($child3['category_id']);// the third children for main category

						$tempChildren3=[];

						foreach($categories3 as &$child4) {
							$tempChildren3=array(
								'name'  => $child4['name'] ,
								'href'  => $this->url->link('product/category', 'path=' . $child4['parent_id'] . '_' . $child4['category_id'] . '_' .$child4['category_id']),
								'image' => 'image/'.$child4['image'],
							);

					//		print_r($tempChildren3);


						}


						$child3['cheldren']=$tempChildren3;
						$tempChildren3[]= array(

						//		'name'     => $child4['name'],
								//'children' => $children_data,
					//			'column'   => $child4['column'] ? $child4['column'] : 1,
					//			'href'     => $this->url->link('product/category', 'path=' . $child4['category_id']),
					//			'image'    => $this->model_tool_image->resize($child4['image'],30,38),33
							);

						;

					}


					$child2['cheldren']=$tempChildren2;
					$tempChildren2[]=array(
						'name'     => $child3['name'],
						//'children' => $children_data,
						'column'   => $child3['column'] ? $child3['column'] : 1,
						'href'     => $this->url->link('product/category', 'path=' . $child3['category_id']),
						'image'    => $this->model_tool_image->resize($child3['image'],30,38),33
					);

			//	print_r($child2['cheldren']);




				/*___________________________________________*/



			}
			$child1['cheldren']=$tempChildren;

			$tempChildren[]=array(
				'name'     => $child2['name'],
				//'children' => $children_data,
				'column'   => $child2['column'] ? $child2['column'] : 1,
				'href'     => $this->url->link('product/category', 'path=' . $child2['category_id']),
				'image'    => $this->model_tool_image->resize($child2['image'],30,38),33
			);


			//print_r($child1['cheldren']);


//			$categories['children'] []= array(
//				'name'  => $child1['name'] ,
//				'href'  => $this->url->link('product/category', 'path=' . $categories0['category_id'] . '_' . $child1['category_id']),
//				'image' => 'image/'.$child1['image'],
//				'children'=>$tempChildren3
//			);
			$tempChildren=[];



		}
		}




	//	function getCheldren

//print_r($categories);

//		foreach ($categories as &$category) {
//
//
//
//          //  print_r($category);
//
//			if ($category['top']) {
//				// Level 2
//			//	$children_data = array();
//
//         //       $children_data22 = array();
//
//                // $data['link111'] = $this->url->link('product/category', 'path=' . $category['category_id']);
//
//				$children = $this->model_catalog_category->getCategories($category['category_id']);
//
//			//	print_r($children);
//
//				foreach ($children as &$child) {
//                    //print_r($child);
//					$filter_data = array(
//						'filter_category_id'  => $child['category_id'],
//						'filter_sub_category' => true
//					);
//
//                 //  print_r($child);
//                //    . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '')
//
//                    $children22 = $this->model_catalog_category->getCategories($child['category_id']);
//
//				//	print_r($children22);
//
//                    $children3=array();
//
//                    foreach ($children22 as $child22) {
//
//                    //   print_r($child22);
//
//					$filter_data22 = array(
//						'filter_category_id22'  => $child22['category_id'],
//						'filter_sub_category22' => true
//					);
//
//                  //  print_r($child);
//                //    . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '')
//
//                        $children3[] = array(
//						'name'  => $child22['name'] ,
//						'href'  => $this->url->link('product/category', 'path=' . $child['parent_id'] . '_' . $child['category_id'] . '_' .$child22['category_id']),
//                        'image' => 'image/'.$child22['image'],
//						);
//
//
//                    }
//
//			//		$children4=array();
//
//
//			//		foreach ($child22 as $child33) {
//
////						   print_r($child33);
//
////						$filter_data22 = array(
////							'filter_category_id22'  => $child33['category_id'],
////							'filter_sub_category22' => true
////						);
//
//						//  print_r($child);
//						//    . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '')
//
////						$children4[] = array(
////							'name'  => $child33['name'] ,
////							'href'  => $this->url->link('product/category', 'path=' . $child['parent_id'] . '_' . $child['category_id'] . '_' .$child33['category_id']),
////							'image' => 'image/'.$child33['image'],
////						);
//
//
////					}
//
//
//					$category['children'] []= array(
//                        'name'  => $child['name'] ,
//                        'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
//                        'image' => 'image/'.$child['image'],
//                        'children'=>$children3
//                    );
//
//
//                }
//
//
//                 $data['categories']=$categories;
//
//				// Level 1
////				$data['categories'][] = array(
////					'name'     => $category['name'],
////					'children' => $children_data,
////					'column'   => $category['column'] ? $category['column'] : 1,
////					'href'     => $this->url->link('product/category', 'path=' . $category['category_id']),
////                    'image'    => $this->model_tool_image->resize($category['image'],30,38),
////                    'brand_categ'=>array($this->model_catalog_manufacturer->getCategoriesManufacrurers($category['category_id'])),
////                //    'man_id'=> $res['manufacturer_id'],
////                    'href1' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $res['manufacturer_id'])
////				);
//			}
//		}
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
		//print_r( $data['categories'] );exit();

		return $this->load->view('common/header', $data);
	}
}
