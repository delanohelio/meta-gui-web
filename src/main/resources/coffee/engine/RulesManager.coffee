window.RulesManager = {}

RulesManager.STORAGE_TAG = "RULES"

RulesManager.downloadAllRules = () ->
	$.getJSON 'http://localhost:8081/rules', (rules) =>
		rules.forEach (rule) =>
			simpleStorage.set(RulesManager.STORAGE_TAG + rule.providedContext.name + rule.propertyTypeTypeLocator, rule)

RulesManager.getRule = (context, propertyTypeTypeLocator) ->
	console.log("opa")
	rule = simpleStorage.get(RulesManager.STORAGE_TAG + context + propertyTypeTypeLocator)
	if(typeof rule == "undefined")
		rule = simpleStorage.get(RulesManager.STORAGE_TAG + context)
	return rule

