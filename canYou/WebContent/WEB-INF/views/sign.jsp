<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script src="../../js/member/member.js?ver=1"></script>
<link href="../../css/member/member.css?ver=1" type="text/css" rel="stylesheet">

<style>
.main{ margin: 0 auto;
    width: 40%;
}

.main h3{ margin: 60px auto;
text-align: center; font-size: 2em;
font-weight: bold; }

fieldset{
    border: none;
}

fieldset > div{ 
    position: relative;
    margin-bottom: 10px;
}

.none{
    display: none;
}


.error{ 
    font-size: 0.8em;
    position: absolute;
    width: auto;
    top: 18px; right: 10px;
    text-align: right;
    color: red;
}

.vaild{
    font-size: 0.8em;
    position: absolute;
    width: 150px;
    top: 18px; right: 10px;
    text-align: right;
    color: forestgreen;
}

input[type=text], select, input[type=password], input[type=email] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit],input[type=boutton] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px auto;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover,input[type=boutton]:hover {
    background-color: #45a049;
}

#wrap_gender{
    border-radius: 4px;
    border: 1px solid #ccc;
    display: flex;
}

.gender{
    display: block;
    height: 100%; width: 50%;
    border-right: 1px solid #ccc;
}

.no_line{
    border-right:none;
}

.gender > label {
    display: block;
    /*width: 100%; height: 100%;*/
    padding: 10px 0;
    text-align: center;
    font-size: 0.8em;
    color: #666;
}

input[type=radio]{
   display: none;
}

.gender_act{
    display: inline-block;
    height: 100%; width: 50%;
    background-color: #45a049;
    color:#fff;
}

.gender_act > label {
    display: inline-block;
    width: 100%; height: 100%;
    padding: 10px 0;
    text-align: center;
    font-size: 0.8em;
    color: #fff;
}

</style>

    <div class="container">
        <div class="header">
            <div class="logo"></div>
        </div>
        <div class="main">
            <h3>ȸ������</h3>
            <div>
                <form action="addMember" method="POST">
                    <fieldset>
                    	<div>
                            <label for="id"></label> <input type="text" id="id"
                                name="memberId" placeholder="ID" required> 
                            <span id="MsgId" class="none"></span>
                        </div>
                        <div>
                            <label for="pwd"></label> <input type="password" id="pwd"
                                name="memberPwd" placeholder="��й�ȣ" onblur="ck_pwd()" required> 
                            <span id="MsgPw" class="none">��ȿ��üũ</span>
                        </div>  
                         <div>   
                            <label for="pwd_ck"></label> <input type="password" id="pwd_ck"
                             placeholder="��й�ȣ Ȯ��" onblur="ck_pwd2()" required>
                             <span id="MsgPwck" class="none">��ȿ��üũ</span>
                        </div>   
                        <div>    
                            <label for="name"></label> <input type="text" id="name"
                        name="memberName" placeholder="�̸�" onblur="ck_name()" required> 
                            <span id="MsgName" class="none">��ȿ��üũ</span>
                        </div>     
  
                        <div>
                            <label for="email"></label> <input type="email" id="email"
                                name="memberEmail" placeholder="�̸��� ( ex@codepen.com)" onblur="ck_email()" required> 
                            <span id="MsgId" class="none"></span>
                        </div>
                        <div>
                            <label for="addr"></label> <input type="text" id="addr"
                                name="memberAddr" placeholder="�ּ�" onblur="ck_email()" required> 
                                <input type="button" onclick="addrSearch()" value="�ּ� ã��"><br>
                            <span id="MsgId" class="none"></span>
                        </div>
                    
                        <div>
                            <label for="tel"></label> <input type="text" id="tel"
                                name="memberPhone" placeholder="�޴��� ��ȣ" onblur="ck_email()" required> 
                            <span id="MsgId" class="none"></span>
                        </div>
                        <div>
                            <label for="account"></label> <input type="text" id="account"
                                name="memberAccount" placeholder="���¹�ȣ" onblur="ck_email()" required> 
                            <span id="MsgId" class="none"></span>
                        </div>

					<div>
						<input class="upload-name" value="���ϼ���" disabled="disabled">
						<label for="mfile">������ �̹���</label> <input type="file" id="mfile"
							name="memberImage" class="upload-hidden" required>
							<p><img id="memberImage"></p>
					</div>
					
					<div> 
						 <label for="gender"></label> <input type="text" id="memberGender"
                                name="memberGender" placeholder="����" onblur="ck_email()" required> 
                            <span id="MsgId" class="none"></span>
					
					
					<!--
                            <span id="wrap_man" class="gender">
                            <input type="radio" id="man" name="memberGender" onclick="ck_gender()"> <label for="man"> ���� </label>
                            </span>
                            <span id="wrap_woman" class="gender no_line">
                            <input type="radio" id="woman" name="memberGender" onclick="ck_gender()"> <label for="woman" onclick="ck_gender()"> ���� </label>
                            </span>
                              -->
                         </div> 
                        <span id="MsgGender" class="none">��ȿ��üũ</span>
                        <div> 
                            <label for="age"></label> <input type="text" id="age"
                                name="memberAge" placeholder="����" onblur="ck_email()" required> 
                            <span id="MsgId" class="none"></span>
                        </div>

                        <input type="submit" value="Submit">
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function addrSearch() {
        new daum.Postcode(
                {
                    oncomplete : function(data) {                      
                        var fullAddr = ''; 
                        var extraAddr = ''; 
 
                        // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                        if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                            fullAddr = data.roadAddress;
 
                        } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                            fullAddr = data.jibunAddress;
                        }
 
                        // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                        if (data.userSelectedType === 'R') {
                            //���������� ���� ��� �߰��Ѵ�.
                            if (data.bname !== '') {
                                extraAddr += data.bname;
                            }
                            // �ǹ����� ���� ��� �߰��Ѵ�.
                            if (data.buildingName !== '') {
                                extraAddr += (extraAddr !== '' ? ', '
                                        + data.buildingName : data.buildingName);
                            }
                            // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                            fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                                    + ')' : '');
                        }

                        // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                        document.getElementById('addr').value = fullAddr;
 
                        // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                        document.getElementById('addr').focus();
                    }
                }).open();
    }
    
    
    function readURL(input) {
    	
        if (input.files && input.files[0]) {
            var reader = new FileReader();
     		
            $('.upload-name').val(input.files[0].name);
            reader.onload = function (e) {
                $('#memberImage').attr('src', e.target.result);   
            }
            reader.readAsDataURL(input.files[0]);
        }
        $('#memberImage').show();
    }
     
    $("#mfile").change(function(){
        readURL(this);
    });
    
    function ck_email(){
        var email = document.getElementById("email")
        var MsgId = document.getElementById("MsgId")
        var isEmail = /([\w\-]+\@[\w\-]+\.[\w\-]+)/

        if(!isEmail.test(email.value)){
            MsgId.style.display="block";
            MsgId.className='error'
            MsgId.innerHTML="�̸��� ������ Ȯ���ϼ���"
            email.focus()
            return false;
        } else{
            MsgId.className='vaild'
            MsgId.innerHTML="ok"
        }   
}

