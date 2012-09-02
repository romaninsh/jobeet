<?php
class Model_Category_Active extends Model_Category {
    function init(){
        parent::init();

        $this->hasMany('Job_Public');

        $this->addExpression('job_count')
            ->datatype('int')
            ->set(function($m){
                return $m->refSQL('Job_Public')->count();
            });
        $this->addCondition('job_count','>',0);
    }
}
