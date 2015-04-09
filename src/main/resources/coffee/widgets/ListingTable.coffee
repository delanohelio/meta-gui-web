class ListingTable extends EntitySetWidget

	render: (view, entityType, entites, conf) ->
		table = $("<table>")
		view.append table
		th = $("<tr><th>Entities</th></tr>")
		th.attr "id", "entities"
		table.append th
		entities.forEach (entity) =>
			@drawLine(table, entity)

	drawLine: (table, entity) ->
		tr = $("<tr><td>#{entity.name}</td></tr>")
		tr.attr "id", "entity_" + entity.name
		table.append tr

return new TableRootRenderer