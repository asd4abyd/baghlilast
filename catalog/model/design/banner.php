<?php
class ModelDesignBanner extends Model {
	public function getBanner($banner_id) {
   
		/*$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner b LEFT JOIN " . DB_PREFIX . "banner_image bi ON (b.banner_id = bi.banner_id) WHERE b.banner_id = '" . (int)$banner_id . "' AND b.status = '1' AND bi.language_id = '" . (int)$this->config->get('config_language_id') . "' AND (bi.start_date <= '".date('Y-m-d')."' AND bi.expiry_date >= '".date('Y-m-d')."' AND bi.start_date = NULL AND bi.expiry_date =NULL) ORDER BY bi.sort_order ASC");*/

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner b LEFT JOIN " . DB_PREFIX . "banner_image bi ON (b.banner_id = bi.banner_id) WHERE b.banner_id = '" . (int)$banner_id . "' AND b.status = '1' AND bi.language_id = '" . (int)$this->config->get('config_language_id') . "' AND ( (bi.start_date = '0000-00-00' OR bi.start_date <= '".date('Y-m-d')."') AND ( (bi.expiry_date = '0000-00-00' OR bi.expiry_date >= '".date('Y-m-d')."') )) ORDER BY bi.sort_order ASC");
        
		return $query->rows;
	}
}
