class ListingTable extends EntitySetWidget

	render: (view, entityType, entites, configuration) ->
		@drawTable(entityType, entites, view)

	drawTable: (entityType, entites, view) ->
		title = $("<h2>")
		title.append entityType.name
		view.append title 
		table = $("<table>")
		view.append table
		@buildTableHead(entityType.properties, table);
		@buildTableBody(entityType, entites, table)

	buildTableHead: (properties, table) ->
		thead = $("<thead>");
		table.append thead
		trHead = $("<tr>");
		trHead.attr "id", "properties"
		thead.append trHead
		properties.forEach (property) ->
			thHead = $("<th>#{property.name}</th>")
			trHead.append thHead

	buildTableBody: (entityType, entites, table) ->
		if(entites.length > 0)
			tbody = $("<tbody>");
			tbody.attr "id", "instances"
			table.append tbody
			entites.forEach (entity) =>
				@buildTableLine(entity, entityType, tbody)
		else
			table.append "There are not instances"

	buildTableLine: (entity, entityType, tbody) ->
		trbody = $("<tr>")
		trbody.attr "id", "instance_" + entity.id
		tbody.append trbody
		entityType.properties.forEach (property) =>
			td  = $("<td>");
			td.attr "id", "entity_" + entity.id + "_property_" + property.name
			td.append entity[property.name]
			trbody.append td
		
		deleteButton = $("<button>")
		deleteButton.append "Delete"
		deleteButton.on "click", ->
  			DataManager.deleteEntity entityType.resource, entity.id, (data) =>
  				RederingEngine.peformContext(View.emptyPage(), entityType, 'root')
  			,(status) =>
  				alert("Ocorreu algum erro " + status)
  		td  = $("<td>");
  		td.append deleteButton
  		trbody.append td

return new ListingTable