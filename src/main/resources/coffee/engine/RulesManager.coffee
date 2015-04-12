window.RulesManager = {}

RulesManager.STORAGE_TAG = "RULES"

RulesManager.downloadAllRules = () ->
	$.getJSON 'http://localhost:8081/rules', (rules) =>
		rules.forEach (rule) =>
			simpleStorage.set(RulesManager.STORAGE_TAG + rule.providedContext.name, rule)

RulesManager.getRule = (context) ->
	return simpleStorage.get(RulesManager.STORAGE_TAG + context)