import 'dart:ui';

import 'package:cybersheet/main.dart';
import 'package:cybersheet/model/model.dart';

/// This file contains all constant variables used in the cybersheet application
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
String dropdownvalue = 'dart gun';
var items = ['dart gun', 'glock 17', 'AKR 20'];
const String homeRoute = '/';
const String newCharRoute = homeRoute + "new";
const String templatesRoute = newCharRoute + "/templates";
const String rolePage = templatesRoute + "/role";
const String templateLifePath = rolePage + "/lifePath";
const String styleRoute = templateLifePath + "/style";
const String motivationsRoute = styleRoute + "/motivation";
const String familyRoute = motivationsRoute + "/family";
const String environmentRoute = familyRoute + "/environment";
const String friendsRoute = environmentRoute + "/friends";
const String enemiesRoute = friendsRoute + "/enemies";
const String lifeGoalsRoute = enemiesRoute + "/lifeGoals";
const String statsRoute = lifeGoalsRoute + "/stats";
const String inventoryRoute = statsRoute + "/skills";
const String skillsRoute = inventoryRoute + "/stats"; //changed this
const String editCharRoute = homeRoute + "/edit";
//const String inventoryRoute = skillsRoute + "/inventory";

const Color cyberRed = Color.fromARGB(228, 228, 35, 24);
const Color buttonRed = Color.fromARGB(255, 231, 106, 106);

const List<int> numbers = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

enum Template { STREETRAT, EDGERUNNER, COMPLETE, NONE }

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

const Map CulturalRegion = {
  '': '',
  'North American': 'English,Chinese,Cree,Creole,French,Navajo,Spanish',
  'South/Central American':
      'English,Creole,German,Guarani,Mayan,Portuguese,Quechua,Spanish',
  'Western European':
      'English,Dutch,French,German,Italian,Norwegian,Portuguese,Spanish',
  'Eastern European': 'English,Finnish,Polish,Romanian,Russian,Ukranian',
  'Middle Eastern/North African':
      'English,Arabic,Berber,Farsi,French,Hebrew,Turkish',
  'Sub-Saharan African':
      'English,Arabic,French,Hausa,Lingala,Oromo,Portuguese,Swahili,Twi,Yoruba',
  'South Asian': 'English,Bengali,Dari,Hindi,Nepali,Sinhalese,Tamil,Urdu',
  'South East Asian':
      'English,Arabic,Burmese,Filipino,Hindi,Indonesian,Khmer,Malayan,Vietnamese',
  'East Asian':
      'English,Cantonese Chinese,Japanese,Korean,Mandarin Chinese,Mongolian',
  'Oceania/Pacific Islander':
      'English,French,Hawaiian,Maori,Pama-Nyungan,Tahitian'
};

const List<String> Personality = [
  '',
  'Shy and secretive',
  'Rebellious, antisocial, and violent',
  'Arrogant, proud, and aloof',
  'Moody, rash, and headstrong',
  'Picky, fussy, and nervous',
  'Stable and serious',
  'Silly and fluff-headed',
  'Sneaky and deceptive',
  'Intellectual and detached',
  'Friendly and outgoing'
];

const List<String> ClothingStyle = [
  '',
  'Generic Chic',
  'Leisurewear',
  'Urban Flash',
  'Businesswear',
  'High Fashion',
  'Bohemian',
  'Bag Lady Chic',
  'Gang Colors',
  'Nomad Leathers',
  'Asia Pop'
];

const List<String> Hairstyle = [
  '',
  'Mohawk',
  'Long and ratty',
  'Short and spiked',
  'Wild and all over',
  'Bald',
  'Striped',
  'Wild colors',
  'Neat and short',
  'Short and curly',
  'Long and straight'
];

const List<String> Affectation = [
  '',
  'Tattoos',
  'Mirrorshades',
  'Ritual scars',
  'Spiked gloves',
  'Nose rings',
  'Tongue or other piercings',
  'Strange fingernail implants',
  'Spiked boots or heels',
  'Fingerless gloves',
  'Strange contacts'
];

