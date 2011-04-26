<?php
class Model_Category_Active extends Model_Category {
    function init(){
        parent::init();
        $this->addField('job_count')
            ->datatype('int')
            ->calculated(true);
        $this->addCondition('job_count>',0);
    }
    function calculate_job_count(){
        return $this->add('Model_Job_Public')
            ->dsql()
            ->where('j.category_id=c.id')
            ->field('count(*)')
            ->select();
    }
}
