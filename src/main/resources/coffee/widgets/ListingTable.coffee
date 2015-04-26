class ListingTable extends EntitySetWidget

	render: (view, entityType, entities) ->
		@drawTable(entityType, entities, view)

	drawTable: (entityType, entities, view) ->
		title = $("<h2>")
		title.append entityType.name
		view.append title 
		addButton = $("<button>")
		addButton.append "Add"
		addButton.click =>
			formWidget = RederingEngine.getWidget entityType, null, 'form'
			formWidget.render View.emptyPage(), entityType
		view.append addButton
		@table = $("<table>")
		view.append @table
		@buildTableHead(entityType.propertiesType, @table);
		@buildTableBody(entityType, entities, @table)

	buildTableHead: (properties, table) ->
		thead = $("<thead>");
		table.append thead
		trHead = $("<tr>");
		trHead.attr "id", "properties"
		thead.append trHead
		properties.forEach (property) ->
			thHead = $("<th>#{property.name}</th>")
			trHead.append thHead

	buildTableBody: (entityType, entities, table) ->
		if(entities.length > 0)
			tbody = $("<tbody>");
			tbody.attr "id", "instances"
			table.append tbody
			entities.forEach (entity) =>
				@buildTableLine(entity, entityType, tbody)
		else
			table.append "There are not instances"

	buildTableLine: (entity, entityType, tbody) ->
		trbody = $("<tr>")
		trbody.attr "id", "instance_" + entity.id
		tbody.append trbody
		entityType.propertiesType.forEach (propertyType) =>
			td  = $("<td>");
			td.attr "id", "entity_" + entity.id + "_property_" + propertyType.name
			widget = RederingEngine.getWidget entityType, propertyType.type, 'property'
			widget.render td, propertyType, entity[propertyType.name]
			trbody.append td
		
		editButton = $("<button>")
		editButton.append "Edit"
		editButton.click =>
			formWidget = RederingEngine.getWidget entityType, null, 'form'
			formWidget.render View.emptyPage(), entityType, entity
		td  = $("<td>");
		td.append editButton
		trbody.append td
		
		deleteButton = $("<button>")
		deleteButton.append "Delete"
		self = this
		deleteButton.on "click", ->
			DataManager.deleteEntity entityType.resource, entity.id, (data) =>
				 self.reloadData(entityType)
			,(status) =>
				alert("Ocorreu algum erro " + status)
		td  = $("<td>");
		td.append deleteButton
		trbody.append td

	reloadData: (entityType) ->
		DataManager.getEntities entityType.resource, (entities) =>
			$("tbody").empty() 
			@buildTableBody(entityType, entities, @table)

return new ListingTable