class Praise.Routers.AdminUsers extends Backbone.Router
	routes: {
    'admin/users': 'index'
    'admin/users/:id': 'show'
  }

  initialize: ->
    @collection = new Praise.Collections.AdminUsers()
    @collection.fetch()

  index: ->
    if $("#users_content").length > 0
      view = new Praise.Views.BaseAdminUsers(collection: @collection, content: true)
      render = $('#users_content').html(view.render().el)
    else
      view = new Praise.Views.BaseAdminUsers(collection: @collection, content: false)
      render = $('.main_content').html(view.render().el)
      $.when(render).then(@render_users)
    #  url = "/admin/users"    
    #  $(location).attr('href',url);

  render_users: ->
  	$.ajax
      url: "/admin/users/render_users"
      async: false

  show: (id) ->
    #alert JSON.stringify(@collection)
    #alert id
    #model = @collection.where({id: id});
    #alert JSON.stringify(model)
    view = new Praise.Views.UserProfile(id: id)
    $('.main_content').html(view.render().el)
