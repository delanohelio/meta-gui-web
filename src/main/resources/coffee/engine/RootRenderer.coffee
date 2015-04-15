class window.RootRenderer

	render: (view, entitesType) ->
		table = $("<table>")
		view.append table
		th = $("<tr><th>Entities</th></tr>")
		th.attr "id", "entities"
		table.append th
		entitesType.forEach (entityType) =>
			@drawLine(table, entityType)

	drawLine: (table, entityType) ->
		tr = $("<tr><td>#{entityType.name}</td></tr>")
		tr.attr "id", "entityType_" + entityType.name
		table.append tr
		tr.click =>
			widget = RederingEngine.getWidget entityType, null, 'root'
			DataManager.getEntityType entityType.id, (entityTypeFull) =>
				DataManager.getEntities entityTypeFull.resource, (entities) =>
					widget.render View.emptyPage(), entityTypeFull, entities

