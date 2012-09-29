class Praise.Views.NewDivision extends Backbone.View
	template: JST['admin_directories/new_division']

	events:
		'click #submit': 'saveData'
		'submit': 'saveData'

	render: ->
		$( @el ).html( @template() )
		this

	saveData: (e) ->
		e.preventDefault()
		division = new Backbone.Model()
		division.url = '/admin/directories/create_division'
		attributes =
			division_name: $("#division_name").val()
			sector_id: $('.sectors').children(':selected').attr('sector-id')
		division.save attributes,
			beforeSend: sendAuthentication
			wait: true
			success: ->
				$("#myModal2").modal("hide")
				#$('.table > tbody:last').prepend("<tr><td><input type='checkbox' value='#{user.get('id')}' name='user[]' id='#{user.get('id')}' class='case'></td><td>#{user.get('name')}</td><td>#{user.get('ic_number')}</td><td>#{user.get('email')}</td><td></td></tr>")
				Praise.Views.BaseAdminDirectories.prototype.divisionList({id: $('.sectors').children(':selected').attr('sector-id')})
				$.sticky("Data telah berjaya disimpan", {autoclose : 10000, position: "top-right", type: "st-success" });
			#error: @handleError
			error: (entry, response) =>
				handleError(entry, response)