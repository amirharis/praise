class Praise.Views.BaseAdminUsers extends Backbone.View
	template: JST['admin_users/base_admin_users']

	events:
		'click #create_user': 'create_user'
		'click #delete_users': 'delete_users'
		'keyup #users_search input': 'users_search'
		'click .show_user': 'show_user'

	initialize: ->
    	@collection.on('reset', @render, this)

	render: ->
		$( @el ).html( @template(users: @collection, content: @options.content) )
		this

	show_user: (e) ->
		e.preventDefault()
		Backbone.history.navigate("admin/users/#{ $(e.currentTarget).attr("id") }", true)
		#Backbone.history.navigate("entries/#{@model.get('id')}", true)

	create_user: (e) ->
		e.preventDefault()
		#$('.table > tbody:last').prepend('<tr id="rock"><td></td><td>AHMAD ADAM IQBAL AMIR HARIS</td><td>890203035567</td><td>adam@localhost.my</td><td>xxxx</td></tr>')
		#$('.table > tbody tr:first').effect("highlight", {}, 8000);
		newUser = new Praise.Views.NewUser()
		$("#myModal2").html(newUser.render().el).modal()

	users_search: (e) ->
		e.preventDefault()
		$.get $("#users_search").attr("action"), $("#users_search").serialize(), null, "script"
		false

	delete_users: (e) ->
		e.preventDefault()
		smoke.confirm "Adakah anda pasti?", (e) ->
			if e
				#smoke.alert "\"yeah it is\" pressed"
				#$(e.currentTarget).closest("tr").find("input").attr("checked", true)
				Praise.Views.BaseAdminUsers.prototype.delete_process()
			else
				#smoke.alert "\"no way\" pressed"
				false

	delete_process: ->
		$.ajax
			url: "/admin/users/delete_users"
			data: $(".users_list input:checked").serialize()
			success: ->
				$.sticky("Data telah berjaya dipadam", {autoclose : 10000, position: "top-right", type: "st-success" });
			#$("#hosts_dttb").dataTable().fnDraw()
			#$(".delete_all_host").prop("checked", false)
			#$(".host_count").text( Number( $(".host_count").text() ) - Number( $(".host_list input:checked").length ) )
			#show_notice("Subdomain deleted.")
		
			