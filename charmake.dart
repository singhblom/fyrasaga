import 'dart:html';
import 'package:web_ui/web_ui.dart';
import 'dart:json' as json;


class Character {
  Map characteristics = {"Intelligence":0,"Perception":0,"Strength":0,"Stamina":0,"Presence":0,
                         "Communication":0,"Quickness":0,"Dexterity":0};
  String sAge = '0';
  String sYear = '0';
  bool magus = false;
  String name;
  Map virtuesAndFlaws = {};
  Map skills = {};
  Map relationships = {};
  Map arts = {};
  List personality = [];
  List belongings = [];
  Map chronicle = {};
  
  Character(this.name);
  
  Character.fromJson(Map input) {
    characteristics = input['Characteristics'];
    sAge = input['Age'].toString();
    sYear = input['Year'].toString();
    magus = input['Magus'];
    virtuesAndFlaws = input['Virtues and flaws'];
    skills = input['Skills'];
    relationships = input['Relationships'];
    arts = input['Arts'];
    personality = input['Personality'];
    belongings = input['Belongings'];
    chronicle = input['Chronicle'];
  }
  
  String stringify() {
    Map output = {};
    output['Characteristics'] = characteristics;
    output['Age'] = this.age;
    output['Year'] = this.year;
    output['Magus'] = magus;
    output['Virtues and flaws'] = virtuesAndFlaws;
    output['Skills'] = skills;
    output['Relationships'] = relationships;
    output['Arts'] = arts;
    output['Personality'] = personality;
    output['Belongings'] = belongings;
    output['Chronicle'] = chronicle;
    return json.stringify(output);
  }
  int get age => int.parse(sAge);
  int get year => int.parse(sYear);
}

var c = new Character("Outis");

int pyramid(number) {
  if (number > 0) return (number*(number+1)/2).round();
  else return -(number*(number-1)/2).round();
}

int totalCost() {
  int tot = 0;
  c.characteristics.forEach((k,v) => tot = tot+pyramid(v));
  return tot;
}

void addDescription(Event e, Map desc, String field, var init) {
  e.preventDefault(); // don't submit the form
  var input = query(field);
  if (input.value == '') return;
  desc[input.value]=init;
  input.value = '';
}


int totalSkillCost() {
  int tot = 0;
  c.skills.forEach((k,v) => tot = tot+5*pyramid(v));
  return tot;
}


/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/dart-web-components/.
 */
void main() {
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;
}
