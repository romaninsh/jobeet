<?php
class CategoryJobs extends View {
    public $jobs=null;
    function setCategoryData($category){
        $p=$this;

        //$p->add('Text',null,'Category')
        $this->template->set('Category',$category['name']." (".$category['job_count'].')');

        $this->jobs=$p->add('JobList');
        $this->jobs->setModel('Job_Public',array('location','position','company'))
            ->addCondition('category_id',$category['id']);
        $this->jobs->addFormatter('company','link');
        return $this;
    }
    function defaultTemplate(){
        return array('view/category_jobs');
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
                    $this->api->url('job/'.$page,array('name'=>null)).
                    '">'.$this->current_row[$field].'</a>';
    }
}
