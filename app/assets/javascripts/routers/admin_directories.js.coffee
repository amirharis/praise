class Praise.Routers.AdminDirectories extends Backbone.Router
	routes: {
		'admin/directories': 'index'
	}


  #initialize: ->

	index: =>
		view = new Praise.Views.BaseAdminDirectories()
		#alert("appliances is Model ? " + (appliances instanceof Backbone.Model));
		$('.main_content').html( view.render().el )
		Praise.Views.BaseAdminDirectories.prototype.sectorList()
		