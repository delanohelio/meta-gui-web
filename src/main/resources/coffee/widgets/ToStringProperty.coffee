class ToStringProperty extends PropertyWidget

	render: (view, propertyType, property) ->
		view.append property

return new ToStringProperty