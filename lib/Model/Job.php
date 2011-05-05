<?php
class Model_Job extends Model_Table {
    public $entity_code='job';
    public $table_alias='j';
    function init(){
        parent::init();

        $this->addField('category_id')
            ->refModel('Model_Category')
            ->caption('Category')
            ;

        $this->addField('type')
            ->datatype('radio')
            ->listData(array(
                        'full-time'=>'Full Time',
                        'part-time'=>'Part Time',
                        'freelance'=>'Freelance',
                        ))
            ->defaultValue('full-time')
            ;

        $this->addField('company')
            ->mandatory(true)
            ;

        $this->addField('logo')
            ->refModel('Model_Filestore_File')
            ->displaytype('file')
            ;

        $this->addField('url')
            ->caption('URL')
            ->mandatory(true)
            ->validate(function($val){
                if(!filter_var($val,FILTER_VALIDATE_URL,FILTER_FLAG_SCHEME_REQUIRED)){
                    return 'Wrong URL';
                }
            })
            ;

        $this->addField('position')
            ->mandatory(true)
            ;

        $this->addField('location')
            ->mandatory(true)
            ;

        $this->addField('description')
            ->datatype('text')
            ->mandatory(true)
            ;

        $this->addField('how_to_apply')
            ->datatype('text')
            ->mandatory(true)
            ;

        $this->addField('is_public')
            ->datatype('boolean')
            ->caption('Public?')
            ;

        $this->addField('is_activated')
            ->datatype('boolean')
            ->system(true)
            ;

        $this->addField('email')
            ->mandatory(true)
            ;

        // System fields
        $this->addField('token')
            ->system(true)
            ;

        $this->addField('created_dts')
            ->datatype('datetime')
            ->system(true)
            ;

        $this->addField('updated_dts')
            ->datatype('datetime')
            ->system(true)
            ;

        $this->addField('expires_at')
            ->datatype('date')
            ->system(true)
            ;
    }
    function beforeInsert(&$data){
        parent::beforeInsert($data);
        $data['expires_at']=date('Y-m-d',strtotime('+'.$this->api->getConfig('job/expires','30 days')));
        $data['token']=sha1($data['email'].rand(11111, 99999));
    }
}
