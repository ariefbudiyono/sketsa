$(function(){
	// Checkbox
	$('.check').iCheck({ checkboxClass: 'icheckbox_square-blue',radioClass: 'iradio_square-blue' });

	// Breadceumb script
	$('#addBreadcrumb').click(function() {
		var breadcrumbItem = $('.form-breadcrumb:last').clone();
		breadcrumbItem.children().children().val('');
		breadcrumbItem.insertAfter('.form-breadcrumb:last');		
		$('.remove-crumb').click(function() {
			$(this).parent().parent().remove();
		});
	});
	$('.remove-crumb').click(function() {
		$(this).parent().parent().remove();
	});

	// Relation 1-n script
	$('#addRelation1').click(function(){
		var formRelation1 = $('.form-relation1:last').clone();
		formRelation1.children().children().val('');
		formRelation1.insertAfter('.form-relation1:last');
		$('.remove-relation-1').click(function() {
			$(this).parent().parent().remove();
		});
	});
	$('.remove-relation-1').click(function() {
		$(this).parent().parent().remove();
	});

	// Ajax get list field 
	$('#field-table_name').change(function() {
		$.get(site + '/myigniter/get_list_fields/' + $(this).val(), function(data) {
			$('.listTables').html(data);
			$('.chosen-select').trigger('chosen:updated');
		});
	});

	// Ajax export to PHP
	$('.btn-php').click(function() {
		var id = $(this).data('id');
		var builder = $(this).data('builder');
		$.get(site + '/myigniter/export_php/' + id + '/' + builder, function(data) {
			$('#PHPCode').html(data);
		});
	});
});