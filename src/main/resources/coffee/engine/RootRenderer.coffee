class window.RootRenderer

	render: (view, entitesType) ->
		table = $("<table>")
		view.append table
		th = $("<tr><th>Entities</th></tr>")
		th.attr "id", "entities"
		table.append th
		entitesType.forEach (entity) =>
			@drawLine(table, entity)

	drawLine: (table, entity) ->
		tr = $("<tr><td>#{entity.name}</td></tr>")
		tr.attr "id", "entity_" + entity.name
		table.append tr
		tr.click =>
			RederingEngine.peformContext View.emptyPage(), entity, 'root'

