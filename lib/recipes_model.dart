class RecipesModel {
  List<Recipes>? recipes;

  RecipesModel({
    this.recipes,
  });

  RecipesModel.fromJson(Map<String, dynamic> json) {
    recipes = (json['recipes'] as List?)
        ?.map((dynamic e) => Recipes.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['recipes'] = recipes?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Recipes {
  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  int? weightWatcherSmartPoints;
  String? gaps;
  int? preparationMinutes;
  int? cookingMinutes;
  int? aggregateLikes;
  int? healthScore;
  String? creditsText;
  String? sourceName;
  double? pricePerServing;
  List<ExtendedIngredients>? extendedIngredients;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  String? imageType;
  String? summary;
  List<String>? cuisines;
  List<String>? dishTypes;
  List<String>? diets;
  List<dynamic>? occasions;
  String? instructions;
  List<AnalyzedInstructions>? analyzedInstructions;
  dynamic originalId;
  String? spoonacularSourceUrl;

  Recipes({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularSourceUrl,
  });

  Recipes.fromJson(Map<String, dynamic> json) {
    vegetarian = json['vegetarian'] as bool?;
    vegan = json['vegan'] as bool?;
    glutenFree = json['glutenFree'] as bool?;
    dairyFree = json['dairyFree'] as bool?;
    veryHealthy = json['veryHealthy'] as bool?;
    cheap = json['cheap'] as bool?;
    veryPopular = json['veryPopular'] as bool?;
    sustainable = json['sustainable'] as bool?;
    lowFodmap = json['lowFodmap'] as bool?;
    weightWatcherSmartPoints = json['weightWatcherSmartPoints'] as int?;
    gaps = json['gaps'] as String?;
    preparationMinutes = json['preparationMinutes'] as int?;
    cookingMinutes = json['cookingMinutes'] as int?;
    aggregateLikes = json['aggregateLikes'] as int?;
    healthScore = json['healthScore'] as int?;
    creditsText = json['creditsText'] as String?;
    sourceName = json['sourceName'] as String?;
    pricePerServing = json['pricePerServing'] as double?;
    extendedIngredients = (json['extendedIngredients'] as List?)
        ?.map((dynamic e) =>
            ExtendedIngredients.fromJson(e as Map<String, dynamic>))
        .toList();
    id = json['id'] as int?;
    title = json['title'] as String?;
    readyInMinutes = json['readyInMinutes'] as int?;
    servings = json['servings'] as int?;
    sourceUrl = json['sourceUrl'] as String?;
    image = json['image'] as String?;
    imageType = json['imageType'] as String?;
    summary = json['summary'] as String?;
    cuisines =
        (json['cuisines'] as List?)?.map((dynamic e) => e as String).toList();
    dishTypes =
        (json['dishTypes'] as List?)?.map((dynamic e) => e as String).toList();
    diets = (json['diets'] as List?)?.map((dynamic e) => e as String).toList();
    occasions = json['occasions'] as List?;
    instructions = json['instructions'] as String?;
    analyzedInstructions = (json['analyzedInstructions'] as List?)
        ?.map((dynamic e) =>
            AnalyzedInstructions.fromJson(e as Map<String, dynamic>))
        .toList();
    originalId = json['originalId'];
    spoonacularSourceUrl = json['spoonacularSourceUrl'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['vegetarian'] = vegetarian;
    json['vegan'] = vegan;
    json['glutenFree'] = glutenFree;
    json['dairyFree'] = dairyFree;
    json['veryHealthy'] = veryHealthy;
    json['cheap'] = cheap;
    json['veryPopular'] = veryPopular;
    json['sustainable'] = sustainable;
    json['lowFodmap'] = lowFodmap;
    json['weightWatcherSmartPoints'] = weightWatcherSmartPoints;
    json['gaps'] = gaps;
    json['preparationMinutes'] = preparationMinutes;
    json['cookingMinutes'] = cookingMinutes;
    json['aggregateLikes'] = aggregateLikes;
    json['healthScore'] = healthScore;
    json['creditsText'] = creditsText;
    json['sourceName'] = sourceName;
    json['pricePerServing'] = pricePerServing;
    json['extendedIngredients'] =
        extendedIngredients?.map((e) => e.toJson()).toList();
    json['id'] = id;
    json['title'] = title;
    json['readyInMinutes'] = readyInMinutes;
    json['servings'] = servings;
    json['sourceUrl'] = sourceUrl;
    json['image'] = image;
    json['imageType'] = imageType;
    json['summary'] = summary;
    json['cuisines'] = cuisines;
    json['dishTypes'] = dishTypes;
    json['diets'] = diets;
    json['occasions'] = occasions;
    json['instructions'] = instructions;
    json['analyzedInstructions'] =
        analyzedInstructions?.map((e) => e.toJson()).toList();
    json['originalId'] = originalId;
    json['spoonacularSourceUrl'] = spoonacularSourceUrl;
    return json;
  }
}

class ExtendedIngredients {
  int? id;
  String? aisle;
  String? image;
  String? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalName;
  int? amount;
  String? unit;
  List<String>? meta;
  Measures? measures;

  ExtendedIngredients({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  ExtendedIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    aisle = json['aisle'] as String?;
    image = json['image'] as String?;
    consistency = json['consistency'] as String?;
    name = json['name'] as String?;
    nameClean = json['nameClean'] as String?;
    original = json['original'] as String?;
    originalName = json['originalName'] as String?;
    amount = json['amount'] as int?;
    unit = json['unit'] as String?;
    meta = (json['meta'] as List?)?.map((dynamic e) => e as String).toList();
    measures = (json['measures'] as Map<String, dynamic>?) != null
        ? Measures.fromJson(json['measures'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['aisle'] = aisle;
    json['image'] = image;
    json['consistency'] = consistency;
    json['name'] = name;
    json['nameClean'] = nameClean;
    json['original'] = original;
    json['originalName'] = originalName;
    json['amount'] = amount;
    json['unit'] = unit;
    json['meta'] = meta;
    json['measures'] = measures?.toJson();
    return json;
  }
}

class Measures {
  Us? us;
  Metric? metric;

  Measures({
    this.us,
    this.metric,
  });

  Measures.fromJson(Map<String, dynamic> json) {
    us = (json['us'] as Map<String, dynamic>?) != null
        ? Us.fromJson(json['us'] as Map<String, dynamic>)
        : null;
    metric = (json['metric'] as Map<String, dynamic>?) != null
        ? Metric.fromJson(json['metric'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['us'] = us?.toJson();
    json['metric'] = metric?.toJson();
    return json;
  }
}

class Us {
  int? amount;
  String? unitShort;
  String? unitLong;

  Us({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  Us.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] as int?;
    unitShort = json['unitShort'] as String?;
    unitLong = json['unitLong'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['amount'] = amount;
    json['unitShort'] = unitShort;
    json['unitLong'] = unitLong;
    return json;
  }
}

class Metric {
  int? amount;
  String? unitShort;
  String? unitLong;

  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  Metric.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] as int?;
    unitShort = json['unitShort'] as String?;
    unitLong = json['unitLong'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['amount'] = amount;
    json['unitShort'] = unitShort;
    json['unitLong'] = unitLong;
    return json;
  }
}

class AnalyzedInstructions {
  String? name;
  List<Steps>? steps;

  AnalyzedInstructions({
    this.name,
    this.steps,
  });

  AnalyzedInstructions.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    steps = (json['steps'] as List?)
        ?.map((dynamic e) => Steps.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['steps'] = steps?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Steps {
  int? number;
  String? step;
  List<Ingredients>? ingredients;
  List<Equipment>? equipment;

  Steps({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
  });

  Steps.fromJson(Map<String, dynamic> json) {
    number = json['number'] as int?;
    step = json['step'] as String?;
    ingredients = (json['ingredients'] as List?)
        ?.map((dynamic e) => Ingredients.fromJson(e as Map<String, dynamic>))
        .toList();
    equipment = (json['equipment'] as List?)
        ?.map((dynamic e) => Equipment.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['number'] = number;
    json['step'] = step;
    json['ingredients'] = ingredients?.map((e) => e.toJson()).toList();
    json['equipment'] = equipment?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Ingredients {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Ingredients({
    this.id,
    this.name,
    this.localizedName,
    this.image,
  });

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    localizedName = json['localizedName'] as String?;
    image = json['image'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['localizedName'] = localizedName;
    json['image'] = image;
    return json;
  }
}

class Equipment {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Equipment({
    this.id,
    this.name,
    this.localizedName,
    this.image,
  });

  Equipment.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    localizedName = json['localizedName'] as String?;
    image = json['image'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['localizedName'] = localizedName;
    json['image'] = image;
    return json;
  }
}
