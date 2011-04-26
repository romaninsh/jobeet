<?php
class Model_Category extends Model_Table {
    public $entity_code='category';
    public $table_alias='c';
    function init(){
        parent::init();

        $this->addField('name');
    }
}
