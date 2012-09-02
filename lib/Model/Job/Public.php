<?php
class Model_Job_Public extends Model_Job {
    function init(){
        parent::init();
        $this->addCondition('expires_at','>',date('Y-m-d'));
    }
}
