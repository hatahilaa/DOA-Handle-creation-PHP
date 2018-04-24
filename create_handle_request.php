<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
if(isset($_POST['addNewDoctor'])){
    $doctorLicence = "";
    $doctorNID = "";
    
    function getDoctor( $doctorLicence, $doctorNID){
        
        $method ='POST';
        $headers = array("Content-Type: application/json");
        function genRand(){
            $rand = substr(md5(microtime()),rand(0,26),10);
            return $rand;
        }
        $url ='https://197.243.0.244:8880/';
        $random = genRand();
        $handleID = addslashes('25.001/PRESCRIPTION/DOCTOR/'.$random);
        $location_info = '<locations><location id="0" href ="'.'http://www.rura.rw/index.php?id=44'.'" type="'.'background'.'" location id="0" href="'.'http://www.rura.rw/index.php?id=45'.'" type="'.'function'.'"></location>';
        $data = '{
	"authkey": "LBE7YRZPUCOCLQOXBMPJUWKS0EMUZ8MJ",
	"handleid": "25.001\/PRESCRIPTION\/DOCTOR\/'.$random.'",
	"values": [{
		"type": "LICENCE",
		"value": "LIC009243",
		"adminRead": true,
		"adminWrite": true,
		"publicRead": true,
		"publicWrite": false,
		"index": "1001"
                
	          }, 
                  {
                    "type":"FIRST_NAME",
                    "value":"RWASA",
                    "adminRead": true,
                    "adminWrite": true,
                    "publicRead": true,
		    "publicWrite": false,
		    "index": "1002"
                
	          
                  }]
               }';
                
               
        echo $data;
        
        $curl = curl_init();
        curl_setopt_array($curl, array(
	        CURLOPT_RETURNTRANSFER => true,
                CURLOPT_SSL_VERIFYHOST => false,
                CURLOPT_SSL_VERIFYPEER =>false,
	        CURLOPT_URL => $url,
	        CURLOPT_CUSTOMREQUEST => $method,
	        CURLOPT_HTTPHEADER => $headers,
			CURLOPT_POSTFIELDS => ($data)
	    ));
        $output = curl_exec($curl);
        echo $output;
        $err = curl_error($curl);
        curl_close($curl);    
	    if ($err) {
	    	echo "cURL Error #:" . $err;
	    } else {
                include('db_connection.php');
                
            $sql ="INSERT INTO `doctors` (`id`, `nid`, `license`, `doc_id`) VALUES (NULL, '".$doctorNID."', '".$doctorLicence."', '".$handleID."')";
           
            $doctor_insertion = mysqli_query($conn,$sql) ;
            if($doctor_insertion ){
                echo "Object recorded in Database";
            }
            else {
              echo "Fail";  
            }
       }
    }
    
    //Function call
    getDoctor($_POST['licence'], $_POST['nid']);
}
    //Enter The Licence and NID 
    echo '<form action="" method="post">'
    . 'DOCTOR LICENCE'.'<input type="text" name="licence"><br/>'
    .'NID'.'<input type="text" name="nid"><br/>'
    .'<input type="submit" name="addNewDoctor" vale="ADD"><br/>'
    . '</form>';
    
            
        

