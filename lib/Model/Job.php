<?php
class Model_Job extends Model_Table {
    public $table='job';
    function init(){
        parent::init();

        $this->hasOne('Category');

        $this->addField('type')
            ->display(array('form'=>'radio'))
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

        $this->add('filestore/Field_Image','logo') ;

        $this->addField('url')
            ->caption('URL')
            ->mandatory(true)
            ;

        $this->addField('position')
            ->mandatory(true)
            ;

        $this->addField('location')
            ->mandatory(true)
            ;

        $this->addField('description')
            ->type('text')
            ->mandatory(true)
            ;

        $this->addField('how_to_apply')
            ->type('text')
            ->mandatory(true)
            ;

        $this->addField('is_public')
            ->type('boolean')
            ->caption('Public?')
            ;

        $this->addField('is_activated')
            ->type('boolean')
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
            ->type('datetime')
            ->system(true)
            ;

        $this->addField('updated_dts')
            ->type('datetime')
            ->system(true)
            ;

        $this->addField('expires_at')
            ->type('date')
            ->system(true)
            ;

        $this->addHook('beforeSave',$this);
    }
    function beforeSave(){
        $this['expires_at']=date('Y-m-d',strtotime('+'.$this->api->getConfig('job/expires','30 days')));
        $this['token']=sha1($this['email'].rand(11111, 99999));

        if(!filter_var($this['url'],FILTER_VALIDATE_URL,FILTER_FLAG_SCHEME_REQUIRED)){
            throw $this->exception('Wrong URL','ValidityCheck');
        }

    }
}
