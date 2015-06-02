class NumberFormatter extends PropertyWidget

	render: (view) ->
		if(@configuration.editable)
			textField = $("<input>")
			view.append @property
		else
			format = @configuration.format
			view.append @property
			

if(!window.jqueryMask)
	$.getScript "https://dl.dropboxusercontent.com/u/14874989/mestrado/metaguiweb/js/jquery.mask.min.js", () =>
		window.jqueryMask = true
return new NumberFormatter