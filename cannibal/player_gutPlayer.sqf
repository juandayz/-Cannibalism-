//by juandayz // original idea seaweeduk

private ["_corpse","_hastool","_humanity","_hunger"];
_corpse = _this select 3;
if ((_corpse isKindOf "zZombie_base") or (_corpse isKindOf "Animal")) exitWith {"Only allowed on humans corpses."call dayz_rollingMessages;};

if (dayz_actionInProgress) exitWith {localize "str_epoch_player_40" call dayz_rollingMessages;};
dayz_actionInProgress = true;
player removeAction s_player_cannibal;
 s_player_cannibal = -1;


_hastool = false;
_humanity = player getVariable["humanity", 0]; 
_hunger = round(100 - (dayz_hunger / SleepFood) * 100);
call {
		if ("ItemKnife" in items player) exitwith {_hastool = true;};
		if ("ItemKnife5" in items player) exitwith {_hastool = true;};
		if ("ItemKnife4" in items player) exitwith {_hastool = true;};
		if ("ItemKnife3" in items player) exitwith {_hastool = true;};
		if ("ItemKnife2" in items player) exitwith {_hastool = true;};
		if ("ItemKnife1" in items player) exitwith {_hastool = true;};
		if ("ItemHatchet" in items player) exitwith {_hastool = true;};
		if ("ItemMachete" in items player) exitwith {_hastool = true;};
		if ("ItemKnifeBlunt" in items player) exitwith {_hastool = true;};
	};
if !(_hastool) exitWith {"You need something sharp to do it"call dayz_rollingMessages;dayz_actionInProgress = false;};
_corpse setVariable["meatHarvested",true,true];
player playActionNow "Medic";
["Working",0,[100,10,10,0]] call dayz_NutritionSystem;
[player, "gut", 0, false, 5] call dayz_zombieSpeak;
[player,5,true,(getPosATL player)] spawn player_alertZombies;
if (_humanity >=-2501) then {
playSound "heartbeat_1";
r_player_inpain = true;
player setVariable["USEC_inPain",true,true];
if (_hunger <= 25) then {[-20,0] call player_humanityChange;"You try to comfort yourself...you would have starved if you did not."call dayz_rollingMessages;}else {[-40,0] call player_humanityChange;"I was not dying of hunger, I do not know why I did it." call dayz_rollingMessages;}; 
}else{
"You cut the corpse. Every time you do it, you seem to enjoy it more." call dayz_rollingMessages;
};
["FoodBeefRaw",1,(round(random 3)*1)] call fn_dropItem;
dayz_actionInProgress = false;


