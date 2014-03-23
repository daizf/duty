
<%@ include file="../commonHeader.jsp"%>

<html lang="en">
<html>
<head>
    <title>签到管理</title>

    <style type="text/css">
        .mt15 {
            margin-top: 15px;
        }

    </style>

    <script type="text/javascript">
        function checkForm(){
            if($("#dayCheckbox")[0].checked) {
                $("#day")[0].value = true;
            } else {
                $("#day")[0].value = false;
            }

            if($("#monthCheckbox")[0].checked) {
                $("#month")[0].value = true;
            } else {
                $("#month")[0].value = false;
            }

            if($("#yearCheckbox")[0].checked) {
                $("#year")[0].value = true;
            } else {
                $("#year")[0].value = false;
            }
            return true;
        }

        function retrieveData( sSource, aoData, fnCallback ) {
            // 将客户名称加入参数数组
            //aoData.push( { "name": "customerName", "value": "asdas" } );//添加自己的额外参数
            if($("#name").val()) {
                aoData.push( { "name": "filter['name']", "value": $("#name").val() } );
            }
            if($("#servicePlaceId").val()) {
                aoData.push( { "name": "filter['servicePlaceId']", "value": $("#servicePlaceId").val() } );
            }
            $.ajax( {
                "type": "post",
                "url": sSource,
                "dataType": "json",
                "data": aoData,
                "success": function(resp) {
                    fnCallback(resp);
                }
            });
        }

        $(document).ready(function(){
            $("#activeTimeTable").dataTable({
                "bSort": false,
                "bFilter": false,
                "bLengthChange": false,
                "iDisplayLength":10,
                "bPaginate": true,
                "oLanguage": {
                    "sProcessing": "正在加载中......",
                    "sLengthMenu": "每页显示 _MENU_ 条记录",
                    "sZeroRecords": "对不起，查询不到相关数据！",
                    "sEmptyTable": "表中无数据存在！",
                    "sInfo": "当前显示 _START_ 到 _END_ 条, 共 _TOTAL_ 条记录",
                    "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
                    "sSearch": "搜索",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上一页",
                        "sNext": "下一页",
                        "sLast": "末页"
                    }
                },
                'aaSorting':[ [1,'asc'],[2,'asc'] ],
                'aoColumns':[
                    {'sTitle':'姓名', 'mDataProp':'name'},
                    <s:if test="day==true">
                        {'sTitle':'当日累计工时', 'mDataProp':'dayHours'},
                    </s:if>
                    <s:if test="month==true">
                        {'sTitle':'当月累计工时', 'mDataProp':'monthHours'},
                    </s:if>
                    <s:if test="year==true">
                        {'sTitle':'当年累计工时', 'mDataProp':'yearHours'},
                    </s:if>
                    {'sTitle':'总累计工时', 'mDataProp':'totalHours'}
                ],
                "bServerSide": true,
                "sAjaxSource": "backend/report/activeTimeReportData.action",
                "fnServerData": retrieveData
            });
        });
    </script>
</head>
<body>
<section class="panel">
    <header class="panel-heading">
        工时实时统计
    </header>

    <div class="panel-body">
        <div class="adv-table dataTables_wrapper form-inline">
            <form class="form-horizontal filter-panel" method="post" action="backend/report/activeTimeReport.action" onsubmit="return checkForm()">
                <input type="hidden" id="day" name="day" value="<s:property value='day'/>">
                <input type="hidden" id="month" name="month" value="<s:property value='year'/>">
                <input type="hidden" id="year" name="year" value="<s:property value='year'/>">
                <div class="row mt15">
                    <div class="col-lg-2 col-md-2 filter-column">
                        <label class="pull-left control-label" for="servicePlaceId">地点</label>

                        <div class="col-lg-9 col-md-9 filter-component-column">
                            <select class="form-control input-sm m-bot15" name="servicePlaceId" id="servicePlaceId">
                                <option value="">请选择</option>
                                <s:iterator value="servicePlaces" var="bean">
                                    <option value="<s:property value='%{#bean.id}'/>"
                                            <s:if test="servicePlaceId == #bean.id">
                                                selected
                                            </s:if>
                                        ><s:property value="%{#bean.name}"/></option>
                                </s:iterator>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-2 filter-column">
                        <label class="pull-left control-label" for="name">姓名</label>

                        <div class="col-lg-9 col-md-9 filter-component-column">
                            <input type="text" value="<s:property value='name'/>" placeholder="姓名" class="form-control input-sm filter-component" name="name" id="name">
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 filter-column">
                        <label class="pull-left control-label" >范围</label>

                        <div class="col-lg-9 col-md-9 filter-component-column">
                            <label class="checkbox-inline">
                                <s:if test="day==true">
                                    <input type="checkbox" checked id="dayCheckbox"> 日
                                </s:if>
                                <s:else>
                                    <input type="checkbox" id="dayCheckbox"> 日
                                </s:else>
                            </label>
                            <label class="checkbox-inline">
                                <s:if test="month==true">
                                    <input type="checkbox" checked id="monthCheckbox"> 月
                                </s:if>
                                <s:else>
                                    <input type="checkbox" id="monthCheckbox"> 月
                                </s:else>
                            </label>
                            <label class="checkbox-inline">
                                <s:if test="year==true">
                                    <input type="checkbox" checked id="yearCheckbox"> 年
                                </s:if>
                                <s:else>
                                    <input type="checkbox" id="yearCheckbox"> 年
                                </s:else>
                            </label>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3">
                        <button class="btn btn-default pull-right" type="submit">
                            查询
                        </button>
                    </div>
                </div>
            </form>

            <table cellspacing="0" cellpadding="0" border="0" class="mt15 table table-striped table-advance table-hover table-bordered" id="activeTimeTable">
                <thead>
                    <tr>

                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</section>
</body>