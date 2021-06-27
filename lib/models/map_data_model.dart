class HereMapDataModal {
  Results results;
  Search search;

  HereMapDataModal({this.results, this.search});

  HereMapDataModal.fromJson(Map<String, dynamic> json) {
    results =
    json['results'] != null ? new Results.fromJson(json['results']) : null;
    search =
    json['search'] != null ? new Search.fromJson(json['search']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.toJson();
    }
    if (this.search != null) {
      data['search'] = this.search.toJson();
    }
    return data;
  }
}

class Results {
  String next;
  List<Items> items;

  Results({this.next, this.items});

  Results.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  List<double> position;
  int distance;
  String title;
  double averageRating;
  Category category;
  String icon;
  String vicinity;
  List having;
  String type;
  String href;
  String id;
  List<dynamic> chainIds;
  List<AlternativeNames> alternativeNames;
  List<Tags> tags;
  OpeningHours openingHours;

  Items(
      {this.position,
        this.distance,
        this.title,
        this.averageRating,
        this.category,
        this.icon,
        this.vicinity,
        this.having,
        this.type,
        this.href,
        this.id,
        this.chainIds,
        this.alternativeNames,
        this.tags,
        this.openingHours});

  Items.fromJson(Map<String, dynamic> json) {
    position = json['position'].cast<double>();
    distance = json['distance'];
    title = json['title'];
    averageRating = json['averageRating'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    icon = json['icon'];
    vicinity = json['vicinity'];
    type = json['type'];
    href = json['href'];
    id = json['id'];
    chainIds = json['chainIds'];
    if (json['alternativeNames'] != null) {
      alternativeNames = new List<AlternativeNames>();
      json['alternativeNames'].forEach((v) {
        alternativeNames.add(new AlternativeNames.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    openingHours = json['openingHours'] != null
        ? new OpeningHours.fromJson(json['openingHours'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['distance'] = this.distance;
    data['title'] = this.title;
    data['averageRating'] = this.averageRating;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['icon'] = this.icon;
    data['vicinity'] = this.vicinity;
    data['type'] = this.type;
    data['href'] = this.href;
    data['id'] = this.id;
    data['chainIds'] = this.chainIds;
    if (this.alternativeNames != null) {
      data['alternativeNames'] =
          this.alternativeNames.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    if (this.openingHours != null) {
      data['openingHours'] = this.openingHours.toJson();
    }
    return data;
  }
}

class Category {
  String id;
  String title;
  String href;
  String type;
  String system;

  Category({this.id, this.title, this.href, this.type, this.system});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    href = json['href'];
    type = json['type'];
    system = json['system'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['href'] = this.href;
    data['type'] = this.type;
    data['system'] = this.system;
    return data;
  }
}

class AlternativeNames {
  String name;
  String language;

  AlternativeNames({this.name, this.language});

  AlternativeNames.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['language'] = this.language;
    return data;
  }
}

class Tags {
  String id;
  String title;
  String group;

  Tags({this.id, this.title, this.group});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    group = json['group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['group'] = this.group;
    return data;
  }
}

class OpeningHours {
  String text;
  String label;
  bool isOpen;
  List<Structured> structured;

  OpeningHours({this.text, this.label, this.isOpen, this.structured});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    label = json['label'];
    isOpen = json['isOpen'];
    if (json['structured'] != null) {
      structured = new List<Structured>();
      json['structured'].forEach((v) {
        structured.add(new Structured.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['label'] = this.label;
    data['isOpen'] = this.isOpen;
    if (this.structured != null) {
      data['structured'] = this.structured.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Structured {
  String start;
  String duration;
  String recurrence;

  Structured({this.start, this.duration, this.recurrence});

  Structured.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    duration = json['duration'];
    recurrence = json['recurrence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['duration'] = this.duration;
    data['recurrence'] = this.recurrence;
    return data;
  }
}

class Search {
  Context context;

  Search({this.context});

  Search.fromJson(Map<String, dynamic> json) {
    context =
    json['context'] != null ? new Context.fromJson(json['context']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.context != null) {
      data['context'] = this.context.toJson();
    }
    return data;
  }
}

class Context {
  Location location;
  String type;
  String href;

  Context({this.location, this.type, this.href});

  Context.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    type = json['type'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['type'] = this.type;
    data['href'] = this.href;
    return data;
  }
}

class Location {
  List<double> position;
  Address address;

  Location({this.position, this.address});

  Location.fromJson(Map<String, dynamic> json) {
    position = json['position'].cast<double>();
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    return data;
  }
}

class Address {
  String text;
  String house;
  String street;
  String postalCode;
  String district;
  String city;
  String county;
  String stateCode;
  String country;
  String countryCode;

  Address(
      {this.text,
        this.house,
        this.street,
        this.postalCode,
        this.district,
        this.city,
        this.county,
        this.stateCode,
        this.country,
        this.countryCode});

  Address.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    house = json['house'];
    street = json['street'];
    postalCode = json['postalCode'];
    district = json['district'];
    city = json['city'];
    county = json['county'];
    stateCode = json['stateCode'];
    country = json['country'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['house'] = this.house;
    data['street'] = this.street;
    data['postalCode'] = this.postalCode;
    data['district'] = this.district;
    data['city'] = this.city;
    data['county'] = this.county;
    data['stateCode'] = this.stateCode;
    data['country'] = this.country;
    data['countryCode'] = this.countryCode;
    return data;
  }
}