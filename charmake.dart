import 'dart:html';
import 'package:web_ui/web_ui.dart';

//@observable
var characterName = "Name McNamesson";


// initial value for click-counter
var characteristics = {"Intelligence":0,"Perception":0,"Strength":0,"Stamina":0,"Presence":0,
                       "Communication":0,"Quickness":0,"Dexterity":0};

int pyramid(number) {
  if (number > 0) return (number*(number+1)/2).round();
  else return -(number*(number-1)/2).round();
}

int totalCost() {
  int tot = 0;
  characteristics.forEach((k,v) => tot = tot+pyramid(v));
  return tot;
}

var virtuesAndFlaws = [];

void addVirtueOrFlaw(Event e) {
  e.preventDefault(); // don't submit the form
  var input = query('#new_virtue_or_flaw');
  if (input.value == '') return;
  virtuesAndFlaws.add(input.value);
  input.value = '';
}

var skills = {};

void addSkill(Event e) {
  e.preventDefault(); // don't submit the form
  var input = query('#new_skill');
  if (input.value == '') return;
  skills[input.value]=0;
  input.value = '';
}


int totalSkillCost() {
  int tot = 0;
  skills.forEach((k,v) => tot = tot+5*pyramid(v));
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
