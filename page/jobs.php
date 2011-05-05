<?php
class page_jobs extends Page {
    function init(){
        parent::init();
        $this->api->stickyGET('token');
    }
    function initMainPage(){
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
        $this->api->template->trySet('page_title',
                sprintf('%s is looking for %s',$m->get('company'),$m->get('position')));
    }
    function jobEditPage($token=null){
        $m=$this->add('Model_Job_Public');

        // Load data if token is specified
        if($token){
            $row=$m->getBy('token',$token);
            if(!$row)throw $this->exception('Invalid token');
            $m->loadData($row['id']);
        }

        $f=$this->add('MVCForm');
        $f->setModel($m);
        $f->onSubmit(function($f){
            if(strlen($f->get('company'))<5){
                throw $f->exception('Company name is too short')->setField('company');
            }
            $f->update();
            return $f->js()->univ()->location($f->api->getDestinationURL('../preview',
                    array('token'=>$f->getController()->get('token'))));
        });
    }
    function page_edit(){
        return $this->jobEditPage($_GET['token']);
    }
    function page_new(){
        $this->api->stickyForget('token');
        return $this->jobEditPage();
    }
    function page_preview(){
        $m=$this->add('Model_Job_Public');

        // Load token data
        $row=$m->getBy('token',$_GET['token']);
        if(!$row)throw $this->exception('Invalid token');
        $m->loadData($row['id']);

        $v=$this->add('View',null,null,array('view/job_details'));
        $v->setModel($m);

        $v->add('Button',null,'Buttons')->setLabel('Edit')->js('click')->univ()->location(
            $this->api->getDestinationURL('../edit'));

        if($v->add('Button',null,'Buttons')->setLabel('Publish')->isClicked('Are you sure?')){
            $m->set('is_public',true)->update();

            $parts=array(
                    $m->get('location'),
                    $m->get('company'),
                    $m->get('id'),
                    $m->get('position'),
                    );

            $parts=preg_replace('/[^a-zA-Z 0-9-]/','',$parts);
            $parts=preg_replace('/^$/','-',$parts);
            $parts=str_replace(' ','_',$parts);
            $page=implode('/',$parts);

            $this->js()->univ()->location($this->api->getDestinationURL(
                        'job/'.$page,array('token'=>false)))->execute();
        }
    }
    function defaultTemplate(){
        return array('page/jobs');
    }
}
