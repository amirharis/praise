class Praise.Views.BaseAdminDirectories extends Backbone.View
	template: JST['admin_directories/index']

	render: ->
		$( @el ).html( @template() )
		this

	sectorList: =>
		sectors = new Backbone.Collection()
		sectors.url = '/admin/directories/sectors'
		sectors.fetch
			success: ->
				view = new Praise.Views.SectorList(sectors: sectors)
				#alert("appliances is Model ? " + (appliances instanceof Backbone.Model));
				$('#main_div').html( view.render().el )
				$(".sectors").chosen()
				loadDt()
			error: ->
				alert "error"

	divisionList: (opts = {}) =>
		opts.id ?= ""
		divisions = new Backbone.Collection()
		divisions.url = "/admin/directories/divisions?sector_id=#{opts.id}"
		divisions.fetch
			success: ->
				view = new Praise.Views.DivisionList(divisions: divisions)
				#alert("appliances is Model ? " + (appliances instanceof Backbone.Model));
				$('#division_div').html( view.render().el )
				$(".divisions").chosen()
			error: ->
				alert "error"

	sectionList: (opts = {}) =>
		opts.id ?= ""
		sections = new Backbone.Collection()
		sections.url = "/admin/directories/sections?division_id=#{opts.id}"
		sections.fetch
			success: ->
				view = new Praise.Views.SectionList(sections: sections)
				#alert("appliances is Model ? " + (appliances instanceof Backbone.Model));
				$('#section_div').html( view.render().el )
				$(".sections").chosen()
			error: ->
				alert "error"

	unitList: (opts = {}) =>
		opts.id ?= ""
		units = new Backbone.Collection()
		units.url = "/admin/directories/units?section_id=#{opts.id}"
		units.fetch
			success: ->
				view = new Praise.Views.UnitList(units: units)
				#alert("appliances is Model ? " + (appliances instanceof Backbone.Model));
				$('#unit_div').html( view.render().el )
				$(".units").chosen()
			error: ->
				alert "error"
