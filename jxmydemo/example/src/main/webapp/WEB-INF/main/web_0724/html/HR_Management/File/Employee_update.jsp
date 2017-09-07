<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<link href="lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css"> 
    <link href="lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css"> 
	<link href="css/style-item.css" rel="stylesheet" media="all" />
    <script src="lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>    
    <script src="lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script> 
    <script src="lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
	<script src="lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script> 
    <script src="lib/ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/messages_cn.js" type="text/javascript"></script>

	<script type="text/javascript"> 
		 $(function(){
			//�޸���select��ѡ�������
			var Employee_sexData = [{ Employee_sex: 1, text: '��' }, { Employee_sex: 2, text: 'Ů'}];
			var Employee_nationData = [{ Employee_nation: 1, text: '����' }, { Employee_nation: 2, text: '��������'}];
			var Employee_politicalData= [{ Employee_political: 0, text: 'Ⱥ��' }, { Employee_political: 1, text: '��Ա'},{ Employee_political: 2, text: '��Ա' }];
			var Employee_eduData= [{ Employee_edu: 0, text: 'ר��' }, { Employee_edu: 1, text: '����'},{ Employee_edu: 2, text: '�о���' },{ Employee_edu: 0, text: '˶ʿ' },{ Employee_edu: 0, text: '��ʿ' }];
			//��ʾ������
			var griddata = [ 
			{ Employee_id: '001', Employee_name: 'Ա��',Employee_idNum:'360372199911111231',Employee_phone:'13279914435',Employee_email:'951717349@qq.com',Employee_sex:'Ů',Employee_address:'�����ϲ�',Employee_nation:'����',Employee_political:'��Ա',Employee_edu:'����',Employee_school:'����ʦ����ѧ',Employee_major:'�������'}
			]; 
             g = manager= $("#Employee").ligerGrid({
                width:970,  
			columns: [ 
				{ name: 'Employee_id', display: 'Ա�����', width: 80 }, 
				{ name: 'Employee_name', display: 'Ա������', width: 80 ,
					editor: { type: 'text' }
				} ,
				{ name: 'Employee_idNum', display: '���֤��', width: 150 ,
					editor: { type: 'text' }
				}, 
				{ name: 'Employee_phone', display: '�ֻ���', width: 100,
					editor: { type: 'text' }
					} ,
				{ name: 'Employee_email', display: '����', width: 130 ,
					editor: { type: 'text' }
					}, 
				{ name: 'Employee_sex', display: '�Ա�', width: 80  ,
					editor: { type: 'select', data: Employee_sexData, valueField: 'Employee_sex' },
                    render: function (item)
                    {
                        if (parseInt(item.Employee_sex) == 1) 
							return '��';
						else
							return 'Ů';
                    }
				} ,
				{ name: 'Employee_address', display: '����', width: 80 ,
					editor: { type: 'text' }
					}, 
				{ name: 'Employee_nation', display: '����', width: 80 ,
					editor: { type: 'select', data: Employee_nationData, valueField: 'Employee_nation' },
                    render: function (item)
                    {
                        if (parseInt(item.Employee_nation) == 1) 
							return '����';
						else
							return '��������';
                    }
				} ,
				{ name: 'Employee_political', display: '������ò', width: 80 ,
					editor: { type: 'select', data: Employee_politicalData, valueField: 'Employee_political' },
                    render: function (item)
                    {
                        if (parseInt(item.Employee_political) == 1) 
							return '��Ա';
						else if(parseInt(item.Employee_political)==2)
							return '��Ա';
						else
							return 'Ⱥ��';
                    }
					}, 
				{ name: 'Employee_edu', display: 'ѧ��', width: 80 ,
					editor: { type: 'select', data: Employee_eduData, valueField: 'Employee_edu' },
                    render: function (item)
                    {
                        if (parseInt(item.Employee_edu) == 1) 
							return 'ר��';
						else if(parseInt(item.Employee_edu)==2)
							return '����';
						else if(parseInt(item.Employee_edu)==3)
							return '�о���';
						else if(parseInt(item.Employee_edu)==4)
							return '˶ʿ';
						else
							return '��ʿ';
                    }
					} ,
				{ name: 'Employee_school', display: '��ҵԺУ', width: 100 ,
					editor: { type: 'text' }
					}, 
				{ name: 'Employee_major', display: 'רҵ', width: 80 ,
					editor: { type: 'text' }
					},
				{ display: '����', isSort: false, width: 120, render: function (rowdata, rowindex, value)
                {
                    var h = "";
                    if (!rowdata._editing)
                    {
                        h += "<a href='javascript:beginEdit(" + rowindex + ")'>�޸�</a> ";
                        h += "<a href='javascript:deleteRow(" + rowindex + ")'>ɾ��</a> "; 
                    }
                    else
                    {
                        h += "<a href='javascript:endEdit(" + rowindex + ")'>�ύ</a> ";
                        h += "<a href='javascript:cancelEdit(" + rowindex + ")'>ȡ��</a> "; 
                    }
                    return h;
                }
                }		
			], 
			data: { Rows: griddata } ,
			onSelectRow: function (rowdata, rowindex)
                {
                    $("#txtrowindex").val(rowindex);
                },
			enabledEdit: true,clickToEdit:false,isScroll: false
			
              });
          });
		  
		 function beginEdit(rowid) { 
            manager.beginEdit(rowid);
        }
        function cancelEdit(rowid) { 
            manager.cancelEdit(rowid);
        }
        function endEdit(rowid)
        {
            manager.endEdit(rowid);
        }
 
        function deleteRow(rowid)
        {
            if (confirm('ȷ��ɾ��?'))
            {
                manager.deleteRow(rowid);
            }
        }
</script> 
</head>
<body>

	<style type="text/css">
		html{
			background-color:#E0EEEE;
		}
		body{
			
			background-color:#E0EEEE;
		}
		td{
			 text-align: center;
			 height:50px;
		}
		#Employee{
			
			margin:0 auto;
		}
		.top{

			margin:0 auto;
		}
		.block{
			height:20px;
			
		}
	</style>
	
	<div class="item-main">
		<div class="container" align="center">
			<div class="block"></div>
			<div class="top">
				<label>Ա��������</label>
				<input type="text" value="Ա��" name="name" placeholder="Ա������"/>
				<input type="button" value="����" style="width:50px"/>
			</div>
			<div class="block"></div>
			<div id="Employee"></div> 
		</div>
	</div>
	
</body>
</html>