const List<String> WhatValue = [
  '',
  'Money',
  'Honor',
  'Your word',
  'Honesty',
  'Knowledge',
  'Vengence',
  'Love',
  'Power',
  'Family',
  'Friendship'
];

const List<String> MostPeople = [
  '',
  'I stay neutral',
  'I stay neutral',
  'I like almost everyone',
  'I hate almost everyone',
  'People are tools. Use them for your own goals then discard them.',
  'Every person is a valuable individual',
  'People are obstacles to be destroyed if they cross me',
  "People are untrustworthy. Don't depend on anyone",
  "Wipe 'em all out and let the cockroaches take over",
  'People are wonderful!'
];

const List<String> WhoValue = [
  '',
  'A parent',
  'A brother or sister',
  'A lover',
  'A friend',
  'Yourself',
  'A pet',
  'A teacher or mentor',
  'A public figure',
  'A personal hero',
  'No one'
];

const List<String> ValuedPossession = [
  '',
  'A weapon',
  'A tool',
  'A piece of clothing',
  'A photograph',
  'A book or diary',
  'A recording',
  'A musical instrument',
  'A piece of jewelry',
  'A toy',
  'A letter'
];

const Map FamilyBackground = {
  '': '',
  'Corporate Execs':
      'Wealthy, powerful, with servants, luxury homes, and the best of everything.\n' +
          'Private security made sure you were always safe. You definitely went to a \n' +
          'big-name private school.',
  'Corporate Managers':
      'Well to do, with large homes, safe neighborhoods, nice cars, etc. Sometimes \n' +
          'your parent(s) would hire servants, although this was rare. You had a mix of\n' +
          ' private and corporate education.',
  'Corporate Technicians':
      'Middle-middle class, with comfortable conapts or Beaverville suburban homes,\n' +
          ' minivans and corporate-run technical schools. Kind of like living 1950s America\n' +
          ' crossed with 1984.',
  'Nomad Pack':
      'You had a mix of rugged trailers, vehicles, and huge road kombis for your\n' +
          ' home. You learned to drive and fight at an early age, but the family was\n' +
          ' always there to care for you. Food was actually fresh and abundant. Mostly home schooled.',
  'Ganger "Family"':
      "A savage, violent home in any place the gang could take over. You were usually\n" +
          " hungry, cold, and scared. You probably didn't know who your actual parents were.\n" +
          " Education? The Gang taught you how to fight, kill, and steal—what else did you need to know?",
  'Combat Zoners':
      'A step up from a gang "family," your home was a decaying building somewhere\n' +
          ' in the Zone, heavily fortified. You were hungry at times, but regularly could\n' +
          ' score a bed and a meal. Home schooled.',
  'Urban Homeless':
      'You lived in cars, dumpsters, or abandoned shipping modules. If you were lucky.\n' +
          ' You were usually hungry, cold, and scared, unless you were tough enough to\n' +
          ' fight for the scraps. Education? School of Hard Knocks.',
  'Megastructure Warren Rats':
      'You grew up in one of the huge new megastructures that went up after the War.\n' +
          ' A tiny conapt, kibble and scop for food, a mostly warm bed. Some better\n' +
          ' educated adult warren dwellers or a local Corporation may have set up a school.',
  'Reclaimers':
      'You started out on the road, but then moved into one of the deserted ghost\n' +
          ' towns or cities to rebuild it. A pioneer life: dangerous, but with plenty of\n' +
          ' simple food and a safe place to sleep. You were home schooled if there was anyone\n' +
          ' who had the time.',
  'Edgerunners':
      "Your home was always changing based on your parents' current 'job.' Could be\n" +
          " a luxury apartment, an urban conapt, or a dumpster if you were on the run.\n" +
          " Food and shelter ran the gamut from gourmet to kibble."
};

