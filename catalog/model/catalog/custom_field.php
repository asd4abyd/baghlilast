<?php
class ModelCatalogCustomField extends Model {

	public static  $languages=[];
 public static $customFields=array();

	public function fixRequest($requestArray){

		//$this->convertCustomFieldsArrayToOneName($requestArray);
		$this->convertOneNameToCustomFieldsArray($requestArray);


return $requestArray;
        
	}


	public function setLanguages()
	{


			$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "language`  ");

			if ($query->rows) {
				foreach ($query->rows as $language) {
					self::$languages[$language['language_id']]=explode('-',$language['code'])[0];
				}
			}

	}
	public function getLanguages()
	{

		if (self::$languages == []) {
			$this->setLanguages();
		}

		return self::$languages;

	}

	public function getEnLanuguageId(){
		return array_search('en',$this->getLanguages());
	}



	public function setOptions(){

		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "custom_field_description`  where language_id='".$this->getEnLanuguageId()."'");
		$customFields=[];
		if ($query->rows) {
			foreach ($query->rows as $option) {
				$customFields[$option['custom_field_id']]=[
					'name'=>$option['name'],
					'alias'=>strtolower(preg_replace(['/[^a-zA-Z0-9]/'],'',$option['name'])),

				];
			}
		}




		self::$customFields= $customFields;

	}



	public function getCustomFields(){
		if(count(self::$customFields) ==0 ){
			$this->setOptions();
		}

		return self::$customFields;

	}

	public function convertCustomFieldsArrayToOneName(&$requestArray){
		$originCustomFields=$this->getCustomFields();
		if(isset($requestArray['custom_field']) && is_array($requestArray['custom_field'])){

			foreach($requestArray['custom_field'] as $custom_field_id=>$value){
				if(isset($originCustomFields[$custom_field_id])){
					$requestArray[$custom_field_id[$custom_field_id]['alias']]=$value;
				}
			}

		}

	}

	public function convertOneNameToCustomFieldsArray(&$requestArray){
		$originCustomFields=$this->getCustomFields();
			foreach($originCustomFields as  $custom_field_id=>$value){
				if(isset($requestArray[$value['alias']])){
					$requestArray['custom_field'][$custom_field_id]=$requestArray[$value['alias']];
				}
			}

	}


}