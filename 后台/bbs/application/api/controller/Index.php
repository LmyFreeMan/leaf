<?php

namespace app\api\controller;
ini_set('date.timezone','Asia/Shanghai');
use app\common\controller\Api;
use think\Db;
/**
 * 首页接口
 */
class Index extends Api
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];

    /**
     * 首页
     * 
     */

    public function index()
    {

        $r=Db::table('ownner')->where('schoolnum',$_POST['schoolnum'])->find();
            if($_POST['gender']==1)
                $_POST['gender']='男';
            else$_POST['gender']='女';
            $data = ['name' => $_POST['name'],
                'sex' => $_POST['gender'],
                'schoolnum'=>$_POST['schoolnum'],
                'image'=>$_POST['image'],
                'password'=>$_POST['password'],
                'openid'=>$_POST['openid'],
                't'=>date("Y-m-d H:i:s")
            ];
        if(!$r)
            Db::table('ownner')->insert($data);
           Db::table('user')->insert($data);

    }
    public function  resou()
    {

        $r=Db::table('content')->where(['type'=>'昵称表白'])->order(['zanshu'=>'desc'])->limit(1)->select();
        $s=Db::table('ownner')->where('schoolnum',$r[0]['schoolnum'])->find();
        $r['image']=$s['image'];
        print_r(json_encode($r));
    }
    public  function  getopenid()
    {


        $appid = "wx77e7bb9328243dbc";
        $secret = "ba57dce90c0e510b7e65da9fe0c061e3";

        $url="https://api.weixin.qq.com/sns/jscode2session?appid=".$appid."&secret=".$secret."&js_code=".$_GET['code']."&grant_type=authorization_code";

        $postUrl = $url;

        $ch = curl_init();//初始化curl
        curl_setopt($ch, CURLOPT_URL,$postUrl);//抓取指定网页
        curl_setopt($ch, CURLOPT_HEADER, 0);//设置header
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);//要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $data = curl_exec($ch);//运行curl
        curl_close($ch);
        //  var_dump($data);
        print_r($data);

    }
    public  function vt()
    {
//        $appid = "wx038026e857746120";
//        $secret = "4fe7fd12a867170ccc93f4f2db64982d";

        $url="http://www.webc.top/Point/ConfirmStudent?PointXH=".$_POST['username']."&PointPsw=".$_POST['password'];

        $postUrl = $url;

        $ch = curl_init();//初始化curl
        curl_setopt($ch, CURLOPT_URL,$postUrl);//抓取指定网页
        curl_setopt($ch, CURLOPT_HEADER, 0);//设置header
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);//要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $data = curl_exec($ch);//运行curl
        curl_close($ch);
        //  var_dump($data);
        print_r($data);
    }

    public  function  addfile()
    {
        var_dump($_POST);

        var_dump($_FILES['file']['tmp_name']);
        $date=date("Ymd");
        $dir = iconv("UTF-8", "GBK", '../public/uploads/'.$date);
        if (!file_exists($dir)){
            mkdir ($dir,0777,true);
        }
        $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
        $orderSn = $yCode[intval(date('Y')) - 2011] . strtoupper(dechex(date('m'))) . date('d') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('%02d', rand(0, 99));
         print_r($orderSn);
      move_uploaded_file($_FILES['file']['tmp_name'],'../public/uploads/'.$date.'/'.$orderSn.'.png');

      $data = [
           'openid' => $_POST['openid'],
            'contenid'=>$_POST['id'],
             'isshow'=>0,
            'path'=>'https://www.gxfwz36524.com/uploads/'.$date.'/'. $orderSn.'.png',
              't'=>date("Y-m-d H:i:s")

        ];
        Db::table('picture')->insert($data);
    }
   public  function  add()
   {
        if($_POST['pack']==0)
            $_POST['pack']='昵称表白';
        else if($_POST['pack']==1)
            $_POST['pack']='校园吐槽';
        else if($_POST['pack']==2)
            $_POST['pack']='失物招领';
        else if($_POST['pack']==3)
            $_POST['pack']='兼职信息';
        else
            $_POST['pack']='跳蚤市场';

        if($_POST['niming'])
            $_POST['name']='匿名';
       $data = [
           'maintext' => $_POST['text'],
           'schoolnum'=>$_POST['schoolnum'],
           'comment'=>0,
           'zanshu'=>0,
           'isdel'=>0,
            'isshow'=>0,
           'niming'=>$_POST['niming'],
           'type'=> $_POST['pack'],
           'name'=>$_POST['name'],
           't'=>date("Y-m-d H:i:s")
       ];
       Db::table('content')->insert($data);
       $userId = Db::name('content')->getLastInsID();
       print_r($userId);
   }
   
   public function del()
   {
	   $sql='update content set isdel=1 where id='.$_POST['id'];
	   // print_r($sql);
	 Db::execute($sql);
   }
   public function ownerlist()
   {
	   $sql="select * from content where schoolnum=".$_POST['schoolnum'].' and isdel=0';
	  
   $result=Db::query($sql);
	   print_r(json_encode($result)); 
   }
   public function correctusername()
   {	

	   $sql1='update ownner set name='."'".$_POST['name']."'".' where schoolnum='."'".$_POST['schoolnum']."'";
       $sql2='update user set name='."'".$_POST['name']."'".' where schoolnum='."'".$_POST['schoolnum']."'";
	 Db::execute($sql2);
       Db::execute($sql1);
       print_r($sql1);
       print_r($sql2);
   }
   public  function  user()
   {

      $sql='select id,name,t from ownner where schoolnum='.'"'.$_POST['schoolnum'].'"'." order by id limit 1";
      $str=mt_rand(100000,999999);

      $result = Db::query($sql);

   $result[0]['id']=$str. $result[0]['id'];
    //   var_dump($result);
       print_r(json_encode($result));

   }
   public  function  search()
   {
       if($_POST["content"]=="匿名表白")
       {
           $r=Db::table('content')->where('type',"匿名表白")->order('zanshu desc t desc')->select();
           if($r)
               print_r(json_encode($r));
           else
               print_r("无数据显示");
       }
       else if($_POST["content"]=="校园吐槽")
       {
           $r=Db::table('content')->where('type',"校园吐槽")->order('zanshu desc t desc')->select();
           if($r)
               print_r(json_encode($r));
           else
               print_r("无数据显示");
       }
       else if($_POST["content"]=="失物招领")
       {
           $r=Db::table('content')->where('type',"失物招领")->order('zanshu desc t desc')->select();
           if($r)
               print_r(json_encode($r));
           else
               print_r("无数据显示");
       }
       else if($_POST["content"]=="兼职信息")
       {
           $r=Db::table('content')->where('type',"兼职信息")->order('zanshu desc t desc')->select();
           if($r)
               print_r(json_encode($r));
           else
               print_r("无数据显示");
       }
       else if($_POST["content"]=="跳蚤市场")
       {
           $r=Db::table('content')->where('type',"跳蚤市场")->order('zanshu desc t desc')->select();
           if($r)
               print_r(json_encode($r));
           else
               print_r("无数据显示");
       }
        else{
            $r=Db::table('content')->where('maintext',"LIKE",$_POST["content"].'%')->order('zanshu desc t desc')->select();
             // print_r(Db::table('content')->getLastSql());
            if($r)
            print_r(json_encode($r));
            else
                print_r("无数据显示");
        }


   }
   public function addzan()
   {
	   
	   Db::table('content')->where('id',$_POST['id'])->setInc('zanshu');
	
	  $r=Db::table('content')->where('id',$_POST['id'])->find();
	   print_r(json_encode($r['zanshu'])); 
	    $data = [
           'zanid'=>$_POST['id'],
           'zanerschoolnum'=>$_POST['schoolnum'],
           'iszan'=>1,
           'zaner'=>$_POST['name'],
           't'=>date("Y-m-d H:i:s")
       ];
       Db::table('zan')->insert($data);
	
	 
   }
     public  function getaccesstoken()
     {

         $appid = "wx038026e857746120";
         $secret = "4fe7fd12a867170ccc93f4f2db64982d";

         $url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".$appid."&secret=".$secret;

         $postUrl = $url;

         $ch = curl_init();//初始化curl
         curl_setopt($ch, CURLOPT_URL,$postUrl);//抓取指定网页
         curl_setopt($ch, CURLOPT_HEADER, 0);//设置header
         curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);//要求结果为字符串且输出到屏幕上
         curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
         curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
         $data = curl_exec($ch);//运行curl
         curl_close($ch);
         //  var_dump($data);
         print_r($data);
     }
      public function jianzan()
   {
	   
	   $r=Db::table('content')->where('id',$_POST['id'])->setDec('zanshu');
	
	  $r=Db::table('content')->where('id',$_POST['id'])->find();
	 print_r(json_encode($r['zanshu'])); 
	 
	 
	 $data = [
           'zanid'=>$_POST['id'],
           'zanerschoolnum'=>$_POST['schoolnum'],
           'iszan'=>0,
           'zaner'=>$_POST['name'],
           't'=>date("Y-m-d H:i:s")
       ];
       Db::table('zan')->insert($data);
   }
   public  function  showtitle()
   {
       $title=Db::table('content')->where('id',$_POST['id'])->find();
       print_r(json_encode($title));
   }
   public  function  showpic()
   {
      $r=Db::table('picture')
           ->where('contenid',$_POST['id'])
           ->where('openid',$_POST['openid'])
          
           ->select();
       print_r(json_encode($r));

   }
   public function  show()
   {

       $sql='select * from content where isdel=0 order by zanshu desc,t desc';
	
       $result=Db::query($sql);
       print_r(json_encode($result));
   }
   public  function  commentshow()
   {

       $comment=Db::table('comment')->where('contentid',$_POST['id'])->select();
      print_r(json_encode($comment));
   }
   public  function  check()
   {
       $url="https://api.weixin.qq.com/wxa/msg_sec_check?access_token=".$_POST['access'];

       $postUrl = $url;

       $ch = curl_init();//初始化curl
       $data = array(
      "content" =>$_POST['content']
        );
       $data=json_encode($data,JSON_UNESCAPED_UNICODE);
       curl_setopt($ch, CURLOPT_URL,$postUrl);//抓取指定网页
       curl_setopt($ch, CURLOPT_HEADER, 0);//设置header
       curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);//要求结果为字符串且输出到屏幕上
       curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
       curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
       curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
       $data = curl_exec($ch);//运行curl
       curl_close($ch);
       //  var_dump($data);
       print_r($data);
   }
   public  function commentadd()
   {

      $r=Db::table('content')->where('id',$_POST['contentid'])->find();
       Db::table('content')->where('id', $_POST['contentid'])->setInc('comment');
       $data = [
           'contentid' => $r['id'],
           'content'=>$r['maintext'],
           'commentschoolnum'=>$_POST['commentschoolnum'],
           'commenter'=>$_POST['commenter'],
           'commentcontent'=>$_POST['commentcontent'],
            'isshow'=>0,
           't'=>date("Y-m-d H:i:s")
       ];
       Db::table('comment')->insert($data);
   }
}
