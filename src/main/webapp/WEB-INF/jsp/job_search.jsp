<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>智能职业分析系统</title>
    <link rel="stylesheet" href="/search/layui-v2.2.5/layui/css/layui.css">
    <script type="text/javascript" src="/search/layui-v2.2.5/layui/layui.js" charset="utf-8"/>
    <script type="text/javascript">
        //JavaScript代码区域
        layui.use('element', function () {
            var element = layui.element;

        });
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <a href="/search/index">
            <div class="layui-logo"> 智能职业推荐系统</div>
        </a>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">消息通知<span class="layui-badge">9</span></a></li>
            <li class="layui-nav-item"><a href="">管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:">其它</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    管理员
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="personal%20infonation.html">个人信息</a>
                </li>
                <li class="layui-nav-item">
                    <a href="job%20intension.html">求职意向</a>
                </li>
                <li class="layui-nav-item"><a href="/search/job_search">职位搜索</a></li>
                <li class="layui-nav-item"><a href="company_detail.jsp">公司分析</a></li>
                <li class="layui-nav-item"><a href="recommended%20posts.html">职位推荐</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        </fieldset>
        <div class="layui-container animated fadeInUp" id="search-body">
            <div id="search-operate">
                <div id="search-panel">
                    <div class="select-none layui-row layui-col-space20">
                        <div class="layui-inline layui-col-md-offset2 layui-col-md6 layui-col-sm12 layui-col-xs12">
                            <input id="demoReload" autocomplete="off" class="layui-input search-box"
                                   name="kw" placeholder="请输入信息如:公司名,职位名,福利,工作地点,学历要求"/>

                            <b>热门关键词<i class="layui-icon" style="color: red">&#xe756;</i> </b> &nbsp;&nbsp;&nbsp;<a
                                href="#">大数据</a>&nbsp;&nbsp;&nbsp; <a href="#">数据库</a>
                            &nbsp;&nbsp;&nbsp; <a href="#">Hadoop</a>&nbsp;&nbsp;&nbsp; <a href="#">Java</a>&nbsp;&nbsp;&nbsp;
                            <a href="#">算法</a>
                            &nbsp;&nbsp;&nbsp; <a href="#">分布式</a>&nbsp;&nbsp;&nbsp; <a href="#">SQL</a>

                        </div>

                        <div class="layui-inline layui-col-md3 layui-show-md-inline-block layui-hide-sm layui-hide-xs">
                            <button class="layui-btn" data-type="reload">搜索</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>热门职位</legend>
        </fieldset>
        <table class="layui-hide" id="LAY_table_job" lay-filter="demoEvent"></table>

        <script type="text/javascript" src="/search/layui-v2.2.5/layui/layui.js" charset="utf-8"/>
        <script type="text/javascript">


        </script>

    </div>

    <script>
        layui.use('table', function () {
            var table = layui.table;
            //方法级渲染
            table.render({
                elem: '#LAY_table_job'
                , url: '/search/q'
                , cellMinWidth: 80
                , cols: [[
                    {field: 'jobId', minwidth: 250, sort: true, title: '职位id(点击查看职位详情)', fixed: 'left', event: 'getJobDetail'}
                    , {field: 'jobName', minwidth: 400, title: '工作名字'}
                    , {field: 'companyId', minwidth: 250, title: '公司id(点击查看公司详情)',event: 'getCompanyDetail'}
                    , {field: 'companyName', minwidth: 400, title: '公司名字'}
                    , {field: 'workplace', minwidth: 300, title: '工作地点'}
                    , {field: 'salaryMin', width: 100, sort: true, title: '最低薪水'}
                    , {field: 'salaryMax', width: 100, sort: true, title: '最高薪水'}
                    , {field: 'education', title: '学历要求', width: 20}
                    , {field: 'workexperienceMin', title: '最低工作年限', width: 10}
                    , {field: 'workexperienceMax', title: '最高工作年限', width: 10}
                    , {field: 'ctime', title: '创建时间', sort: true, width: 100}
                    , {field: 'jobNature', title: '工作性质', width: 40}
                    , {field: 'welfare', minwidth: 80, title: '福利'}
                    , {field: 'workcity', title: '工作城市', width: 100}
                    , {field: 'needNum', width: 40, sort: true, title: '需要人数', fixed: 'right'}
                ]]
                , id: 'testReload'
                , page: true
            });

            var $ = layui.$, active = {
                reload: function () {
                    var demoReload = $('#demoReload');
                    //执行重载
                    table.reload('testReload', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: {
                            kw: demoReload.val()
                        }
                    });
                }
            };

            $('.layui-btn').on('click', function () {
                var demoReload = $('#demoReload');
                if (demoReload.val().length == 0) {
                    alert("不能为空");
                    return;
                }
                alert("点击");
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
            $(document).on('keydown', function (e) {

                if (e.keyCode == 13) {
                    var demoReload = $('#demoReload');
                    alert("回车");
                    if (demoReload.val().length == 0) {
                        alert("不能为空");
                        return;
                    }
                    var type = $('.layui-btn').data('type');
                    active[type] ? active[type].call(this) : '';
                }
            });
        });
    </script>
    <script>
        layui.use('table', function () {
            var table = layui.table;
            //监听单元格事件
            table.on('tool(demoEvent)', function (obj) {
                var data = obj.data;
                if (obj.event === 'getJobDetail') {
                    layer.msg('jobID：'+ data.jobId + ' 的查看操作');
                    //接下来进行ajax请求，根据jobid查询job
                    $.post("/getJobDetailUI", { jobId: data.jobId},
                        function(redata){
                            alert("Data Loaded: " + redata);
                        });
                }

                if (obj.event === 'getCompanyDetail') {
                    layer.msg('companyID：'+ data.companyId + ' 的查看操作');
                    //接下来进行ajax的请求，根据companyid查询company
                    $.post("/getCompanyDetailUI", { companyId:data.companyId },
                        function(redata){
                            alert("Data Loaded: " + redata);
                        });
                }
            });
        });
    </script>
    <div class="layui-footer">
        <!-- 底部固定区域-->
        © 969758570@qq.com
    </div>
</div>
</body>
</html>

