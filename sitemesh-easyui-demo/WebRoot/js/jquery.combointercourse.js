/**
 * 选择往来单位的组合表格
 */
(function($){
	$.fn.combointercourse = function(options){
		options = options || {};
		return this.each(function(){
			var opts = $.extend({
				panelWidth:500,
				idField:'id',
				textField:'shortName',
				mode:'remote',
				pagination:true,
				fit:true,
				fitColumns:true,
				columns:[[
					  {field:'intercourseTypeId',title:'类别',width:80,sortable:true,
						  formatter:function(value,row){
							  if (row.intercourseType){
								  return row.intercourseType.name;
							  } else {
								  return value;
							  }
						  }
					  },
					  {field:'code',title:'单位编码',width:60,sortable:true},
					  {field:'shortName',title:'单位名称',width:150,sortable:true},
					  {field:'contactMan',title:'联系人',width:60,sortable:true},
					  {field:'answerMan',title:'负责人',width:60,sortable:true}
				]]
			}, options);
			
			$(this).combogrid(opts);
		});
	};
})(jQuery);