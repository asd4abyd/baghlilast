<?php
class ModelAccountWishlist extends Model {
    public function addWishlist() {
        if(isset($_POST['product_id'])){
            $product_id =$_POST['product_id'];
        }else{
            $product_id ='';
        }
        $this->db->query("DELETE FROM " . DB_PREFIX . "customer_wishlist WHERE customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$product_id . "'");

        $this->db->query("INSERT INTO " . DB_PREFIX . "customer_wishlist SET customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', date_added = NOW() ");
    }

    public function deleteWishlist($product_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "customer_wishlist WHERE customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$product_id . "'");
    }

    public function getWishlist($order,$sort) {
        $items = "";
        if(isset($sort)){
            $items = "ORDER BY";
            if($sort == 'name'){
                $items = $items .' oc_product_description.name ' . $order;
                $query = $this->db->query("SELECT DISTINCT oc_product_description.language_id, oc_product_description.name, oc_customer_wishlist.customer_id , oc_customer_wishlist.product_id, oc_customer_wishlist.date_added FROM `oc_customer_wishlist`, oc_product_description WHERE oc_customer_wishlist.product_id = oc_product_description.product_id AND  oc_product_description.language_id='" . (int)$this->config->get('config_language_id') . "'  AND oc_customer_wishlist.customer_id = " . (int)$this->customer->getId() . " " . $items . "");

                return $query->rows;

            }elseif ($sort == 'price') {
                $items = $items .' oc_product.price ' . $order;
                $query = $this->db->query("SELECT  oc_product_description.name, oc_product.price, oc_customer_wishlist.customer_id , oc_customer_wishlist.product_id, oc_customer_wishlist.date_added FROM oc_customer_wishlist, oc_product_description, oc_product WHERE oc_customer_wishlist.product_id = oc_product_description.product_id AND oc_product.product_id = oc_product_description.product_id AND oc_customer_wishlist.customer_id = " . (int)$this->customer->getId() . " " . $items . "");
                return $query->rows;
            }elseif ($sort == 'rating') {
                $items = $items .' oc_review.rating ' . $order;
                $query = $this->db->query("SELECT SUM(oc_review.rating), oc_product_description.name, oc_product.price, oc_customer_wishlist.customer_id ,oc_product_description.product_id , oc_customer_wishlist.product_id, oc_customer_wishlist.date_added FROM oc_customer_wishlist, oc_product_description, oc_product LEFT JOIN oc_review ON  oc_product.product_id= oc_review.product_id  WHERE oc_customer_wishlist.product_id = oc_product_description.product_id AND oc_product.product_id = oc_product_description.product_id AND oc_customer_wishlist.customer_id =" . (int)$this->customer->getId() . " GROUP BY oc_product_description.product_id ORDER BY SUM(oc_review.rating) ".$order." " );
                if(count($query->rows) == 0){
                    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_wishlist WHERE customer_id = " . (int)$this->customer->getId(). "");
                }
                return $query->rows;
            }elseif ($sort == 'selling') {
                $items = $items .' oc_review.rating ' . $order;
                $query = $this->db->query("SELECT COUNT(oc_order_product.order_id), oc_product_description.name, oc_product.price, oc_customer_wishlist.customer_id ,oc_product_description.product_id , oc_customer_wishlist.product_id, oc_customer_wishlist.date_added FROM oc_customer_wishlist, oc_product_description, oc_product LEFT JOIN oc_order_product ON  oc_product.product_id= oc_order_product.product_id  WHERE oc_customer_wishlist.product_id = oc_product_description.product_id AND oc_product.product_id = oc_product_description.product_id AND oc_customer_wishlist.customer_id =" . (int)$this->customer->getId() . " GROUP BY oc_product_description.product_id ORDER BY SUM(oc_order_product.product_id) ".$order."");
                if(count($query->rows) == 0){
                    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_wishlist WHERE customer_id = " . (int)$this->customer->getId(). "");
                }
                return $query->rows;
            }
        }

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_wishlist WHERE customer_id = '" . (int)$this->customer->getId() . "' ORDER BY `customer_id` ".$order.", `product_id` ".$order."   ");

        return $query->rows;
    }

    public function getTotalWishlist() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_wishlist WHERE customer_id = '" . (int)$this->customer->getId() . "'");

        return $query->row['total'];
    }




}