<?php
class Library
{
    var $db;
	
	public function __construct()
    {
        global $db;
        $this->db = $db;
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
                    $get_admin = $this->db->query("SELECT * FROM tb_user WHERE username = ".$this->db->quote($username));
                    $rget = $get_admin->fetch();

                    return array(
                        "username" => $rget['username'],
                        "name" => $rget['nama'],
                        "email" => $rget['email'],
                        "level" => $rget['level']
                    );

                }

            }
        }
        return false;
    }

    Public function salah_login_action($username){
        $tgl = date("Y-m-d H:i:s");
        $expired = date("Y-m-d H:i:s");
        $ip = $_SERVER['REMOTE_ADDR'];
        $useragent = $_SERVER['HTTP_USER_AGENT'];
        $save = $this->db->prepare("INSERT INTO tb_user_log VALUES (NULL, ?,  ?, '', ?, ?, ?, 0)");
        $save->execute(array(
            $tgl, $expired, $username, $ip, $useragent
        ));
        return true;
    }

    public function cek_salah_login($limit=5){
        $ip = $_SERVER['REMOTE_ADDR'];
        $cek = $this->db->prepare("SELECT * FROM tb_user_log WHERE stat = 0 AND ip = ?");

        $cek->execute(array($ip));
        if($cek->rowCount() >= $limit)
            return false;
        return true;
    }

    public function true_login($username, $expired){
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
        $upd = $this->db->query("UPDATE tb_user_log SET stat = 9 WHERE token = '' AND ip = ".$this->db->quote($ip)." AND useragent = ".$this->db->quote($useragent));

        $save = $this->db->prepare("INSERT INTO tb_user_log VALUES (NULL, ?, ?, ?, ?, ?, ?, 1)");
        $save->execute(array(
            $tgl, $expireddb, $token, $username, $ip, $useragent
        ));

        $expr = 0;
        if($expired <> 0){
            $expr = intval(strtotime($expired));
        }
        setcookie("adv_token", $token, $expr, "/");

        return true;
    }

    public function logout(){
        #dipanggil saat user logout dari sistem.

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

    public function login_redir(){
        if(!$this->cek_login())
            header("location:index.php");
    }

    public function get_fullname($uid)
    {
        $conn      = db();
        $sql       = "SELECT foto FROM tb_users WHERE id = $id";
        $result    = $conn->query($sql);
        $user_data = $result->fetch_assoc();
        echo $user_data['fullname'];
    }

    public function get_session()
    {
        return $_SESSION['login'];
    }

    public function add_data_karyawan($nip,$nama,$tempat_lahir,$tanggal_lahir,$tanggal_join,$jabatan,$devisi) 
    {
    	$data = $this->db->prepare('INSERT INTO tb_karyawan (nip,nama,tempat_lahir,tanggal_lahir,tanggal_join,jabatan,devisi) VALUES (?,?,?,?,?,?,?)');

    	$data ->bindParam(1, $nip);
    	$data ->bindParam(2, $nama);
    	$data ->bindParam(3, $tempat_lahir);
    	$data ->bindParam(4, $tanggal_lahir);
    	$data ->bindParam(5, $tanggal_join);
    	$data ->bindParam(6, $jabatan);
    	$data ->bindParam(7, $devisi);

    	$data->execute();
    	return $data->rowCount();
    }
}
?>