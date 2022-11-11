import 'package:flutter/material.dart';

class Model {
  Edgerunner character = new Edgerunner();

  Model();

  Edgerunner getEdgerunner() {
    return this.character;
  }

  void setEdgerunner(Edgerunner character) {
    this.character = character;
  }
}

class Edgerunner {
  String name = '';
  Lifepath lifepath = new Lifepath();
  Skillbook skills = new Skillbook('skills');
  Inventory items = new Inventory('items');
  Inventory cyberware = new Inventory('cyberware');
  Inventory equipped = new Inventory('equipped');
  Inventory outfit = new Inventory('outfit');
  List<Role> role = [];
  int eurobucks = 0;

  Edgerunner();

  int heal(int HP) {
    //ADD logic
    return 0;
  }

  int damage(int HP) {
    //ADD logic
    return 0;
  }

  List<Role> getRole() {
    return this.role;
  }

  void setRole(List<Role> role) {
    this.role = role;
  }

  int getEurobucks() {
    return this.eurobucks;
  }

  void setEurobucks(int eurobucks) {
    this.eurobucks = eurobucks;
  }

  void addEurobucks(int eurobucks) {
    //add logic
  }

  Lifepath getLifepath() {
    return this.lifepath;
  }

  void setLifepath(Lifepath lifepath) {
    this.lifepath = lifepath;
  }

  Skillbook getSkills() {
    return this.skills;
  }

  void setSkills(Skillbook skills) {
    this.skills = skills;
  }

  Inventory getItems() {
    return this.items;
  }

  void setItems(Inventory items) {
    this.items = items;
  }

  Inventory getCyberware() {
    return this.cyberware;
  }

  void setCyberware(Inventory cyberware) {
    this.cyberware = cyberware;
  }

  Inventory getEquipped() {
    return this.equipped;
  }

  void setEquipped(Inventory equipped) {
    this.cyberware = cyberware;
  }

  Inventory getOutfit() {
    return this.outfit;
  }

  void setOutfit(Inventory outfit) {
    this.outfit = outfit;
  }

  String getName() {
    return this.name;
  }

  void setName(String name) {
    this.name = name;
  }
}

class Stats {
  int INT = 0;
  int REF = 0;
  int DEX = 0;
  int TECH = 0;
  int COOL = 0;
  int WILL = 0;
  int LUCK = 0;
  int MOVE = 0;
  int BODY = 0;
  int EMP = 0;
  int HP = 0;
  int HUM = 0;
  int initiative = 0;

  Stats();

  int getINT() {
    return this.INT;
  }

  void setINT(int INT) {
    this.INT = INT;
  }

  int getREF() {
    return this.REF;
  }

  void setREF(int REF) {
    this.REF = REF;
  }

  int getDEX() {
    return this.DEX;
  }

  void setDEX(int DEX) {
    this.DEX = DEX;
  }

  int getTECH() {
    return this.INT;
  }

  void setTECH(int TECH) {
    this.TECH = TECH;
  }

  int getCOOL() {
    return this.COOL;
  }

  void setCOOL(int COOL) {
    this.COOL = COOL;
  }

  int getWILL() {
    return this.WILL;
  }

  void setWILL(int WILL) {
    this.WILL = INT;
  }

  int getLUCK() {
    return this.LUCK;
  }

  void setLuck(int LUCK) {
    this.LUCK = LUCK;
  }

  int getMOVE() {
    return this.MOVE;
  }

  void setMOVE(int MOVE) {
    this.MOVE = MOVE;
  }

  int getBODY() {
    return this.BODY;
  }

  void setBODY(int BODY) {
    this.BODY = BODY;
  }

  int getEMP() {
    return this.EMP;
  }

  void setEMP(int EMP) {
    this.EMP = EMP;
  }

  int getHP() {
    return this.HP;
  }

  void setHP(int HP) {
    this.HP = HP;
  }

  int getHUM() {
    return this.HUM;
  }

  void setHUM(int HUM) {
    this.HUM = HUM;
  }

  int getInitiative() {
    return this.initiative;
  }

  void setInitatiative(int initiative) {
    this.initiative = initiative;
  }
}

class Lifepath {
  String template = '';
  String region = '';
  List<String> languages = [];
  String what_are_you_like = '';
  String clothing_style = '';
  String affectation_you_are_never_without = '';
  String what_do_you_value_most = '';
  String how_do_you_feel_about_most_people = '';
  String most_valued_person = '';
  String most_valued_possession = '';
  String original_background = '';
  String background_desc = '';
  String childhood_environment = '';
  String background = '';
  int friends = 0;
  List<String> friend_desc = [];
  int enemies = 0;
  List<String> enemy_desc = [];
  String life_goals = '';

