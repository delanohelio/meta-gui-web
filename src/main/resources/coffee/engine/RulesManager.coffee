window.RulesManager = {}

RulesManager.STORAGE_TAG = "RULES"

RulesManager.downloadAllRules = () ->
	$.getJSON HOST + 'rules', (rules) =>
		rules.forEach (rule) =>
			key = RulesManager.STORAGE_TAG + rule.providedContextName
			if(rule.propertyTypeTypeLocator != null)
				key += rule.propertyTypeTypeLocator
			simpleStorage.set(key, rule)

RulesManager.getRule = (context, propertyTypeTypeLocator) ->
	rule = simpleStorage.get(RulesManager.STORAGE_TAG + context + propertyTypeTypeLocator)
	if(typeof rule == "undefined")
		rule = simpleStorage.get(RulesManager.STORAGE_TAG + context)
	rule

