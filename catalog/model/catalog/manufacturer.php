<?php
class ModelCatalogManufacturer extends Model {
	public function getManufacturer($manufacturer_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) WHERE m.manufacturer_id = '" . (int)$manufacturer_id . "' AND m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		return $query->row;
	}



	public function search ($search,$manufacturer_id) { 

$query=$this->db->query("SELECT oc_product_to_category.category_id As category_id, DISTINCT oc_stock_status.language_id, oc_stock_status.name AS stock_status ,oc_stock_status.stock_status_id ,oc_product_special.price AS special, oc_product.minimum , oc_product.price, oc_product.viewed, oc_product.tax_class_id, oc_product_description.name, oc_product.product_id , oc_product.manufacturer_id ,oc_product.image FROM oc_product_to_category , oc_review,oc_product, oc_product_description ,oc_product_special, oc_stock_status WHERE oc_product_to_category.product_id = oc_product.product_id , oc_product.product_id = oc_product_description.product_id AND  oc_stock_status.stock_status_id=oc_product.stock_status_id AND oc_stock_status.language_id= " . (int)$this->config->get('config_language_id') ."                       AND
oc_product.product_id= oc_product_special.product_id AND EXISTS(SELECT DISTINCT MAX(oc_review.rating)As rating, oc_review.product_id FROM oc_review WHERE oc_product.product_id= oc_review.product_id )AND
oc_product.manufacturer_id= ".$manufacturer_id." AND oc_product_description.name LIKE '%".$search."%'");
return $query->rows;


	}
   

    
    // Added by assem to insert categories inside brands imenu in header 
    
    
    
    public function getManufacturerCategories($manufacturer_id) {
    $query = $this->db->query("
        SELECT 
        DISTINCT c.category_id,cd.name,c.image
        FROM
        ". DB_PREFIX . "manufacturer m 
        LEFT JOIN ". DB_PREFIX. "product p ON (m.manufacturer_id = p.manufacturer_id)
        LEFT JOIN ". DB_PREFIX. "product_to_category p2c ON (p2c.product_id = p.product_id)
        LEFT JOIN ". DB_PREFIX. "category c ON (c.category_id = p2c.category_id)
        LEFT JOIN ". DB_PREFIX. "category_description cd ON (cd.category_id = p2c.category_id)
        WHERE
        p.status = 1
        AND m.manufacturer_id = '".(int)$manufacturer_id."'
        AND c.status= 1  AND cd.language_id =  '". (int)$this->config->get('config_language_id') ."'
        ");

    return $query->rows;
}

      
    
     public function getCategoriesManufacrurers($category_id) {
   $query = $this->db->query("SELECT m.* 
        FROM " . DB_PREFIX . "product p 
        RIGHT JOIN " . DB_PREFIX . "product_to_category p2c ON 
            p.product_id = p2c.product_id 
        LEFT JOIN " . DB_PREFIX . "manufacturer m ON 
            p.manufacturer_id = m.manufacturer_id
        WHERE 
            p2c.category_id = " . (int)$category_id . " AND 
            m.manufacturer_id IS NOT NULL
        GROUP BY m.manufacturer_id");
    return $query->rows;
}
    
    // Added by assem to insert categories inside brands imenu in header 



	public function getManufacturers($data = array() ) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

			$sort_data = array(
				'name',
				'sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY name";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}

			$query = $this->db->query($sql);

			return $query->rows;

			
		
		}else {
			$manufacturer_data = $this->cache->get('manufacturer.' . (int)$this->config->get('config_store_id'));

			if (!$manufacturer_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY name");

				$manufacturer_data = $query->rows;

				$this->cache->set('manufacturer.' . (int)$this->config->get('config_store_id'), $manufacturer_data);
			}

			return $manufacturer_data;
		}
	}
    
    
   

}