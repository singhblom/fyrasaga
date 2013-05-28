import 'dart:html';
import 'package:web_ui/web_ui.dart';


class Character {
  Map characteristics = {"Intelligence":0,"Perception":0,"Strength":0,"Stamina":0,"Presence":0,
                         "Communication":0,"Quickness":0,"Dexterity":0};
  int age = 0;
  int year = 0;
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
  
  Character.fromJson(Map json) {
    characteristics = json['Characteristics'];
    age = json['Age'];
    year = json['Year'];
    magus = json['Magus'];
    virtuesAndFlaws = json['Virtues and flaws'];
    skills = json['Skills'];
    relationships = json['Relationships'];
    arts = json['Arts'];
    personality = json['Personality'];
    belongings = json['Belongings'];
    chronicle = json['Chronicle'];
  }
}


var c = new Character("Name McNamesson");

int pyramid(number) {
  if (number > 0) return (number*(number+1)/2).round();
  else return -(number*(number-1)/2).round();
}

int totalCost() {
  int tot = 0;
  c.characteristics.forEach((k,v) => tot = tot+pyramid(v));
  return tot;
}

void addVirtueOrFlaw(Event e) {
  e.preventDefault(); // don't submit the form
  var input = query('#new_virtue_or_flaw');
  if (input.value == '') return;
  c.virtuesAndFlaws[input.value]="";
  input.value = '';
}


void addSkill(Event e) {
  e.preventDefault(); // don't submit the form
  var input = query('#new_skill');
  if (input.value == '') return;
  c.skills[input.value]=0;
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
