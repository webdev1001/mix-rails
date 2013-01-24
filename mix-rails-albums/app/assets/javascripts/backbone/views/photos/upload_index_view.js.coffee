Application.Views.Photos ||= {}

class Application.Views.Photos.UploadIndexView extends Backbone.View
  template: JST["backbone/templates/photos/upload_index"]
  tagName: 'ul'
  className: 'thumbnails'

  initialize: () ->
    @options.photos.bind('reset', @addAll)

  addAll: () =>
    @options.photos.each(@addOne)

  addOne: (photo) =>
    view = new Application.Views.Photos.PhotoView({model : photo})
    @$(".photos-container").append(view.render().el)

  render: =>
    @$el.html(@template(photos: @options.photos.toJSON() ))
    @addAll()

    return this
