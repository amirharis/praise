window.Praise =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Praise.Routers.User()
    new Praise.Routers.AdminUsers()
    new Praise.Routers.AdminDirectories()
    Backbone.history.start(pushState: true)

$(document).ready ->
  Praise.init()
