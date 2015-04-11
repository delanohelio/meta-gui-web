class ListingTable extends EntitySetWidget

	render: (view, entityType, entites, conf) ->
		@drawTable(entityType, entites, view)

	drawTable: (entityType, entites, view) ->
		@page = view
		table = $("<table>")
		@page.append table
		@buildTableHead(entityType.properties, table);
		@buildTableBody(entityType.properties, entites, table)

	buildTableHead: (properties, table) ->
		thead = $("<thead>");
		table.append thead
		trHead = $("<tr>");
		trHead.attr "id", "properties"
		thead.append trHead
		properties.forEach (property) ->
			thHead = $("<th>#{property.name}</th>")
			trHead.append thHead

	buildTableBody: (properties, entites, table) ->
		if(entites.length > 0)
			tbody = $("<tbody>");
			tbody.attr "id", "instances"
			table.append tbody
			entites.forEach (entity) =>
				@buildTableLine(entity, properties, tbody)
		else
			table.append "There are not instances"

	buildTableLine: (entity, properties, tbody) ->
		trbody = $("<tr>")
		trbody.attr "id", "instance_" + instance.id
		tbody.append trbody
		properties.forEach (property) =>
			td  = $("<td>");
			td.attr "id", "entity_" + entity.id + "_property_" + property.name
			td.append entity[property.name]
			trbody.append td

return new ListingTable