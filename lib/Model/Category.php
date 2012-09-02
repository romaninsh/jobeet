<?php
class Model_Category extends Model_Table {
    public $table='category';
    function init(){
        parent::init();

        $this->addField('name');
    }
}
