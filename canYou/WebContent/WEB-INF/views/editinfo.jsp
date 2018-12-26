<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
	#info{
		border: 1px solid gray;
		margin: 10px auto 0 auto;
		padding-left:10px;
		padding-right:10px;
		border-radius: 5px;
		width: 60%;
	}
	
	.title{
		borer-bottom: 1px dotted gray;
		color: gray;
		font-weight: bold;
	}
	
	h1{
		font-size: 40px;
		font-weight: bold;
		color: gray;
		margin-top:10px;
	}
	
	input{
		border: 1px solid #999;
		border-radius: 5px;
	}
</style>
<div id="container">
<div align="center">
<h1>�������� ����</h1>
</div>
<div id="info">
<form action="success" method="POST">
	<p><span class="title">�̸� : </span><input type="text" name="memberName" value="${list.memberName }"></p>
	<p><span class="title">���� ��й�ȣ : </span><input type="password" name="targetPwd"></p>
	<p><span class="title">������ ��й�ȣ : </span><input type="password" name="memberPwd"></p>
	<p><span class="title">�ּ� : </span><label for="addr"></label><input type="text" id="addr"
                                name="memberAddr" size=70 value="${list.memberAddr }" placeholder="�ּ�" required> 
                                <input type="button" onclick="addrSearch()" value="�ּ� ã��"><br>
                            <span id="MsgId" class="none"></span></p>
	<p><span class="title">�޴��� ��ȣ : </span><input type="text" name="memberPhone" value="${list.memberPhone }"></p>
	<p><span class="title">�̸��� : </span><input type="text" name="memberEmail" value="${list.memberEmail }"></p>
	<p><span class="title">���� : </span><input type="text" name="memberAge" value="${list.memberAge }"></p>
	<p><span class="title">���� : </span><input type="text" name="memberAccount" value="${list.memberAccount }"></p>
	<!--<p><label>������ �̹��� : </label><input name="mfile" type="file"></p>-->
	
	<p><input type="submit" class="btns" value="�����ϱ�"></p>
	
</form>
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
</script>