List<String> ChildhoodEnvironment = [
  '',
  'Ran on the Street, with no adult supervision.',
  'Spent in a safe Corp Zone walled off from the rest of the City.',
  'In a Nomad pack moving from place to place.',
  'In a Nomad pack with roots in transport.',
  'In a decaying, once upscale neighborhood, now holding off the boosters to survive',
  'In the heart of the Combat Zone, living in a wrecked building or other squat.',
  'In a huge "megastructure" building controlled by a Corp or the City.',
  'In the ruins of a deserted town or city taken over by Reclaimers.',
  'In a Drift Nation (a floating offshore city) that is a meeting place for all kinds of people.',
  'In a Corporate luxury "starscraper," high above the rest of the teeming rabble'
];

List<String> FamilyCrisis = [
  '',
  'Your family lost everything through betrayal',
  'Your family lost everything through bad management',
  'Your family was exiled or otherwise driven from their original \n' +
      'home/nation/Corporation.',
  'Your family is imprisoned, and you alone escaped',
  'Your family vanished. You are the only remaining member.',
  'Your family was killed, and you were the only survivor.',
  'Your family is involved in a long-term conspiracy, organization, or association,\n' +
      ' such as a crime family or revolutionary group.',
  'Your family was scattered to the winds due to misfortune.',
  'Your family is cursed with a hereditary feud that has lasted for generations.',
  'You are the inheritor of a family debt; you must honor this debt before moving \n' +
      'on with your life.'
];

List<String> FriendRelationship = [
  '',
  'Like an older sibling to you.',
  'Like a younger sibling to you.',
  'A teacher or mentor.',
  'A partner or coworker.',
  'A former lover.',
  'An old enemy.',
  'Like a parent to you.',
  'An old childhood friend.',
  'Someone you know from The Street.',
  'Someone with a common interest or goal.'
];

List<String> Enemy = [
  '',
  'Ex-friend',
  'Ex-lover',
  'Estranged relative',
  'Childhood enemy',
  'Person working for you',
  'Person you work for',
  'Partner or coworker',
  'Corporate exec',
  'Government official',
  'Boosterganger'
];

List<String> EnemyCause = [
  '',
  'Caused the other to lose face or status.',
  'Caused the loss of a lover, friend, or relative.',
  'Caused a major public humiliation.',
  'Accused the other of cowardice or some other major personal flaw.',
  'Deserted or betrayed the other.',
  "Turned the other's offer of a job or romantic involvement.",
  "You just don't like each other.",
  'One of you was a romantic rival.',
  'One of you was a business rival.',
  "One of you set the other up for a crime they didn't commit"
];

List<String> EnemyResources = [
  '',
  "Just themselves and even they won't go out of their way.",
  'Just themselves.',
  'Just themselves and a close friend.',
  'Themselves and a few (1d6/2) friends.'
      'Themselves and a few (1d10/2) friends.',
  'An entire gang (at least 1d10 + 5 people).',
  'The local cops or other Lawmen.',
  'A powerful gang lord or small Corporation.',
  'A powerful Corporation.',
  'An entire city or government or agency.'
];

List<String> LifeGoals = [
  '',
  'Get rid of a bad reputation.',
  'Gain power and control.',
  'Get off The Street no matter what it takes.',
  'Cause pain and suffering to anyone who crosses you.',
  'Live down your past life and try to forget it.',
  'Hunt down those responsible for your miserable life and \n' +
      'make them pay.',
  'Get what is rightfully yours',
  'Save, if possble, anyone else involved in your background, \n' +
      'like a lover, or family member',
  'Gain fame and recognition.',
  'Become feared and respected.'
];

List<List<int>> rockerboyM = [
  [7, 6, 6, 5, 6, 8, 7, 7, 3, 8],
  [3, 7, 7, 7, 7, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 8, 7, 6, 3, 8],
  [3, 7, 7, 7, 6, 8, 6, 5, 4, 7],
  [5, 6, 7, 5, 7, 8, 5, 7, 3, 7],
  [5, 7, 7, 5, 6, 6, 6, 6, 4, 8],
  [5, 6, 6, 7, 7, 8, 7, 6, 3, 6],
  [3, 5, 5, 6, 7, 8, 7, 5, 5, 7],
  [4, 5, 6, 5, 8, 8, 7, 6, 4, 7]
];