  Lifepath();

  String getTemplate() {
    return this.template;
  }

  void setTemplate(String template) {
    this.template = template;
  }

  String getRegion() {
    return this.region;
  }

  void setRegion(String region) {
    this.region = region;
  }

  List<String> getLanguages() {
    return this.languages;
  }

  void setLanguages(List<String> languages) {
    this.languages = languages;
  }

  String getWhat_are_you_like() {
    return this.what_are_you_like;
  }

  void setWhat_are_you_like(String what_are_you_like) {
    this.what_are_you_like = what_are_you_like;
  }

  String getClothing_style() {
    return this.clothing_style;
  }

  void setClothing_style(String clothing_style) {
    this.clothing_style = clothing_style;
  }

  String getAffectation_you_are_never_without() {
    return this.affectation_you_are_never_without;
  }

  void setAffectation_you_are_never_without(
      String affectation_you_are_never_without) {
    this.affectation_you_are_never_without = affectation_you_are_never_without;
  }

  String getWhat_do_you_value_most() {
    return this.what_do_you_value_most;
  }

  void setWhat_do_you_value_most(String what_do_you_value_most) {
    this.what_do_you_value_most = what_do_you_value_most;
  }

  String getHow_do_you_feel_about_most_people() {
    return this.how_do_you_feel_about_most_people;
  }

  void setHow_do_you_feel_about_most_people(
      String how_do_you_feel_about_most_people) {
    this.how_do_you_feel_about_most_people = how_do_you_feel_about_most_people;
  }

  String getMost_valued_person() {
    return this.most_valued_person;
  }

  void setMost_valued_person(String most_valued_person) {
    this.most_valued_person = most_valued_person;
  }

  String getMost_valued_possession() {
    return this.most_valued_possession;
  }

  void setMost_valued_possession(String most_valued_possession) {
    this.most_valued_possession = most_valued_possession;
  }

  String getOriginal_background() {
    return this.original_background;
  }

  void setOriginal_background(String original_background) {
    this.original_background = original_background;
  }

  String getBackground_desc() {
    return this.background_desc;
  }

  void setBackground_desc(String background_desc) {
    this.background_desc = background_desc;
  }

  String getChildhood_environment() {
    return this.childhood_environment;
  }

  void setChildhood_environment(String childhood_environment) {
    this.childhood_environment = childhood_environment;
  }

  String getBackground() {
    return this.background;
  }

  void setBackground(String background) {
    this.background = background;
  }

  int getFriends() {
    return this.friends;
  }

  void setFriends(int friends) {
    this.friends = friends;
  }

  List<String> getFriends_desc() {
    return this.friend_desc;
  }

  void setFriends_desc(List<String> friends_desc) {
    this.friend_desc = friends_desc;
  }

  int getEnemies() {
    return this.enemies;
  }

  void setEnemies(int enemies) {
    this.enemies = enemies;
  }

  List<String> getEnemies_desc() {
    return this.enemy_desc;
  }

  void setEnemies_desc(List<String> enemies_desc) {
    this.enemy_desc = enemies_desc;
  }

  String getLife_goals() {
    return this.life_goals;
  }

  void setLife_goals(String life_goals) {
    this.life_goals = life_goals;
  }
}

class Item {
  int id = 0;
  String name = "";
  int cost = 0;
  String desc = "";

  Item(this.id);

  int getId() {
    return this.id;
  }

  void setId(int id) {
    this.id = id;
  }

  String getName() {
    return this.name;
  }

  void setName(String name) {
    this.name = name;
  }

  int getCost() {
    return this.cost;
  }

  void setCost(int cost) {
    this.cost = cost;
  }

  String getDesc() {
    return this.desc;
  }

  void setDesc(String desc) {
    this.desc = desc;
  }
}

enum SkillCategory {
  AWARE,
  BODY,
  CONTROL,
  EDUCATION,
  FIGHTING,
  PERFORMANCE,
  GUN,
  SOCIAL,
  TECH,
  NONE
}

class Skill {
  int id = 0;
  String name = "";
  int level = 0;
  SkillCategory category = SkillCategory.NONE;

  Skill(this.id);

  void increment() {
    //add logic
  }
  void decrement() {
    //add logic
  }

