class Praise.Routers.User extends Backbone.Router
  routes: {
    'user/profile': 'profile'
  }

  profile: ->
    user = new Backbone.Model()
    user.url = '/user/profile'
    user.fetch
      success: ->
        view = new Praise.Views.SelfProfile(user: user)
        $('.main_content').html(view.render().el)
      error: ->
        alert "Ralat! sila cuba lagi."
