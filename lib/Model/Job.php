<?php
class Model_Job extends Model_Table {
    public $entity_code='job';
    function init(){
        parent::init();

        $this->addField('category_id')->refModel('Model_Category');
        $this->addField('type');
        $this->addField('company');
        $this->addField('logo');
        $this->addField('url');
        $this->addField('position');
        $this->addField('location');
        $this->addField('description')->datatype('text');
        $this->addField('how_to_apply')->datatype('text');
        $this->addField('is_public')->datatype('boolean');
        $this->addField('is_activated')->datatype('boolean');
        $this->addField('token');
        $this->addField('email');

        $this->addField('created_dts')->datatype('datetime')->system(true);
        $this->addField('updated_dts')->datatype('datetime')->system(true);
        $this->addField('expires_at')->datatype('date')->system(true);
    }
}