  SkillCategory getCategory() {
    return this.category;
  }

  void setCategory(SkillCategory category) {
    this.category = category;
  }

  int getId() {
    return this.id;
  }

  void setId(int id) {
    this.id = id;
  }

  String getName() {
    return this.name;
  }

  void setName(String name) {
    this.name = name;
  }

  int getLevel() {
    return this.level;
  }

  void setLevel(int level) {
    this.level = level;
  }
}

class Armor extends Item {
  int SP = 0;
  int mod = 0;
  bool penalty = false;
  int maxSP = 0;

  Armor(int id) : super(id);

  int getSP() {
    return this.SP;
  }

  void setSP(int SP) {
    this.SP = SP;
  }

  int getMod() {
    return this.mod;
  }

  void setMod(int mod) {
    this.mod = mod;
  }

  bool getPenalty() {
    return this.penalty;
  }

  void setPenalty(bool penalty) {
    this.penalty = penalty;
  }

  int getMaxSP() {
    return this.maxSP;
  }

  void setMaxSP(int maxSP) {
    this.maxSP = maxSP;
  }
}

class WeaponMelee extends Item {
  int SSD = 0;
  int ROF = 0;
  int NHR = 0;
  bool conceal = false;

  WeaponMelee(int id) : super(id);

  int getSSD() {
    return this.SSD;
  }

  void setSSD(int SSD) {
    this.SSD = SSD;
  }

  int getROF() {
    return this.ROF;
  }

  void setROF(int ROF) {
    this.ROF = ROF;
  }

  int getNHR() {
    return this.NHR;
  }

  void setNHR(int NHR) {
    this.NHR = NHR;
  }

  bool getConceal() {
    return this.conceal;
  }

  void setConceal(bool conceal) {
    this.conceal = conceal;
  }
}

class WeaponRanged extends Item {
  String weaponSkill = "";
  int SSD = 0;
  int MAG = 0;
  int ROF = 0;
  int NHR = 0;
  bool autofire = false;
  bool conceal = false;

  WeaponRanged(int id) : super(id);

  int getSSD() {
    return this.SSD;
  }

  void setSSD(int SSD) {
    this.SSD = SSD;
  }

  int getMAG() {
    return this.MAG;
  }

  void setMAG(int MAG) {
    this.MAG = MAG;
  }

  int getROF() {
    return this.ROF;
  }

  void setROF(int ROF) {
    this.ROF = ROF;
  }

  int getNHR() {
    return this.NHR;
  }

  void setNHR(int NHR) {
    this.NHR = NHR;
  }

  bool getAutofire() {
    return this.autofire;
  }

  void setAutofire(bool autofire) {
    this.autofire = autofire;
  }

  bool getConceal() {
    return this.conceal;
  }

  void setConceal(bool conceal) {
    this.conceal = conceal;
  }
}

class Inventory {
  String name = "";
  List<Item> items = <Item>[];

  Inventory(this.name);

  void addItem(Item item) {
    this.items.add(item);
  }

  void removeItem(Item item) {
    this.items.remove(item);
  }

  bool hasItem(Item item) {
    //add logic
    return false;
  }

  int getQuantity(Item item) {
    //Add logic
    return 0;
  }
}

enum RoleType {
  ROCKERBOY,
  SOLO,
  NETRUNNER,
  TECH,
  MEDTECH,
  MEDIA,
  EXEC,
  LAWMAN,
  FIXER,
  NOMAD,
  NONE
}

class Role {
  int rank = 0;
  RoleType type = RoleType.NONE;
  String desc = "";

  Role(this.type, this.rank);

  int getRank() {
    return this.rank;
  }

  void setRank(int rank) {
    this.rank = rank;
  }

  RoleType getTyper() {
    return this.type;
  }

  void setTyper(RoleType type) {
    this.type = type;
  }
}

class Skillbook {
  String name = "";
  List<Skill> skill = <Skill>[];

  Skillbook(this.name);

  void addSkill(Skill skill) {
    this.skill.add(skill);
  }

  void removeSkill(Skill skill) {
    this.skill.add(skill);
  }

  int getLevel(Skill skill) {
    //Add logic
    return 0;
  }
}

class Table {
  String name = "";
  int x;
  int y;
  var table;

  Table(this.x, this.y);

  void initialize() {
    this.table = List.generate(x, (index) => y, growable: false);
  }

  String getValue(int x) {
    return table[x][1];
  }
}
