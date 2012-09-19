class Praise.Views.FormErrors extends Backbone.View
  tagName: 'ol' 

  template: JST['form_errors']

  render: ->
    counter = 0
    for attribute, messages of @collection
      for message in messages
        counter += 1

    $(@el).html(@template(errors: @collection, errors_number: counter))
    this