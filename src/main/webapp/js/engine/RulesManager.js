(function() {
  var _this = this;

  window.RulesManager = {};

  RulesManager.STORAGE_TAG = "RULES";

  RulesManager.SEPARATOR_CHAR = '.';

  RulesManager.stringfyRule = function(rule) {
    var stringRule;
    stringRule = RulesManager.STORAGE_TAG + RulesManager.SEPARATOR_CHAR + rule.providedContext.name;
    if (rule.entityTypeLocator !== null) {
      stringRule += RulesManager.SEPARATOR_CHAR + rule.entityTypeLocator;
    } else {
      stringRule += RulesManager.SEPARATOR_CHAR + '*';
    }
    if (rule.providedContext.type === 'Property' || rule.providedContext.type === 'Relationship') {
      if (rule.propertyTypeLocator !== null) {
        stringRule += RulesManager.SEPARATOR_CHAR + rule.propertyTypeLocator;
      } else {
        stringRule += RulesManager.SEPARATOR_CHAR + '*';
      }
      if (rule.propertyTypeTypeLocator !== null) {
        stringRule += RulesManager.SEPARATOR_CHAR + rule.propertyTypeTypeLocator;
      } else {
        stringRule += RulesManager.SEPARATOR_CHAR + '*';
      }
      if (rule.providedContext.type === 'Relationship') {
        if (rule.relationshipTargetCardinality !== null) {
          stringRule += RulesManager.SEPARATOR_CHAR + rule.relationshipTargetCardinality;
        } else {
          stringRule += RulesManager.SEPARATOR_CHAR + '*';
        }
      }
    }
    return stringRule;
  };

  RulesManager.createRule = function(contextName, contextType, entityTypeLocator, propertyTypeLocator, propertyTypeTypeLocator, relationshipTargetCardinality) {
    var rule;
    rule = {};
    rule.providedContext = {};
    rule.providedContext.name = contextName;
    rule.providedContext.type = contextType;
    rule.entityTypeLocator = entityTypeLocator;
    rule.propertyTypeLocator = propertyTypeLocator;
    if (entityTypeLocator === null || propertyTypeLocator === null) {
      rule.propertyTypeTypeLocator = propertyTypeTypeLocator;
      rule.relationshipTargetCardinality = relationshipTargetCardinality;
    }
    return rule;
  };

  RulesManager.downloadAllRules = function() {
    var _this = this;
    return $.getJSON(HOST + 'rules', function(rules) {
      return rules.forEach(function(rule) {
        var key;
        if (rule.providedContext.type === 'Property' || rule.providedContext.type === 'Relationship') {
          if (rule.entityTypeLocator !== null && rule.propertyTypeLocator !== null) {
            rule.propertyTypeTypeLocator = null;
            rule.relationshipTargetCardinality = null;
          }
        }
        key = RulesManager.stringfyRule(rule);
        return simpleStorage.set(key, rule);
      });
    });
  };

  RulesManager.getRule = function(contextName, contextType, entityType, propertyType, propertyTypeType, relationshipTargetCardinality) {
    var rule, ruleQuery;
    ruleQuery = RulesManager.createRule(contextName, contextType, entityType, propertyType, propertyTypeType, relationshipTargetCardinality);
    if (ruleQuery.providedContext.type === 'Property') {
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery = RulesManager.createRule(contextName, contextType, entityType, null, propertyTypeType, null);
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery = RulesManager.createRule(contextName, contextType, entityType, null, null, null);
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery = RulesManager.createRule(contextName, contextType, null, propertyType, propertyTypeType, null);
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery = RulesManager.createRule(contextName, contextType, null, propertyType, null, null);
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery = RulesManager.createRule(contextName, contextType, null, null, propertyTypeType, null);
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery = RulesManager.createRule(contextName, contextType, null, null, null, null);
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
    } else if (ruleQuery.providedContext.type === 'Relationship') {
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery = RulesManager.createRule(contextName, contextType, entityType, null, propertyTypeType, relationshipTargetCardinality);
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery = RulesManager.createRule(contextName, contextType, entityType, null, null, relationshipTargetCardinality);
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery = RulesManager.createRule(contextName, contextType, null, propertyType, propertyTypeType, relationshipTargetCardinality);
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery = RulesManager.createRule(contextName, contextType, null, propertyType, null, relationshipTargetCardinality);
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery = RulesManager.createRule(contextName, contextType, null, null, propertyTypeType, relationshipTargetCardinality);
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery = RulesManager.createRule(contextName, contextType, null, null, null, relationshipTargetCardinality);
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
    } else {
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
      ruleQuery.entityTypeLocator = '*';
      rule = simpleStorage.get(RulesManager.stringfyRule(ruleQuery));
      if (typeof rule !== "undefined") {
        return rule;
      }
    }
  };

}).call(this);
