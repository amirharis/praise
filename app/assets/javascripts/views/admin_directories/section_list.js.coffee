class Praise.Views.SectionList extends Backbone.View
	template: JST['admin_directories/section_list']

	events:
		'click #create_section': 'createSection'
		'change .sections': 'selectDirectory'

	render: ->
		$( @el ).html( @template(sections: @options.sections) )
		this

	createSection: (e) ->
		e.preventDefault()
		newSection = new Praise.Views.NewSection()
		$("#myModal2").html(newSection.render().el).modal()

	selectDirectory: (e) ->
		e.preventDefault()
		id = $('.sections').children(':selected').attr('section-id')
		Praise.Views.BaseAdminDirectories.prototype.unitList({id: id})	