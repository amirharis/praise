class Praise.Views.DivisionList extends Backbone.View
	template: JST['admin_directories/division_list']

	events:
		'click #create_division': 'createDivision'
		'change .divisions': 'selectDirectory'

	render: ->
		$( @el ).html( @template(divisions: @options.divisions) )
		this

	createDivision: (e) ->
		e.preventDefault()
		newDivision = new Praise.Views.NewDivision()
		$("#myModal2").html(newDivision.render().el).modal()

	selectDirectory: (e) ->
		e.preventDefault()
		#id = $('.sectors').children(':selected').attr('sector-id')
		id = $('.divisions').children(':selected').attr('division-id')
		Praise.Views.BaseAdminDirectories.prototype.sectionList({id: id})	