//TODO
List<List<int>> soloM = [
  [7, 6, 6, 5, 6, 8, 7, 7, 3, 8],
  [3, 7, 7, 7, 7, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 8, 7, 6, 3, 8],
  [3, 7, 7, 7, 6, 8, 6, 5, 4, 7],
  [5, 6, 7, 5, 7, 8, 5, 7, 3, 7],
  [5, 7, 7, 5, 6, 6, 6, 6, 4, 8],
  [5, 6, 6, 7, 7, 8, 7, 6, 3, 6],
  [3, 5, 5, 6, 7, 8, 7, 5, 5, 7],
  [4, 5, 6, 5, 8, 8, 7, 6, 4, 7]
];

//TODO
List<List<int>> netrunnerM = [
  [7, 6, 6, 5, 6, 8, 7, 7, 3, 8],
  [3, 7, 7, 7, 7, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 8, 7, 6, 3, 8],
  [3, 7, 7, 7, 6, 8, 6, 5, 4, 7],
  [5, 6, 7, 5, 7, 8, 5, 7, 3, 7],
  [5, 7, 7, 5, 6, 6, 6, 6, 4, 8],
  [5, 6, 6, 7, 7, 8, 7, 6, 3, 6],
  [3, 5, 5, 6, 7, 8, 7, 5, 5, 7],
  [4, 5, 6, 5, 8, 8, 7, 6, 4, 7]
];

//TODO
List<List<int>> techM = [
  [7, 6, 6, 5, 6, 8, 7, 7, 3, 8],
  [3, 7, 7, 7, 7, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 8, 7, 6, 3, 8],
  [3, 7, 7, 7, 6, 8, 6, 5, 4, 7],
  [5, 6, 7, 5, 7, 8, 5, 7, 3, 7],
  [5, 7, 7, 5, 6, 6, 6, 6, 4, 8],
  [5, 6, 6, 7, 7, 8, 7, 6, 3, 6],
  [3, 5, 5, 6, 7, 8, 7, 5, 5, 7],
  [4, 5, 6, 5, 8, 8, 7, 6, 4, 7]
];

//TODO
List<List<int>> medtechM = [
  [7, 6, 6, 5, 6, 8, 7, 7, 3, 8],
  [3, 7, 7, 7, 7, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 8, 7, 6, 3, 8],
  [3, 7, 7, 7, 6, 8, 6, 5, 4, 7],
  [5, 6, 7, 5, 7, 8, 5, 7, 3, 7],
  [5, 7, 7, 5, 6, 6, 6, 6, 4, 8],
  [5, 6, 6, 7, 7, 8, 7, 6, 3, 6],
  [3, 5, 5, 6, 7, 8, 7, 5, 5, 7],
  [4, 5, 6, 5, 8, 8, 7, 6, 4, 7]
];

//TODO
List<List<int>> mediaM = [
  [7, 6, 6, 5, 6, 8, 7, 7, 3, 8],
  [3, 7, 7, 7, 7, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 8, 7, 6, 3, 8],
  [3, 7, 7, 7, 6, 8, 6, 5, 4, 7],
  [5, 6, 7, 5, 7, 8, 5, 7, 3, 7],
  [5, 7, 7, 5, 6, 6, 6, 6, 4, 8],
  [5, 6, 6, 7, 7, 8, 7, 6, 3, 6],
  [3, 5, 5, 6, 7, 8, 7, 5, 5, 7],
  [4, 5, 6, 5, 8, 8, 7, 6, 4, 7]
];

//TODO
List<List<int>> lawmanM = [
  [7, 6, 6, 5, 6, 8, 7, 7, 3, 8],
  [3, 7, 7, 7, 7, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 8, 7, 6, 3, 8],
  [3, 7, 7, 7, 6, 8, 6, 5, 4, 7],
  [5, 6, 7, 5, 7, 8, 5, 7, 3, 7],
  [5, 7, 7, 5, 6, 6, 6, 6, 4, 8],
  [5, 6, 6, 7, 7, 8, 7, 6, 3, 6],
  [3, 5, 5, 6, 7, 8, 7, 5, 5, 7],
  [4, 5, 6, 5, 8, 8, 7, 6, 4, 7]
];

