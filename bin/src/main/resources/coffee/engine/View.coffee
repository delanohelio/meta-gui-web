window.View = {}

View.emptyPage = ->
	body  = $("body")
	body.empty()  
	page = $('<div>')
	body.append page
	page
