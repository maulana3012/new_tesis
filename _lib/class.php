<?php
class USER 
{
  private $db;

  function __construct($db_con)
    {
      $this->db = $db_con;
    }

    public function cek_login(){
        if(isset($_COOKIE['adv_token'])){
            $token = $_COOKIE['adv_token'];
            $now = date("Y-m-d H:i:s");
            $cek = $this->db->query("SELECT * FROM tb_user_log WHERE token = ".$this->db->quote($token)." AND expired > ".$this->db->quote($now));
            if($cek){
                $row = $cek->fetch();
                if($row['ip'] == $_SERVER['REMOTE_ADDR'] || $row['useragent'] == $_SERVER['HTTP_USER_AGENT']){
                    $username = $row['username'];
                    $get_admin = $this->db->query("SELECT * FROM tb_access_karyawan WHERE EMAIL = ".$this->db->quote($username));
                    $rget = $get_admin->fetch();

                    return array(
                        "FULLNAME" => $rget['FULLNAME'],
                        "NIK" => $rget['NIK']
                    );

                }

            }
        }
        return false;
    }

    public function login($fnik, $fpassword)
    {
       try
       {
          $stmt = $this->db->prepare("SELECT * FROM tb_access_karyawan WHERE NIK=:NIK LIMIT 1");
          $stmt->execute(array(':NIK'=>$fnik));
          $userRow=$stmt->fetch(PDO::FETCH_ASSOC);
          if($stmt->rowCount() > 0)
          {
             if ($userRow['STATUS'] != 2) {
                 if(password_verify($fpassword, $userRow['TEMPORARY_PASSWORD']))
                 {
                    $_SESSION['user_session'] = $userRow['ID'];
                    $_SESSION['last_login_time'] = time();
                    return true;
                 }
                 else
                 {
                    return false;
                 }
             }
          }
       }
       catch(PDOException $e)
       {
           echo $e->getMessage();
       }
   }

   public function true_login($fnik, $expired){
        $tgl = date("Y-m-d H:i:s");
        if($expired <> 0){
            $expireddb = date("Y-m-d H:i:s",strtotime($expired));
        }
        else{
            $expireddb = date("Y-m-d H:i:s",strtotime("+6 hours"));
        }

        $ip = $_SERVER['REMOTE_ADDR'];
        $useragent = $_SERVER['HTTP_USER_AGENT'];

        $token = sha1($ip.$expireddb."string_random_apasaja".microtime());
        $upd = $this->db->query("UPDATE tb_user_log SET status = 9 WHERE token = '' AND ip = ".$this->db->quote($ip)." AND useragent = ".$this->db->quote($useragent));

        $save = $this->db->prepare("INSERT INTO tb_user_log VALUES (NULL, ?, ?, ?, ?, ?, ?, 1)");
        $save->execute(array(
            $tgl, $expireddb, $token, $fnik, $ip, $useragent
        ));

        $expr = 0;
        if($expired <> 0){
            $expr = intval(strtotime($expired));
        }
        setcookie("adv_token", $token, $expr, "/");

        return true;
    }

    public function salah_login_action($fnik){
        $tgl = date("Y-m-d H:i:s");
        $expired = date("Y-m-d H:i:s");
        $ip = $_SERVER['REMOTE_ADDR'];
        $useragent = $_SERVER['HTTP_USER_AGENT'];
        $save = $this->db->prepare("INSERT INTO tb_user_log VALUES (NULL, ?,  ?, '', ?, ?, ?, 0)");
        $save->execute(array(
            $tgl, $expired, $fnik, $ip, $useragent
        ));
        return true;
    }

    public function is_loggedin()
    {
      if(isset($_SESSION['user_session']))
      {
         return true;
      }
    }

    public function redirect($url)
    {
       header("Location: $url");
    }

    public function logout()
    {
        if(isset($_COOKIE['adv_token'])){
            $token = $_COOKIE['adv_token'];

            //cara menghapus cookie adalah dengan mengubah tanggal expirednya menjadi sekarang
            $now = date("Y-m-d H:i:s");
            unset($_COOKIE['adv_token']);
            setcookie("adv_token",null,$now,"/");
            
            #jangan lupa tanggal expired di database diupdate juga, supaya session token yang sudah logout tidak dihijack
            $this->db->query("UPDATE tb_user_log SET expired = ".$this->db->quote($now)." WHERE token = ".$this->db->quote($token));
        }

        return true;
    }

    public function cek_salah_login($limit=5){
        $ip = $_SERVER['REMOTE_ADDR'];
        $cek = $this->db->prepare("SELECT * FROM tb_user_log WHERE status = 0 AND ip = ?");

        $cek->execute(array($ip));
        if($cek->rowCount() >= $limit)
            return false;
        return true;
    }

    public function get_session($user_id)
    {
        $stmt = $this->db->prepare("SELECT * FROM tb_access_karyawan WHERE ID=:user_id");
        $stmt->execute(array(":user_id"=>$user_id));
        $userRow=$stmt->fetch(PDO::FETCH_ASSOC);
        return $data;
    }
}
?>