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
    <script src="ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
    <script src="lib/ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
</head>
<body>
<style type="text/css">

</style>

<div class="item-main">
    <form action="exportGather.do" method="get">

    <table>
        <tr>
            <td style="width:5px"></td>
            <td>项目名称:</td>
            <td><input type="text" style="width:100px" class="projetName"></input></td>
            <td style="width:5px"></td>
            <td><input type="button" value="查找" class="l-button" style="width:50px;color:red;" onclick="selectGather()"></input></td>
            <td style="width:5px"></td>
            <td><input type="button" value="刷新" class="l-button" style="width:50px;color:#57b255;" onclick="refreshGather()"></input></td>
            <td style="width:5px"></td>
            <td><input type="submit" value="导出" class="l-button" style="width:50px;color:#57b255;" onclick="exportExcel()"></input></td>
        </tr>
    </table>
    </form>
    <div class="container" align="center">

        <div id="GatheringInfo"></div>
    </div>
</div>

<script type="text/javascript">


    var gather=$("#GatheringInfo").ligerGrid({
        width:'100%',
        height:'100%',
        rowHeight:30,
        headerRowHeight:30,
        rownumbers: true,
        columns: [
            { display: '操作', isSort: false, width: 120, render: function
                (rowdata, rowindex, value)
            {
                var h = "";
                if (!rowdata._editing)
                {
                    h += "<a href='javascript:showInfo("+rowdata.gatheringId+")'>查看</a> ";
                    h += "<a href='javascript:updateInfo("+rowdata.gatheringId+")'>修改</a> ";
                }
                return h;
            }
            },
            { name: 'projetName', display: '项目名称', width: '10%' },
            { name: 'projectInfo', display: '项目内容', width: '30%' } ,
            { name: 'payUnit', display: '收款单位', width: '10%' } ,
            { name: 'totalMoney', display: '付款金额', width: '10%' } ,
            { name: 'gatherDate', display: '付款日期', width: '15%',type: 'date', format: 'yyyy-MM-dd'} ,
            { name: 'gatherNote', display: '备注', width: '25%' },
        ],
        pageSize:10,
        usePager:true,
        dataAction:'local',
        dateFormat: "yyyy-MM-dd hh:mm:ss",
        url:"selectGatherAll.do",
    });

    function refreshGather() {
        gather.set({url:'selectGatherAll.do'});
        gather.reload();
    }

    function selectGather() {
        gather.set({url:'selectGatherInfo.do?projetName='+$(".projetName").val()});
        gather.reload();
    }

    function showInfo(data) {
        var tabid="gatherInfo"+data;
        parent.f_addTab(tabid,"工程款入账明细查看","ShowGatherInfoForm.jsp?id="+data);
    }

    //更新信息
    function updateInfo(data) {
        var tabid="updateGatherInfo"+data;
        parent.f_addTab(tabid,"工程款入账明细修改","UpdateGatherInfo.jsp?id="+data);
    }

    /*
//原理：直接从ligerUI生成的grid页面中抓取数据，将其导出到Excel
使用方法，1.根据需要，更改导出Excel和下载excel的Url地址，2. 导如以下js代码，
3.调用gridExportModule.exportSelectRows('gridDomId', ['fileterHeader1', 'fileterHeader2'],'导出表格的名称')
 第1个参数是jsp中表格div的id如<div id = 'gridId'><div>
 第2个参数用来过滤不想显示导出的字段
*/
    gridExportModule = (function (){
        // mvc
        // mvc
        var module = {
            // 构建对话框
            _buildFieldSelectDialog : function(gridId, filterFieldArr, outPutFileName) {
                var fieldSelectDialogMgr;
                var divStr = '<div id="' + gridId
                    + '_fieldSelectDialog" style="display: none;"><form id="'
                    + gridId + '_fieldSelectForm"></form></div>';
                var fieldSelectDialogJdom = $(divStr);
                fieldSelectDialogJdom.appendTo('body');
                var dialogCfg = {
                    showMax : false,
                    showToggle : false,
                    isResize : false,
                    modal : true,
                    show : false,
                    height : 400,
                    width : 700,
                    id : gridId + '_fieldSelectLigerDialog',
                    target : fieldSelectDialogJdom,
                    title : '勾选您要导出到表格的字段',
                    buttons : [ {
                        text : '导出Excel',
                        width : 60,
                        onclick : function(item, dialog) {

                            // 获取选择的字段（表头）名称数组
                            var formMgr = liger.get(gridId + '_fieldSelectForm');
                            var formData = formMgr.getData();
                            var gridMgr = liger.get(gridId);

                            var headerKey = []; // 字段英文名称
                            var headerVal = []; // 字段中文名称
                            var selHeaderCols = {};// 对话框中选中的字段以及所在表格中列的id
                            // {projectName:'c013', id:'c014'}

                            var headerCols = {}; // {projectName:'c013', id:'c014'}
                            $(gridMgr.columns).each(function(index, field) {
                                if (field.display && field.name) {
                                    headerCols[field.name] = field.__id;
                                }
                            });

                            // 对话框中选中的表头字段以及所在表格中列的id
                            for ( var name in formData) { // {projectName:true,
                                // key2:false}
                                if (formData[name] && headerCols[name]) { // 如果被选中//如果表格中标题存在，
                                    selHeaderCols[name] = headerCols[name]; // headerCols
                                                                            // {projectName:'c013',
                                                                            // id:'c014'}
                                    headerKey.push(name);
                                    $(formMgr.options.fields).each(
                                        function(index, field) {
                                            if (name === field.name) {
                                                headerVal.push(field.display);
                                            }
                                        });
                                }
                            }

                            headerKey = JSON.stringify(headerKey); // 数组必须转成json字符串才能传递到后台
                            headerVal = JSON.stringify(headerVal);

                            // 构建前台选中的数据rows,格式：[{id:'12344',
                            // projectName:'asdfasdf'},{key1:val1, key2:val2}]
                            var selGridRows = $("#"
                                + gridId
                                + " .l-grid2 .l-grid-body .l-grid-body-table .l-grid-row.l-selected");// 选择的行数据
                            var rows = [];
                            for ( var i = 0; i < selGridRows.length; i++) {
                                var cells = selGridRows[i].cells; // 代表一行的数据
                                var row = {}; // {projectName:项目具体名称}
                                for ( var j = 0; j < cells.length; j++) {
                                    var cell = cells[j];
                                    // 遍历选中的表头，根据id来匹配单元格数据
                                    for ( var name in selHeaderCols) {
                                        if (cell.id
                                                .substring(cell.id.lastIndexOf("|") + 1) == selHeaderCols[name]) {
                                            row[name] = cell.textContent;
                                        }
                                    }
                                }
                                rows.push(row);
                            }
                            rows = JSON.stringify(rows);
                            if(rows.length > 2000000){
                                alert('数据量太大，请去掉一些勾选的数据！');
                                return;
                            }
                            var param = {
                                headerKey : headerKey,
                                headerVal : headerVal,
                                rows : rows,
                                title : outPutFileName
                            };//
                            dialog.hidden();

                            $.ajax({
                                type : 'post',
                                //这里写导出的url
                                url : '/pmis/resource/api/exportExcel.json',
                                data : param, // 这里只能传递{key1：value1,
                                // key2:value2} 或者&a=1&b=2
                                success : function(result) {
                                    if (result.fileUrl) {
                                        //你的代码*************************************************//
                                        //这里写下载的URL
                                        window.location.href = '/pmis/resource/api/downloadAttachment.json?';
                                    } else {
                                        alert("导出失败，另一个程序正在使用此文件，进程无法访问！");
                                    }
                                },
                                error : function(result) {
                                    alert("导出Excel错误！");
                                    console.dir(result);
                                },
                                beforeSend : function() {
                                    $.ligerDialog.waitting("正在导出中,请稍后...");
                                },
                                complete : function() {
                                    $.ligerDialog.closeWaitting();
                                }
                            });

                            // 去掉表格行前面的勾选
                            $("#" + gridId + " .l-grid-row.l-selected").removeClass(
                                "l-selected");
                            $("#" + gridId + " .l-grid-hd-row.l-checked").removeClass(
                                "l-checked");
                            liger.get(gridId).selected = []; // 清空gridMgr中已经选择的数据
                        }
                    } ]
                };
                fieldSelectDialogMgr = $.ligerDialog.open(dialogCfg);
                fieldSelectDialogMgr.hidden();
                this._buildFieldSelectForm(gridId, filterFieldArr);
                return fieldSelectDialogMgr;
            },
            // _buildFieldSelectDialog
            _buildFieldSelectForm : function(gridId, filterFieldArr) {
                var gridMgr = liger.get(gridId);
                // 动态构建对话框中的表单
                var formCfg = {
                    space : 50,
                    labelWidth : 100,
                    inputWidth : 20,
                    labelAlign : 'right',
                    checkbox : true,
                    prefixID : gridId + '_fieldSelectForm_',
                    fields : [],
                    buttons : [
                        {
                            text : '全选',
                            width : 60,
                            click : function() {
                                $('#' + gridId + '_fieldSelectForm .l-checkbox')
                                    .addClass('l-checkbox-checked');
                                var tempMgr = liger
                                    .get(gridId + '_fieldSelectForm');
                                for ( var i = 0; i < tempMgr.element.length; i++) {
                                    tempMgr.element[i].checked = true; // 让mgr中勾选
                                }
                            }
                        },
                        {
                            text : '反选',
                            width : 60,
                            click : function() {
                                $('#' + gridId + '_fieldSelectForm .l-checkbox')
                                    .toggleClass("l-checkbox-checked");
                                var tempMgr = liger
                                    .get(gridId + '_fieldSelectForm');
                                for ( var i = 0; i < tempMgr.element.length; i++) {
                                    if (tempMgr.element[i].checked) {
                                        tempMgr.element[i].checked = false;
                                    } else {
                                        tempMgr.element[i].checked = true;
                                    }
                                }
                            }
                        } ]
                };

                // 构建表头和id的映射 headerCols，动态生成对话框中的表单
                var headerCols = {}; // {projectName:'c013', id:'c014'}
                var k = 0;
                $(gridMgr.columns).each(function(index, field) {
                    if (field.display) {
                        if (filterFieldArr) { // 过滤不显示的字段
                            for ( var i = 0; i < filterFieldArr.length; i++) {
                                if (field.name == filterFieldArr[i]) {
                                    field.display = false;
                                    break;
                                }
                            }
                        }
                        if (field.name) {
                            formCfg.fields.push({
                                type : 'checkbox',
                                newline : (k++) % 4 == 0 ? true : false,
                                display : field.display,
                                name : field.name
                            });
                            headerCols[field.name] = field.__id;
                        }
                    }
                });
                $('#' + gridId + '_fieldSelectForm').ligerForm(formCfg);
            },

            //
            exportSelectRows : function(gridId, outPutFileName, filterFieldArr) {
                if (typeof outPutFileName === 'undefined') {
                    outPutFileName = '数据';
                }
                var gridMgr = liger.get(gridId);
//                var selRows = gridMgr.getRows();
//                if (selRows.length == 0) {
//                    alert('请选择行！');
//                    return;
//                }

                // 弹出字段选择框
                var fieldSelectDialogMgr = liger
                    .get(gridId + '_fieldSelectLigerDialog');
                if (!fieldSelectDialogMgr) {
                    fieldSelectDialogMgr = this._buildFieldSelectDialog(gridId,
                        filterFieldArr, outPutFileName);
                }
                // 模拟全部勾选(界面展现,真实选中)
                $('#' + gridId + '_fieldSelectForm .l-checkbox').addClass(
                    "l-checkbox-checked");
                var tempMgr = liger.get(gridId + '_fieldSelectForm');
                for ( var i = 0; i < tempMgr.element.length; i++) {
                    tempMgr.element[i].checked = true; // 让mgr中勾选
                }
                fieldSelectDialogMgr.show();
            }
        };
        return module;
    })();

</script>
</body>
</html>