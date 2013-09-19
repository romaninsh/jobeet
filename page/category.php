<?php
class page_category extends Page {
    function init(){
        parent::init();
        $p=$this;

        $category=$this->add('Model_Category_Active')->getBy('name',$_GET['name']);

        $this->api->stickyGET('name');
        $cj=$this->add('CategoryJobs')->setCategoryData($category);
        $cj->jobs->add('Paginator')->ipp(20);
        $cj->template->tryDel('more_link');
    }
}