function ck_pwd(){
        var pwd = document.getElementById("pwd")
        var MsgPw = document.getElementById("MsgPw")
        var isPwd = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/
        
        if(!isPwd.test(pwd.value)){
            MsgPw.style.display="block";
            MsgPw.className='error'
            MsgPw.innerHTML="�������� �ּ� 6�ڸ� �̻�"
            pwd.focus()
            return false;
        } else{
            MsgPw.className='vaild'
            MsgPw.innerHTML="ok"
        }   
}


function ck_pwd2(){
        var pwd_ck = document.getElementById("pwd_ck")
        var pwd = document.getElementById("pwd").value
        var MsgPwck = document.getElementById("MsgPwck")
        
        if(pwd_ck.value!=pwd){
            MsgPwck.style.display="block";
            MsgPwck.className='error'
            MsgPwck.innerHTML="��й�ȣ�� ��ġ���� �ʽ��ϴ�."
            pwd_ck.focus()
            return false;
        } else{
            MsgPwck.className='vaild'
            MsgPwck.innerHTML="ok"
        }   
}


function ck_name(){
        var name = document.getElementById("name")
        var MsgName = document.getElementById("MsgName")
        
        if(name.value==''){
            MsgName.style.display="block";
            MsgName.className='error'
            MsgName.innerHTML="2�� �̻� �Է��ϼ���."
            name.focus()
            return false;
        } else{
            MsgName.className='vaild'
            MsgName.innerHTML="ok"
        }   
}


function ck_gender(){
    var wrap_gender = document.getElementById("wrap_gender")
    var man = document.getElementById("man")
    var woman = document.getElementById("woman")
    var MsgGender = document.getElementById("MsgGender")

    
    if(man.checked){
        document.getElementById("wrap_man").className='gender_act';
        document.getElementById("wrap_woman").className='gender';
    }
    
    if(woman.checked){
        document.getElementById("wrap_woman").className='gender_act';
        document.getElementById("wrap_man").className='gender';
    }

}
</script>
