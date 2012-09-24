class Praise.Views.UnitList extends Backbone.View
	template: JST['admin_directories/unit_list']

	events:
		'click #create_unit': 'createUnit'
		'change .units': 'selectDirectory'

	render: ->
		$( @el ).html( @template(units: @options.units) )
		this

	createUnit: (e) ->
		e.preventDefault()
		newUnit = new Praise.Views.NewUnit()
		$("#myModal2").html(newUnit.render().el).modal()

	selectDirectory: (e) ->
		e.preventDefault()
		#id = $('.sectors').children(':selected').attr('sector-id')
		#Praise.Views.BaseAdminDirectories.prototype.unitList()	