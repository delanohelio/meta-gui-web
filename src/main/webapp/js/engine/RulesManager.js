(function() {

  window.RulesManager = {};

  RulesManager.STORAGE_TAG = "RULES";

  RulesManager.downloadAllRules = function() {
    var _this = this;
    return $.getJSON(HOST + 'rules', function(rules) {
      return rules.forEach(function(rule) {
        var key;
        key = RulesManager.STORAGE_TAG + rule.providedContextName;
        if (rule.propertyTypeTypeLocator !== null) {
          key += rule.propertyTypeTypeLocator;
        }
        return simpleStorage.set(key, rule);
      });
    });
  };

  RulesManager.getRule = function(context, propertyTypeTypeLocator) {
    var rule;
    rule = simpleStorage.get(RulesManager.STORAGE_TAG + context + propertyTypeTypeLocator);
    if (typeof rule === "undefined") {
      rule = simpleStorage.get(RulesManager.STORAGE_TAG + context);
    }
    return rule;
  };

}).call(this);
