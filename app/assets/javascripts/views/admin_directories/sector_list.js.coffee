class Praise.Views.SectorList extends Backbone.View
	template: JST['admin_directories/sector_list']

	events:
		'click #create_sector': 'createSector'
		'change .sectors': 'selectDirectory'

	render: ->
		$( @el ).html( @template(sectors: @options.sectors) )
		this

	createSector: (e) ->
		e.preventDefault()
		newSector = new Praise.Views.NewSector()
		$("#myModal2").html(newSector.render().el).modal()

	selectDirectory: (e) ->
		e.preventDefault()
		id = $('.sectors').children(':selected').attr('sector-id')
		Praise.Views.BaseAdminDirectories.prototype.divisionList({id: id})	