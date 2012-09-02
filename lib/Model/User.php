<?php
/*
   Model class defines structure and behavor of your model. You can re-define number of existing
   functions and add your own functions. 

   */
class Model_User extends Model_Table {
	public $table='user';

	function init(){
		parent::init();

		// Each field can have a varietty of properties. Please
		// referr to FieldDefinition.php file for more information

		$this->addField('email')
			->mandatory(true)
			;

		$this->addField('name')
			;

		$this->addField('surname')
			;

		$this->addfield('gender')
			->type('list')
			->listData(array('M'=>'Male','F'=>'Female'))
			;

		// You can define related tables through
		// $this->addRelatedEntity()
		// see function comments inside Model/Table


		// You can also add relations between fileds
		$this->hasOne('User','manager_id');
	}
}
