<?php
/*
   Commonly you would want to re-define ApiFrontend for your own application.
 */
class Frontend extends ApiFrontend {
	function init(){
		parent::init();
		// Keep this if you are going to use database on all pages
		$this->dbConnect();

		// This will add some resources from atk4-addons, which would be located
        // in atk4-addons subdirectory.
		$this->addLocation('atk4-addons',array(
					'php'=>array(
                        'mvc',
						'misc/lib',
						)
					))
			->setParent($this->pathfinder->base_location);

		// A lot of the functionality in Agile Toolkit requires jUI
		$this->add('jUI');

		// Initialize any system-wide javascript libraries here
        // If you are willing to write custom JavaScritp code,
        // place it into templates/js/atk4_univ_ext.js and
        // include it here
		$this->js()
			->_load('atk4_univ')
			// ->_load('ui.atk4_expander')
			;


		// If you are using a complex menu, you can re-define
		// it and place in a separate class
		$m=$this->add('Menu',null,'Menu');
		$m->addMenuItem('jobs');
		$m->addMenuItem('test');

	}

	function page_index($p){
        $this->redirect('jobs');
	}
}
