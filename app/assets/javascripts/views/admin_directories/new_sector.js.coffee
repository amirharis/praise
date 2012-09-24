class Praise.Views.NewSector extends Backbone.View
	template: JST['admin_directories/new_sector']

	events:
		'click #submit': 'saveData'

	render: ->
		$( @el ).html( @template() )
		this

	saveData: (e) ->
		e.preventDefault()
		sector = new Backbone.Model()
		sector.url = '/admin/directories/create_sector'
		attributes =
			sector_name: $("#sector_name").val()
		sector.save attributes,
			beforeSend: sendAuthentication
			wait: true
			success: ->
				$("#myModal2").modal("hide")
				#$('.table > tbody:last').prepend("<tr><td><input type='checkbox' value='#{user.get('id')}' name='user[]' id='#{user.get('id')}' class='case'></td><td>#{user.get('name')}</td><td>#{user.get('ic_number')}</td><td>#{user.get('email')}</td><td></td></tr>")
				Praise.Views.BaseAdminDirectories.prototype.sectorList()
				$.sticky("Data telah berjaya disimpan", {autoclose : 10000, position: "top-right", type: "st-success" });
			#error: @handleError
			error: (entry, response) =>
				handleError(entry, response)