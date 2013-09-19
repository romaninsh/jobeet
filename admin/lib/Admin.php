<?php

class Admin extends ApiFrontend {

    function init() {
        parent::init();
        $this->dbConnect();
        $l = $this->addLocation('..', array(
                    'addons' => 'atk4-addons',
                    'php' => 'lib'
                ));

        $this->add('jUI');

        $this->js()
            ->_load('ui.atk4_notify')
            ->_load('atk4_univ')
        ;

        $this->add('BasicAuth')
            ->allow('admin', 'admin')
            ->check();

        $m = $this->add('Menu', null, 'Menu');
        $m->addMenuItem('jobs');
        $m->addMenuItem('filestore');
        $m->addMenuItem('logout');
    }
    function page_index($p) {
        $tabs=$p->add('Tabs');
        $p=$tabs->addTab('Jobs');

        $crud=$p->add('CRUD');
        $crud->setModel('Job_Admin',null,array('id','category','type','company','position','location',
                    'is_public','is_activated','expires_at','email'));
        if($crud->grid){
            $crud->grid->add('Paginator');
            $crud->grid->getColumn('type')->makeSortable();
            $crud->grid->getColumn('location')->makeSortable();
            $crud->grid->dq->field('description');
            $crud->grid->addColumn('button','extend');
            if($_GET['extend']){
                $new_expires=$crud->grid->getModel()->tryLoad($_GET['extend'])
                    ->extend()->get('expires_at');
                $new_expires=date($this->api->getConfig('locale/date','d/m/Y'),
                                        strtotime($new_expires));

                $crud->grid->js(null,$crud->grid->js()->univ()->successMessage('Extended job #'.
                            $_GET['extend'].' till '.$new_expires))->reload()->execute();
            }
            $crud->grid->addQuickSearch(array('company','position','location','description'));
            $action_form=$crud->add('Form',null,null,array('form_empty'));
            $ids=$action_form->addField('hidden','ids');
            $crud->grid->addSelectable($ids);
            $d=$action_form->addSubmit('Delete Selected');
            $e=$action_form->addSubmit('Extend Selected');
            $action_form->onSubmit(function($f) use ($crud,$d){
                $ids=json_decode($f->get('ids'));
                //$m=$crud->grid->getModel()->dsql(null,false)->where('id in',$ids)->do_delete();
                var_Dump($d->isClicked());
                exit;
                return $f->js(null,$crud->grid->js()->reload())
                    ->univ()->successMessage('Success');
            });
        }

        $p=$tabs->addTab('Categories')->add('CRUD')->setModel('Category');
    }

}
