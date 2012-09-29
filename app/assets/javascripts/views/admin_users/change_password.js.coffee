class Praise.Views.ChangePassword extends Backbone.View
	template: JST['admin_users/change_password']

	events:
		'click #submit_save_password': 'savePassword'
		'submit': 'savePassword'

	render: ->
		$( @el ).html( @template(user: @options.user, user_id: @options.user_id) )
		this


	savePassword: (e) ->
		e.preventDefault()
		user = new Praise.Models.AdminUser(id: $("#user_data").data('user').id)
		attributes =
			#name: $("#user_data").data('user').name
			#ic_number: $("#user_data").data('user').ic_number
			#email: $("#user_data").data('user').email
			password: $("#password").val()
			password_confirmation: $("#password_confirmation").val()
			current_password: "skip"
		user.save attributes,
			beforeSend: sendAuthentication
			wait: true
			success: ->
				#$("#myModal2").modal("hide")
				#$.ajax
				#	url: "/admin/users/render_users"
				#	async: false
				#$('.table > tbody:last').prepend("<tr><td><input type='checkbox' value='#{user.get('id')}' name='user[]' id='#{user.get('id')}' class='case'></td><td>#{user.get('name')}</td><td>#{user.get('ic_number')}</td><td>#{user.get('email')}</td><td></td></tr>")
				#$('.table > tbody tr:first').effect("highlight", {}, 8000);
				$("#myModal2").modal("hide")
				$.sticky("Kata laluan telah berjaya dikemaskini", {autoclose : 10000, position: "top-right", type: "st-success" });
			#error: @handleError
			error: (entry, response) =>
				handleError(entry, response)
