class Praise.Views.SelfProfile extends Backbone.View
	template: JST['user/self_profile']

	events:
		'click #submit': 'saveData'
		'submit': 'saveData'
		'click #change_password': 'change_password'

	render: ->
		#alert JSON.stringify(@user)
		$( @el ).html( @template(user: @options.user) )
		this

	change_password: (e) ->
		e.preventDefault()
		changePassword = new Praise.Views.SelfPassword(user: @options.user)
		$("#myModal2").html(changePassword.render().el).modal()

	saveData: (e) ->
		e.preventDefault()
		user = new Backbone.Model(id: 0)
		user.url = "/user/update_profile"
		attributes =
			email: $("#email").val()
			name: $("#user_data").data('user').name
			ic_number: $("#user_data").data('user').ic_number
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
				@$("ol").remove()
				$.sticky("Data telah berjaya dikemaskini", {autoclose : 10000, position: "top-right", type: "st-success" });
			#error: @handleError
			error: (entry, response) =>
				handleError(entry, response)