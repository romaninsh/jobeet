<?php
class Model_Category extends Model_Table {
    public $entity_code='category';
    function init(){
        parent::init();

        $this->addField('name');
    }
}
