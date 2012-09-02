<?php
class Model_Job extends Model_Table {
    public $table='job';
    function init(){
        parent::init();

        $this->hasOne('Category');
        $this->addField('type');
        $this->addField('company');
        $this->addField('logo');
        $this->addField('url');
        $this->addField('position');
        $this->addField('location');
        $this->addField('description')->type('text');
        $this->addField('how_to_apply')->type('text');
        $this->addField('is_public')->type('boolean');
        $this->addField('is_activated')->type('boolean');
        $this->addField('token');
        $this->addField('email');

        $this->addField('created_dts')->type('datetime')->system(true);
        $this->addField('updated_dts')->type('datetime')->system(true);
        $this->addField('expires_at')->type('date')->system(true);
    }
}
