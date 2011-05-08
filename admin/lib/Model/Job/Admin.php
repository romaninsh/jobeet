<?php
class Model_Job_Admin extends Model_Job {
    function extend($ids=null){
        if($ids){
            foreach($ids as $id){
                $this->loadData($id);
                $this->extend();
            }
            return $this;
        }
        $this->set('expires_at',date('Y-m-d',
                    strtotime('1 month',strtotime(
                            $this->get('expires_at')))
                    ));
        $this->update();
        return $this;
    }
}
