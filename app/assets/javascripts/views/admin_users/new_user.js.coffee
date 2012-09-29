class Praise.Views.NewUser extends Backbone.View
	template: JST['admin_users/new_user']

	events:
		#'click .cancel': 'closeForm'
		'submit #submit': 'saveData'

	render: ->
		$( @el ).html( @template() )
		this

	saveData: (e) ->
		e.preventDefault()
		user = new Praise.Models.AdminUser( )
		attributes =
			name: $("#name").val()
			ic_number: $("#ic_number").val()
			email: $("#email").val()
			password: $("#password").val()
			password_confirmation: $("#password_confirmation").val()
		user.save attributes,
			beforeSend: sendAuthentication
			wait: true
			success: ->
				$("#myModal2").modal("hide")
				$.ajax
					url: "/admin/users/render_users"
					async: false
				#$('.table > tbody:last').prepend("<tr><td><input type='checkbox' value='#{user.get('id')}' name='user[]' id='#{user.get('id')}' class='case'></td><td>#{user.get('name')}</td><td>#{user.get('ic_number')}</td><td>#{user.get('email')}</td><td></td></tr>")
				$('.table > tbody tr:first').effect("highlight", {}, 8000);
				$.sticky("Data telah berjaya disimpan", {autoclose : 10000, position: "top-right", type: "st-success" });
			#error: @handleError
			error: (entry, response) =>
				handleError(entry, response)

	#handleError: (entry, response) ->
	#	if response.status == 422
	#		errors = $.parseJSON(response.responseText)
	#		for attribute, messages of errors
	#			alert "#{attribute} #{message}" for message in messages

	#sendAuthentication = (xhr) ->
	#	xhr.setRequestHeader "X-CSRF-Token", $("meta[name=\"csrf-token\"]").attr("content")


		
		