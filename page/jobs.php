<?php
class page_jobs extends Page {
    function page_index(){
        $p=$this;

        $jobs = $this->add('Grid');
        $jobs->setModel('Job',array('location','position','company'));
        $jobs->addQuickSearch(array('location','position'));
        $jobs->addButton('Post a Job');

        $jobs->addFormatter('company','link');
    }
    function page_company(){
        $v=$this->add('View',null,null,array('view/job_details'));
        $m=$v->setModel('Job')->tryLoad($_GET['id']);
        $v->template->del('has_logo');
        $v->add('Button',null,'Buttons')->setLabel('Back')->js('click')->univ()->location(
            $this->api->url('..'));
        $v->add('Button',null,'Buttons')->setLabel('Edit')->js('click')->univ()->alert('TODO');
        $this->api->template->trySet('page_title',
                sprintf('%s is looking for %s',$m->get('company'),$m->get('position')));
    }
    function defaultTemplate(){
        return array('page/jobs');
    }
}
