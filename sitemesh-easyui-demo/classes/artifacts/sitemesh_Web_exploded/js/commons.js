function showQueryDialog(options){
	var opts = options || {};
	var dlg = $('#dlg-query');
	if (!dlg.length){
		dlg = $('<div id="dlg-query"></div>').appendTo('body');
		dlg.dialog({
			title:opts.title||'高级查询',
			width:opts.width||400,
			height:opts.height||300,
			closed:true,
			modal:true,
			href:opts.form,
			buttons:[{
				text:'查询',
				iconCls:'icon-search',
				handler:function(){
					dlg.dialog('close');
					var param = {};
					dlg.find('.query').each(function(){
						var name = $(this).attr('name');
						var val = $(this).val();
						if ($(this).hasClass('datebox-f')){
							name = $(this).attr('comboname');
							val = $(this).datebox('getValue');
						} else if ($(this).hasClass('combogrid-f')){
							name = $(this).attr('comboname');
							val = $(this).combogrid('getValue');
						} else if ($(this).hasClass('combobox-f')){
							name = $(this).attr('comboname');
							val = $(this).combobox('getValue');
						}
						param[name] = val;
					});
					opts.callback(param);
				}
			},{
				text:'取消',
				iconCls:'icon-cancel',
				handler:function(){dlg.dialog('close');}
			}]
		});
	}
	dlg.dialog('open');
}

/**
 * 选择商品资料
 * @param callback:function(rows){}
 * @return
 */
function selectGood(callback){
	var dlg = $('#dlg-selectGood');
	if (!dlg.length){
		dlg = $('<div id="dlg-selectGood"></div>').appendTo('body');
		dlg.dialog({
			title:'选择商品',
			width:800,
			height:400,
			closed:true,
			href:contextPath+'/views/_public/_queryGood.jsp',
			onLoad:function(){
				bindEvents();
			}
		});
	}
	function bindEvents(){
		$('#queryGood-ok').unbind('click').bind('click', function(){
			dlg.dialog('close');
			var rows = $('#queryGood-dt-goods').datagrid('getSelections');
			callback(rows);
			$('#queryGood-dt-goods').datagrid('clearSelections');
		});
	}
	bindEvents();
	dlg.dialog('open');
}

/**
 * 选择采购退货商品资料
 * @param callback
 * @param intercourseId
 * @param depotId
 * @return
 */
function selectGood1(callback, intercourseId, depotId){
	var dlg = $('#dlg-selectGood1');
	if (!dlg.length){
		dlg = $('<div id="dlg-selectGood1"></div>').appendTo('body');
		dlg.dialog({
			title:'选择退货商品',
			width:800,
			height:400,
			closed:true,
			href:contextPath+'/views/_public/_queryGood1.jsp',
			onLoad:function(){
				$('#queryGood-intercourseId').val(intercourseId);
				$('#queryGood-depotId').val(depotId);
				$('#queryGood-dt-goods').datagrid({
					queryParams:{
						intercourseId:intercourseId,
						depotId:depotId,
						dateFrom:$('#queryGood-dateFrom').datebox('getValue'),
						dateTo:$('#queryGood-dateTo').datebox('getValue')
					}
				});
				bindEvents();
			}
		});
	}
	if ($('#queryGood-intercourseId').val() != intercourseId || $('#queryGood-depotId').val() != depotId){
		$('#queryGood-intercourseId').val(intercourseId);
		$('#queryGood-depotId').val(depotId);
		setTimeout(function(){
			$('#queryGood-search').triggerHandler('click');
		}, 0);
	}
	function bindEvents(){
		$('#queryGood-ok').unbind('click').bind('click', function(){
			dlg.dialog('close');
			var rows = $('#queryGood-dt-goods').datagrid('getSelections');
			callback(rows);
			$('#queryGood-dt-goods').datagrid('clearSelections');
		});
	}
	bindEvents();
	dlg.dialog('open');
}

/**
 * 提交单据表单
 * @param submitType 保存类型：0保存，1保存并新建
 * @return
 */
function submitBill(submitType){
	var s = '';
	var rows = $('#dg-details').datagrid('getRows');
	for(var i=0; i<rows.length; i++){
		var row = rows[i];
		s += row.id + ':' + (row.billCount||0) + ':' + (row.billPrice||0) + ':' + (row.billDetailId||'') + ',';
	}
	if (s){
		s = s.substring(0, s.length-1);
	}
	$('#goods').val(s);
	
	$('#fm-bill').form('submit', {
		onSubmit:function(){
			var isValid = $(this).form('validate');
			if (isValid){
				$.messager.progress();
			}
			return isValid;
		},
		success:function(result){
			$.messager.progress('close');
			var result = eval('(' + result + ')');
			if (result.success){
				$('#dg-bills').datagrid('reload');
				var createUrl = $('#dg-bills').datagrid('options').createUrl;
				var editUrl = $('#dg-bills').datagrid('options').editUrl + '?id=' + result.billId;
				$('#dlg-bill').dialog('refresh', (submitType==2 ? createUrl : editUrl));
			} else {
				$.messager.show({
					title:'提示',
					msg:result.msg
				});
			}
		}
	});
}

/**
 * 审核单据
 * @param id 单据ID
 * @return
 */
function checkBill(id){
	$.messager.progress();
	$.post(contextPath+'/bill/checkBill', {id:id}, function(result){
		$.messager.progress('close');
		if (result.success){
			var url = $('#dg-bills').datagrid('options').editUrl + '?id=' + result.billId;
			$('#dg-bills').datagrid('reload');
			$('#dlg-bill').dialog('refresh', url);
		} else {
			$.messager.show({
				title:'提示',
				msg:result.msg
			});
		}
	});
}
