class Praise.Views.UserProfile extends Backbone.View
	template: JST['admin_users/user_profile']

	events:
		'click #admin_users_page': 'admin_users_page'
		'submit': 'saveData'
		'click #change_password': 'change_password'

	initialize: ->
		@user = new Praise.Models.AdminUser({id: @options.id})
		@user.fetch({async:false})

	render: ->
		#alert JSON.stringify(@user)
		$( @el ).html( @template(user: @user) )
		this

	admin_users_page: (e) ->
		e.preventDefault()
		Backbone.history.navigate("admin/users", true)

	change_password: (e) ->
		e.preventDefault()
		changePassword = new Praise.Views.ChangePassword(user: @user, user_id: $("#ic_number").val())
		$("#myModal2").html(changePassword.render().el).modal()

	saveData: (e) ->
		e.preventDefault()
		user = new Praise.Models.AdminUser(id: @user.get('id'))
		attributes =
			name: $("#name").val()
			ic_number: $("#ic_number").val()
			email: $("#email").val()
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
				$('#user_id').html("<strong>#{$("#ic_number").val()}</strong>")
				$("#name").val($("#name").val().toUpperCase())
				$.sticky("Data telah berjaya dikemaskini", {autoclose : 10000, position: "top-right", type: "st-success" });
			#error: @handleError
			error: (entry, response) =>
				handleError(entry, response)