//TODO
List<List<int>> execM = [
  [7, 6, 6, 5, 6, 8, 7, 7, 3, 8],
  [3, 7, 7, 7, 7, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 8, 7, 6, 3, 8],
  [3, 7, 7, 7, 6, 8, 6, 5, 4, 7],
  [5, 6, 7, 5, 7, 8, 5, 7, 3, 7],
  [5, 7, 7, 5, 6, 6, 6, 6, 4, 8],
  [5, 6, 6, 7, 7, 8, 7, 6, 3, 6],
  [3, 5, 5, 6, 7, 8, 7, 5, 5, 7],
  [4, 5, 6, 5, 8, 8, 7, 6, 4, 7]
];

//TODO
List<List<int>> fixerM = [
  [7, 6, 6, 5, 6, 8, 7, 7, 3, 8],
  [3, 7, 7, 7, 7, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 8, 7, 6, 3, 8],
  [3, 7, 7, 7, 6, 8, 6, 5, 4, 7],
  [5, 6, 7, 5, 7, 8, 5, 7, 3, 7],
  [5, 7, 7, 5, 6, 6, 6, 6, 4, 8],
  [5, 6, 6, 7, 7, 8, 7, 6, 3, 6],
  [3, 5, 5, 6, 7, 8, 7, 5, 5, 7],
  [4, 5, 6, 5, 8, 8, 7, 6, 4, 7]
];

//TODO
List<List<int>> nomadM = [
  [7, 6, 6, 5, 6, 8, 7, 7, 3, 8],
  [3, 7, 7, 7, 7, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 6, 7, 7, 5, 8],
  [4, 5, 7, 7, 6, 8, 7, 6, 3, 8],
  [3, 7, 7, 7, 6, 8, 6, 5, 4, 7],
  [5, 6, 7, 5, 7, 8, 5, 7, 3, 7],
  [5, 7, 7, 5, 6, 6, 6, 6, 4, 8],
  [5, 6, 6, 7, 7, 8, 7, 6, 3, 6],
  [3, 5, 5, 6, 7, 8, 7, 5, 5, 7],
  [4, 5, 6, 5, 8, 8, 7, 6, 4, 7]
];

const Map Skills = {
  0: 'Concentration',
  1: 'Conceal/Reveal Object,',
  2: 'Lip Reading',
  3: 'Perception',
  4: 'Tracking',
  5: 'Athletics',
  6: 'Contortionist',
  7: 'Dance',
  8: 'Endurance',
  9: 'Resist Torture/Drugs',
  10: 'Stealth',
  11: 'Drive Land Vehicle',
  12: 'Pilot Air Vehicle',
  13: 'Pilot Sea Vehicle',
  14: 'Riding',
  15: 'Accounting',
  16: 'Animal Handling',
  17: 'Bureaucracy',
  18: 'Business',
  19: 'Composition',
  20: 'Criminology',
  21: 'Cryptography',
  22: 'Deduction',
  23: 'Education',
  24: 'Gamble',
  25: 'Language',
  26: 'Library Search',
  27: 'Local Expert',
  28: 'Science',
  29: 'Tactics',
  30: 'Wilderness Survival',
  31: 'Brawling',
  32: 'Evasion',
  33: 'Martial Arts',
  34: 'Melee Weapon',
  35: 'Acting',
  36: 'Play Instrument',
  37: 'Archery',
  38: 'Autofire',
  39: 'Handgun',
  40: 'Heavy Weapons',
  41: 'Shoulder Arms',
  42: 'Bribery',
  43: 'Conversation',
  44: 'Human Perception',
  45: 'Interrogation',
  46: 'Persuasion',
  47: 'Personal Grooming',
  48: 'Streetwise',
  49: 'Trading',
  50: 'Wardrobe & Style',
  51: 'Air Vehicle Tech',
  52: 'Basic Tech',
  53: 'Cybertech',
  54: 'Demolitions',
  55: 'Electronics/Security Tech',
  56: 'First Aid',
  57: 'Forgery',
  58: 'Land Vehicle Tech',
  59: 'Paint/Draw/Sculpt',
  60: 'Paramedic',
  61: 'Photography/Film',
  62: 'Pick Lock',
  63: 'Pick Pocket',
  64: 'Sea Vehicle Tech',
  65: 'Weaponstech'
};

