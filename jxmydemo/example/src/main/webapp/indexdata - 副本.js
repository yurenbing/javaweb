var path=window.location.href;
var indexdatal =
[
	{ text: '财务管理',isexpand:false ,icon:"icon/workflow.png",children: [
        {text:"财务已审批",url:"./FinanceChecked"},
        {text:"财务待审批",url:"./FinanceUnchecked"},
        {url:"./FinanceForm",text:"财务申请"},
        {url:"./MyFinanceForm",text:"我的申请"},
	]},
	{ text: '经营管理',icon:"icon/message.png",isexpand:false ,children: [
		{url:"./PaymentInfo",text:"工程款支付明细"},
		{url:"./GatherInfo",text:"工程款入账明细"},
        {url:"./PaymentInfoForm",text:"工程款支付录入"},
        {url:"./GatherInfoForm",text:"工程款入账录入"},
	]},
	{ text: '人事管理',isexpand:false ,icon:"icon/humanaffair.png",children: [ 
		{url:"./$AddEmployee",text:"人事录入"},
		{url:"./FileManagement",text:"人事档案管理"},
	]},
];

//管理员功能列表
var managedatal =
[
	{ isexpand: "false", text: "用户管理",icon:"images/37.png",children:[
		{url:"User_insert.html",text:"添加用户",icon:"images/Employee_insert.png"},
		{url:"User_select.html",text:"查看用户",icon:"images/Employee_select.png"},
		{url:"User_update.html",text:"修改用户",icon:"images/Employee_update.png"}
	]},
	{ isexpand: "false", text: "权限管理",icon:"images/power.png",children:[
		{url:"Power_insert.html",text:"添加权限",icon:"images/Power_insert.png"},
		{url:"Power_select.html",text:"查看权限",icon:"images/Power_select.png"},
		{url:"Power_update.html",text:"修改权限",icon:"images/Power_update.png"}
	]},
    { isexpand: "false", text: "数据库管理",icon:"icon/database.png",children:[
        {url:"Power_insert.html",text:"添加权限",icon:"images/Power_insert.png"},
        {url:"Power_select.html",text:"查看权限",icon:"images/Power_select.png"},
        {url:"Power_update.html",text:"修改权限",icon:"images/Power_update.png"}
    ]},
];