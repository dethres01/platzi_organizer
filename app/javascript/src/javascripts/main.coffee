window.PLATZI =
  init: ->
    console.log 'made with love by Platzi'
    return
  tasks:
    index:
     setup: ->
      console.log 'in the index page'
      return

$(document).on 'turbolinks:load', ->
  PLATZI.init()