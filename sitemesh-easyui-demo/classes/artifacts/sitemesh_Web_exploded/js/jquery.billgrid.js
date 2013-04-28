/**
 * $('#dg').billgrid({
 *   createUrl:'',
 *   editUrl:'',
 *   destroyUrl:''
 * });
 */
(function($){
	function buildGrid(target, options){
		var opts = $.extend({}, {
			onDblClickRow:function(){
				$(target).billgrid('edit');
			}
		}, options);
		$(target).datagrid(opts);
	}
	
	var methods = {
		create: function(jq){
			return jq.each(function(){
				var opts = $(this).datagrid('options');
				$('#dlg-bill').dialog('open').dialog('refresh', opts.createUrl);
			});
		},
		edit: function(jq){
			return jq.each(function(){
				var opts = $(this).datagrid('options');
				var row = $(this).datagrid('getSelected');
				if (row){
					$('#dlg-bill').dialog('open').dialog('refresh', opts.editUrl+'?id='+row.id);
				} else {
					$.messager.show({
						title:'警告',
						msg:'请先选择单据后再打开。'
					});
				}
			});
		},
		query: function(jq){
			return jq.each(function(){
				var opts = $(this).datagrid('options');
				var dg = $(this);
				showQueryDialog({
					title:opts.query.title,
					width:opts.query.width,
					height:opts.query.height,
					form:opts.query.form,
					callback:function(data){
						dg.datagrid('load', data);
						if (opts.query.callback){
							opts.query.callback();
						}
					}
				});
			});
		},
		destroy: function(jq){
			return jq.each(function(){
				var dg = $(this);
				var opts = dg.datagrid('options');
				var row = dg.datagrid('getSelected');
				if (row){
					$.messager.confirm('警告','是否真的删除该单据？',function(r){
						if (r){
							$.post(opts.destroyUrl, {id:row.id}, function(result){
								if (result.success){
									dg.datagrid('reload');
								} else {
									$.messager.show({
										title:'警告',
										msg:result.msg
									});
								}
							});
						}
					});
				} else {
					$.messager.show({
						title:'警告',
						msg:'请先选择单据后再进行删除。'
					});
				}
			});
		}
	};
	
	$.fn.billgrid = function(options, param){
		if (typeof options == 'string'){
			var method = methods[options];
			if (method){
				return method(this, param);
			} else {
				return this.datagrid(options, param);
			}
		}
		
		options = options || {};
		return this.each(function(){
			buildGrid(this, options);
		});
	};
})(jQuery);