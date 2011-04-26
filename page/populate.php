<?php
class page_populate extends Page {
    function init(){
        parent::init();

        $category_id=$this->add('Model_Category')
            ->set('name','Category '.rand(10,99))
            ->update();

        $m=$this->add('Model_Job');
        for($i=0;$i<30;$i++){
            $m->unloadData();
            $m->set(array(
                        'category_id'=>$category_id,
                        'company'=>'Company '.$i,
                        'position'=>'Web Developer',
                        'location'=>'London, UK',
                        'description'=>'Lorem ipsum dolor sit amet, consectetur adipisicing elit',
                        'how_to_apply'=>'Send your resume to lorem.ipsum [at] company_'.$i,
                        'is_public'=>true,
                        'is_activated'=>true,
                        'email'=>'job@example.com'
                        ));
            $m->update();
        }
        echo "Done";
        exit;
    }
}