const Map rockerboySB = {
  'Athletics': 2,
  'Brawling': 6,
  'Concentration': 2,
  'Conversation': 2,
  'Education': 2,
  'Evasion': 6,
  'First Aid': 6,
  'Human Perception': 6,
  'Language (Streetslang)': 2,
  'Local Expert (Your Home)': 4,
  'Perception': 2,
  'Persuasion': 6,
  'Stealth': 2,
  'Composition': 6,
  'Handgun': 6,
  'Melee Weapon': 6,
  'Personal Grooming': 4,
  'Play Instrument': 6,
  'Streetwiswe': 6,
  'Wardrobe & Style': 4
};

const Map execSB = {
  'Athletics': 2,
  'Brawling': 6,
  'Concentration': 2,
  'Conversation': 2,
  'Education': 2,
  'Evasion': 6,
  'First Aid': 6,
  'Human Perception': 6,
  'Language (Streetslang)': 2,
  'Local Expert (Your Home)': 4,
  'Perception': 2,
  'Persuasion': 6,
  'Stealth': 2,
  'Composition': 6,
  'Handgun': 6,
  'Melee Weapon': 6,
  'Personal Grooming': 4,
  'Play Instrument': 6,
  'Streetwiswe': 6,
  'Wardrobe & Style': 4
};

const Map soloSB = {
  'Athletics': 2,
  'Brawling': 6,
  'Concentration': 2,
  'Conversation': 2,
  'Education': 2,
  'Evasion': 6,
  'First Aid': 6,
  'Human Perception': 6,
  'Language (Streetslang)': 2,
  'Local Expert (Your Home)': 4,
  'Perception': 2,
  'Persuasion': 6,
  'Stealth': 2,
  'Composition': 6,
  'Handgun': 6,
  'Melee Weapon': 6,
  'Personal Grooming': 4,
  'Play Instrument': 6,
  'Streetwiswe': 6,
  'Wardrobe & Style': 4
};

const Map netrunnerSB = {
  'Athletics': 2,
  'Brawling': 6,
  'Concentration': 2,
  'Conversation': 2,
  'Education': 2,
  'Evasion': 6,
  'First Aid': 6,
  'Human Perception': 6,
  'Language (Streetslang)': 2,
  'Local Expert (Your Home)': 4,
  'Perception': 2,
  'Persuasion': 6,
  'Stealth': 2,
  'Composition': 6,
  'Handgun': 6,
  'Melee Weapon': 6,
  'Personal Grooming': 4,
  'Play Instrument': 6,
  'Streetwiswe': 6,
  'Wardrobe & Style': 4
};

const Map nomadSB = {
  'Athletics': 2,
  'Brawling': 6,
  'Concentration': 2,
  'Conversation': 2,
  'Education': 2,
  'Evasion': 6,
  'First Aid': 6,
  'Human Perception': 6,
  'Language (Streetslang)': 2,
  'Local Expert (Your Home)': 4,
  'Perception': 2,
  'Persuasion': 6,
  'Stealth': 2,
  'Composition': 6,
  'Handgun': 6,
  'Melee Weapon': 6,
  'Personal Grooming': 4,
  'Play Instrument': 6,
  'Streetwiswe': 6,
  'Wardrobe & Style': 4
};

