<?php

namespace app\admin\model;

use think\Model;

class User extends Model
{
    // 表名
    protected $table = 'user';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'sex_text'
    ];
    

    
    public function getSexList()
    {
        return ['女' => __('女'),'男' => __('男')];
    }     


    public function getSexTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['sex']) ? $data['sex'] : '');
        $valueArr = explode(',', $value);
        $list = $this->getSexList();
        return implode(',', array_intersect_key($list, array_flip($valueArr)));
    }

    protected function setSexAttr($value)
    {
        return is_array($value) ? implode(',', $value) : $value;
    }


}
