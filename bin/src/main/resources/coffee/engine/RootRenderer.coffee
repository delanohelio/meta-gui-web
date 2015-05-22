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
			widget = RenderingEngine.getEntitySetWidget 'root', entityType 
			DataManager.getEntityType entityType.id, (entityTypeFull) =>
				widget.entityType = entityTypeFull
				widget.render View.emptyPage()