const Map fixerSB = {
  'Athletics': 2,
  'Brawling': 6,
  'Concentration': 2,
  'Conversation': 2,
  'Education': 2,
  'Evasion': 6,
  'First Aid': 6,
  'Human Perception': 6,
  'Language (Streetslang)': 2,
  'Local Expert (Your Home)': 4,
  'Perception': 2,
  'Persuasion': 6,
  'Stealth': 2,
  'Composition': 6,
  'Handgun': 6,
  'Melee Weapon': 6,
  'Personal Grooming': 4,
  'Play Instrument': 6,
  'Streetwiswe': 6,
  'Wardrobe & Style': 4
};

const Map lawmanSB = {
  'Athletics': 2,
  'Brawling': 6,
  'Concentration': 2,
  'Conversation': 2,
  'Education': 2,
  'Evasion': 6,
  'First Aid': 6,
  'Human Perception': 6,
  'Language (Streetslang)': 2,
  'Local Expert (Your Home)': 4,
  'Perception': 2,
  'Persuasion': 6,
  'Stealth': 2,
  'Composition': 6,
  'Handgun': 6,
  'Melee Weapon': 6,
  'Personal Grooming': 4,
  'Play Instrument': 6,
  'Streetwiswe': 6,
  'Wardrobe & Style': 4
};

const Map mediaSB = {
  'Athletics': 2,
  'Brawling': 6,
  'Concentration': 2,
  'Conversation': 2,
  'Education': 2,
  'Evasion': 6,
  'First Aid': 6,
  'Human Perception': 6,
  'Language (Streetslang)': 2,
  'Local Expert (Your Home)': 4,
  'Perception': 2,
  'Persuasion': 6,
  'Stealth': 2,
  'Composition': 6,
  'Handgun': 6,
  'Melee Weapon': 6,
  'Personal Grooming': 4,
  'Play Instrument': 6,
  'Streetwiswe': 6,
  'Wardrobe & Style': 4
};

const Map medtechSB = {
  'Athletics': 2,
  'Brawling': 6,
  'Concentration': 2,
  'Conversation': 2,
  'Education': 2,
  'Evasion': 6,
  'First Aid': 6,
  'Human Perception': 6,
  'Language (Streetslang)': 2,
  'Local Expert (Your Home)': 4,
  'Perception': 2,
  'Persuasion': 6,
  'Stealth': 2,
  'Composition': 6,
  'Handgun': 6,
  'Melee Weapon': 6,
  'Personal Grooming': 4,
  'Play Instrument': 6,
  'Streetwiswe': 6,
  'Wardrobe & Style': 4
};

const Map techSB = {
  'Athletics': 2,
  'Brawling': 6,
  'Concentration': 2,
  'Conversation': 2,
  'Education': 2,
  'Evasion': 6,
  'First Aid': 6,
  'Human Perception': 6,
  'Language (Streetslang)': 2,
  'Local Expert (Your Home)': 4,
  'Perception': 2,
  'Persuasion': 6,
  'Stealth': 2,
  'Composition': 6,
  'Handgun': 6,
  'Melee Weapon': 6,
  'Personal Grooming': 4,
  'Play Instrument': 6,
  'Streetwiswe': 6,
  'Wardrobe & Style': 4
};

const Map<String, int> rockerItems = {
  //Add items
  'Very Heavy Pistol': 0,
  'Basic VH Pistol': 0,
  'Ammunition x50': 0,
  ',Heavy Melee Weapon,Flashbang Grenade': 1, //toggle 1
  'Teargas Grenade x2': 0,
  'Light Armorjack Body Armor (SP11)': 0,
  'Light Armorjack Head Armor (SP11)': 0
};

const Map<String, String> awarenessSkills = {
  'Concentration': 'WILL',
  'Conceal/Reveal Object': 'INT',
  'Lip Reading': 'INT',
  'Perception': 'INT',
  'Tracking': 'INT'
};

const Map<String, String> bodySkills = {
  'Athletics': 'DEX',
  'Contortionist': 'DEX',
  'Dance': 'DEX',
  'Endurance': 'WILL',
  'Resist Torture/Drugs': 'WILL',
  'Stealth': 'DEX'
};

