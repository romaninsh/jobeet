<?php
class page_test extends Page {
    function init(){
        parent::init();

        $this->add('CRUD')->setModel('Category');
        $this->add('CRUD')->setModel('Job');
    }
}
