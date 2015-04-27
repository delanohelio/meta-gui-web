class SimpleTextFieldProperty extends PropertyWidget

	render: (view) ->
		textField = $("<input>")
		textField.attr "id", @propertyType.name
		value = @property
		if(@propertyType.type == "date")
			value = $.datepicker.formatDate("yy-mm-dd", new Date(@property))
		textField.val(value)
		textField.value =>
			if(@propertyType.type == "integer")
				return parseInt(textField.val())
			if(@propertyType.type == "real")
				return parseFloat(textField.val())
			if(@propertyType.type == "date")
				return new Date(textField.val())
			textField.val()
		view.append textField

return new SimpleTextFieldProperty