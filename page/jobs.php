<?php
class page_jobs extends Page {
    function initMainPage(){
        parent::init();
        $p=$this;

        $categories=$this->add('Model_Category_Active')->getRows();

        foreach($categories as $category){
            $cj=$this->add('CategoryJobs')->setCategoryData($category);
            $cj->jobs->dq->limit(10);
            if($category['job_count']>10){
                $category['job_count']-=10;
                $cj->template->set($category);

                $cj->template->set('url',
                        $this->api->getDestinationURL('category/'.
                            $category['name']));
            }else{
                $cj->template->del('more_link');
            }
        }
        //$jobs->addButton('Post a Job');

    }
    function page_details(){
        $v=$this->add('View',null,null,array('view/job_details'));
        $m=$v->setModel('Job_Public')->loadData($_GET['id']);
        $v->template->del('has_logo');
        $v->add('Button',null,'Buttons')->setLabel('Back')->js('click')->univ()->location(
            $this->api->getDestinationURL('..'));
        $v->add('Button',null,'Buttons')->setLabel('Edit');
        $this->api->template->trySet('page_title',
                sprintf('%s is looking for %s',$m->get('company'),$m->get('position')));
    }
    function defaultTemplate(){
        return array('page/jobs');
    }
}
