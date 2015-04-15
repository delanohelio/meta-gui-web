class DateFormatterWidget extends PropertyWidget

	render: (view, propertyType, property) ->
		view.append moment(new Date(property)).format(@configuration)

return new DateFormatterWidget