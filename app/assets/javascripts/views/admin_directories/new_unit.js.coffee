class Praise.Views.NewUnit extends Backbone.View
	template: JST['admin_directories/new_unit']

	events:
		'submit': 'saveData'

	render: ->
		$( @el ).html( @template() )
		this

	saveData: (e) ->
		e.preventDefault()
		unit = new Backbone.Model()
		unit.url = '/admin/directories/create_unit'
		attributes =
			unit_name: $("#unit_name").val()
			section_id: $('.sections').children(':selected').attr('section-id')
		unit.save attributes,
			beforeSend: sendAuthentication
			wait: true
			success: ->
				$("#myModal2").modal("hide")
				#$('.table > tbody:last').prepend("<tr><td><input type='checkbox' value='#{user.get('id')}' name='user[]' id='#{user.get('id')}' class='case'></td><td>#{user.get('name')}</td><td>#{user.get('ic_number')}</td><td>#{user.get('email')}</td><td></td></tr>")
				Praise.Views.BaseAdminDirectories.prototype.unitList({id: $('.sections').children(':selected').attr('section-id')})
				$.sticky("Data telah berjaya disimpan", {autoclose : 10000, position: "top-right", type: "st-success" });
			#error: @handleError
			error: (entry, response) =>
				handleError(entry, response)