<script language="javascript" type="text/javascript" src="jquery.min.js"></script>


<body>
    <select id="ddlSheng" onchange="getCity();">
    </select>
    <select id="ddlCity">
        <option value="0">��ѡ��</option>
    </select>
</body>
<script language="javascript" type="text/javascript">
var cityArray = new Array();
cityArray[0] = new Array("�Ϻ�","�Ϻ�");
cityArray[1] = new Array("����","����");
cityArray[2] = new Array("���","���");
cityArray[3] = new Array("����","����");
cityArray[4] = new Array("����","�Ϸ�|����|�ߺ�|����|��ɽ|����|ͭ��|����|��ɽ|����|����|����|����|����|����|����|����");
cityArray[5] = new Array("����","����|����|����|����|Ȫ��|����|��ƽ|����|����");
cityArray[6] = new Array("����","����|������|���|����|��ˮ|��Ȫ|��Ҵ|����|����|¤��|ƽ��|����|����|����");
cityArray[7] = new Array("�㶫","����|����|�麣|��ͷ|�ع�|��ɽ|����|տ��|ï��|����|����|÷��|��β|��Դ|����|��Զ|��ݸ|��ɽ|����|����|�Ƹ�");
cityArray[8] = new Array("����","����|����|����|����|����|���Ǹ�|����|���|����|��ɫ|����|�ӳ�|����|����");
cityArray[9] = new Array("����","����|����ˮ|����|��˳|ͭ��|�Ͻڵ���|ǭ����|ǭ����|ǭ��");
cityArray[10] = new Array("����","����|����|�Ĳ�|��|����|��ָɽ|����|����|�ٸ�|����|����|�Ͳ�|����|��ɳ|����|��ˮ|��ͤ|�ֶ�");
cityArray[11] = new Array("�ӱ�","ʯ��ׯ|��ɽ|�ػʵ�|����|��̨|����|�żҿ�|�е�|����|�ȷ�|��ˮ");
cityArray[12] = new Array("����","֣��|����|����|ƽ��ɽ|����|�ױ�|����|����|���|���|���|����Ͽ|����|����|����|�ܿ�|פ���");
cityArray[13] = new Array("������","������|�������|����|�׸�|˫Ѽɽ|����|����|��ľ˹|��̨��|ĵ����|�ں�|�绯|���˰���");
cityArray[14] = new Array("����","�人|��ʯ|�差|ʮ��|����|�˲�|����|����|Т��|�Ƹ�|����|����|��ʩ|����|Ǳ��|����|��ũ��");
cityArray[15] = new Array("����","��ɳ|����|��̶|����|����|����|����|�żҽ�|����|����|����|����|¦��|����");
cityArray[16] = new Array("����","����|����|��ƽ|��Դ|ͨ��|��ɽ|��ԭ|�׳�|�ӱ�");
cityArray[17] = new Array("����","�Ͼ�|����|����|����|����|��ͨ|���Ƹ�|����|�γ�|����|��|̩��|��Ǩ");
cityArray[18] = new Array("����","�ϲ�|������|Ƽ��|�Ž�|����|ӥ̶|����|����|�˴�|����|����");
cityArray[19] = new Array("����","����|����|��ɽ|��˳|��Ϫ|����|����|Ӫ��|����|����|�̽�|����|����|��«��");
cityArray[20] = new Array("���ɹ�","���ͺ���|��ͷ|�ں�|���|ͨ��|������˹|���ױ���|�����׶�|�����첼|�˰���|����|������");
cityArray[21] = new Array("����","����|ʯ��ɽ|����|��ԭ|����");
cityArray[22] = new Array("�ຣ","����|��������|����|����|����|����|����|����");
cityArray[23] = new Array("ɽ��","����|�ൺ|�Ͳ�|��ׯ|��Ӫ|��̨|Ϋ��|����|����|̩��|����|����|����|����|�ĳ�|����|����");
cityArray[24] = new Array("ɽ��","̫ԭ|��ͬ|��Ȫ|����|����|˷��|����|�˳�|����|�ٷ�|����");
cityArray[25] = new Array("����","����|ͭ��|����|����|μ��|�Ӱ�|����|����|����|����");
cityArray[26] = new Array("�Ĵ�","�ɶ�|����|�Թ�|��֦��|����|����|��Ԫ|����|�ڽ�|��ɽ|�ϳ�|�˱�|�㰲|����|üɽ|�Ű�|����|����|����|����|��ɽ");
cityArray[27] = new Array("����","����|ɽ��|�տ���|����|����|��֥");
cityArray[28] = new Array("�½�","��³ľ��|��������|��³��|����|����|����|������|��ʲ|�������տ¶�����|��������|��������|����|����|����̩|ʯ����|������|ͼľ���|�����");
cityArray[29] = new Array("����","����|����|��Ϫ|��ɽ|��ͨ|����|�ն�|�ٲ�|��ɽ׳��|���|��˫����|����|����|�º�|ŭ��|�������");
cityArray[30] = new Array("�㽭","����|����|����|����|����|����|��|����|��ɽ|̨��|��ˮ");
cityArray[31] = new Array("���","���");
cityArray[32] = new Array("����","����");
cityArray[33] = new Array("̨��", "̨��");



    sheng = document.getElementById('ddlSheng');
	alert(sheng)
    sheng.length = 0;
    sheng.options[0] = new Option('��ѡ��', '0');
    for (i = 1; i < cityArray.length; i++) {
        sheng.options[sheng.length] = new Option(cityArray[i][0], cityArray[i][0]);
    }


function getCity() {
    city = document.getElementById('ddlCity');
    var currProvince = document.getElementById('ddlSheng').value;
    if (currProvince == "") {
        city.length = 0;
		city.options[city.length] = new Option("", "��ѡ��");
    }
    else {
        var i, j;
        city.length = 0;
        for (i = 0; i < cityArray.length; i++) {
            if (cityArray[i][0] == currProvince) {
                tmpcityArray = cityArray[i][1].split("|")
                for (j = 0; j < tmpcityArray.length; j++) {
                    city.options[city.length] = new Option(tmpcityArray[j], tmpcityArray[j]);
                }
            }
        }
    }
}

</script>