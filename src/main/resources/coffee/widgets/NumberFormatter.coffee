class NumberFormatter extends PropertyWidget

	render: (view) ->
		if(@configuration.editable)
			textField = $("<input>")
			textField.mask(@configuration.format)
			textField.val(@property)
		else
			format = @configuration.format
			view.append @property
			

return new NumberFormatter