const Map<String, String> controlSkills = {
  'Drive Land Vehicle': 'REF',
  'Pilot Air Vehicle (x2)': 'REF',
  'Pilot Sea Vehicle': 'REF',
  'Riding': 'REF'
};

const Map<String, String> educationSkills = {
  'Account': 'INT',
  'Animal Handling': 'INT',
  'Bureaucracy': 'INT',
  'Business': 'INT',
  'Composition': 'INT',
  'Criminology': 'INT',
  'Cryptography': 'INT',
  'Deduction': 'INT',
  'Education': 'INT',
  'Gamble': 'INT',
  'Language': 'INT',
  'Library Search': 'INT',
  'Local Expert': 'INT',
  'Science': 'INT',
  'Tactics': 'INT',
  'Wilderness Survival': 'INT',
};

const Map<String, String> fightingSkills = {
  'Brawling': 'DEX',
  'Evasion': 'DEX',
  'Martial Arts (x2)': 'DEX',
  'Melee Weapon': 'DEX',
};

const Map<String, String> performanceSkills = {
  'Acting': 'COOL',
  'PLay Instrument': 'TECH'
};

const Map<String, String> rangedWeaponSkills = {
  'Archery': 'REF',
  'Autofire (x2)': 'REF',
  'Handgun': 'REF',
  'Heavy Weapon (x2)': 'REF',
  'Shoulder Arms': 'REF',
};

const Map<String, String> socialSkills = {
  'Bribery': 'COOL',
  'Conversation': 'EMP',
  'Human Perception': 'EMP',
  'Interrogation': 'COOL',
  'Persuasion': 'COOL',
  'Personal Grooming': 'COOL',
  'Streetwise': 'COOL',
  'Trading': 'COOL',
  'Wardrobe & Style': 'COOL',
};

const Map<String, String> techniqueSkills = {
  'Air Vehicle Tech': 'TECH',
  'Basic Tech': 'TECH',
  'Cybertech': 'TECH',
  'Demolitions': 'TECH',
  'Electronics/Security Tech (x2)': 'TECH',
  'First Aid': 'TECH',
  'Forgery': 'TECH',
  'Land Vehicle Tech': 'TECH',
  'Paint/Draw/Sculpt': 'TECH',
  'Paramedic (x2)': 'TECH',
  'Photography/Film': 'TECH',
  'Pick Lock': 'TECH',
  'Pick Pocket': 'TECH',
  'Sea Vehicle Tech': 'TECH',
  'Weaponstech': 'TECH',
};

List<WeaponRanged> weaponRanged = [
  WeaponRanged("Medium Pistol", "Handgun", 2, 12, 2, 1, false, true),
  WeaponRanged("Heavy Pistol", "Handgun", 3, 8, 2, 1, false, true),
  WeaponRanged("Very Heavy Pistol", "Handgun", 4, 8, 1, 1, false, false),
  WeaponRanged("SMG", "Handgun", 2, 30, 1, 1, true, true),
  WeaponRanged("Heavy SMG", "Handgun", 3, 40, 1, 1, true, false),
  WeaponRanged("Shotgun", "Shoulder Arms", 5, 4, 1, 2, false, false)
];

List<WeaponMelee> weaponMelee = [
  WeaponMelee("Combat Knife", 1, 2, 1, true),
  WeaponMelee("Baseball Bat", 2, 2, 2, false),
  WeaponMelee("Crowbar", 2, 2, 1, false),
  WeaponMelee("Sword", 3, 2, 2, false),
  WeaponMelee("Sledgehammer", 4, 1, 2, false)
];

List<Armor> armor = [
  Armor("Leathers", 4, 0, false, 4),
  Armor("Kevlar", 7, 0, false, 7),
  Armor("Light Armorjack", 11, 0, false, 11),
  Armor("Bodyweight Suit", 11, 0, false, 11),
  Armor("Medium Armorjack", 12, 0, true, 12),
  Armor("Heavy Armorjack", 13, 0, true, 13)
];
