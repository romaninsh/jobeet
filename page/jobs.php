<?php
class page_jobs extends Page {
    function initMainPage(){
        $p=$this;

        $categories=$this->add('Model_Category_Active');

        foreach($categories as $category){
            $p->add('H3')->set($category['name'].' ('.$category['job_count'].')');
            $jobs = $p->add('JobList');
            $jobs->setModel('Job_Public',array('location','position','company'))
                ->addCondition('category_id',$category['id']);
            $jobs->addFormatter('company','link');
            $jobs->dq->limit(10);
            if($category['job_count']>10){
                $this->add('Button')->setLabel('Show More');
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
        $v->add('Button',null,'Buttons')->setLabel('Edit')->js('click')->univ()->alert('TODO');
        $this->api->template->trySet('page_title',
                sprintf('%s is looking for %s',$m->get('company'),$m->get('position')));
    }
    function defaultTemplate(){
        return array('page/jobs');
    }
}
class JobList extends Grid {
    function format_link($field){

        $parts=array(
                $this->current_row['location'],
                $this->current_row['company'],
                $this->current_row['id'],
                $this->current_row['position'],
                );

        $parts=preg_replace('/[^a-zA-Z 0-9-]/','',$parts);
        $parts=preg_replace('/^$/','-',$parts);
        $parts=str_replace(' ','_',$parts);
        $page=implode('/',$parts);

        $this->current_row_html[$field]='<a href="'.
                    $this->api->getDestinationURL('job/'.$page).
                    '">'.$this->current_row[$field].'</a>';
    }
}
