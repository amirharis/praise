class Praise.Views.NewSection extends Backbone.View
	template: JST['admin_directories/new_section']

	events:
		'click #submit': 'saveData'

	render: ->
		$( @el ).html( @template() )
		this

	saveData: (e) ->
		e.preventDefault()
		section = new Backbone.Model()
		section.url = '/admin/directories/create_section'
		attributes =
			section_name: $("#section_name").val()
			division_id: $('.divisions').children(':selected').attr('division-id')
		section.save attributes,
			beforeSend: sendAuthentication
			wait: true
			success: ->
				$("#myModal2").modal("hide")
				#$('.table > tbody:last').prepend("<tr><td><input type='checkbox' value='#{user.get('id')}' name='user[]' id='#{user.get('id')}' class='case'></td><td>#{user.get('name')}</td><td>#{user.get('ic_number')}</td><td>#{user.get('email')}</td><td></td></tr>")
				Praise.Views.BaseAdminDirectories.prototype.sectionList({id: $('.divisions').children(':selected').attr('division-id')})
				$.sticky("Data telah berjaya disimpan", {autoclose : 10000, position: "top-right", type: "st-success" });
			#error: @handleError
			error: (entry, response) =>
				handleError(entry, response)