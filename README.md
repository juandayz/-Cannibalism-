# -Cannibalism- Original idea by seaweeduk http://opendayz.net/threads/cannibalism.12218/
Allow players to get meat from dead players or death ai.

1.Open your fn_selfactions.sqf

***NOTE: IF URE USING ZABNS TAKE CLOTHES USE STEP B ELSE USE STEP A.



***STEP A:  WITHOUT TAKE CLOTHES.
PASTE:
```ruby
if (_isMan && {!_isAlive} && {!(_cursorTarget isKindOf "zZombie_base")} && {!(_cursorTarget getVariable["meatHarvested",false])}) then {
if (s_player_cannibal < 0) then {
	s_player_cannibal = player addAction ["butcher body","scripts\cannibal\player_gutPlayer.sqf",_cursorTarget,0, false,true];
};
} else {
player removeAction s_player_cannibal;
s_player_cannibal = -1;
};
```
BELOW OF:


	//Towing with tow truck
	/*
	if(_typeOfCursorTarget == "TOW_DZE") then {
		if (s_player_towing < 0) then {
			if(!(_cursorTarget getVariable ["DZEinTow", false])) then {
				s_player_towing = player addAction [localize "STR_EPOCH_ACTIONS_ATTACH" "\z\addons\dayz_code\actions\tow_AttachStraps.sqf",_cursorTarget, 0, false, true];				
			} else {
				s_player_towing = player addAction [localize "STR_EPOCH_ACTIONS_DETACH", "\z\addons\dayz_code\actions\tow_DetachStraps.sqf",_cursorTarget, 0, false, true];				
			};
		};
	} else {
		player removeAction s_player_towing;
		s_player_towing = -1;
	};
	*/



***STEP B: MERGE WITH TAKE CLOTHES.
FIND:
```ruby
// Take clothes by Zabn
if (_isMan && {!_isAlive} && {!(_cursorTarget isKindOf "zZombie_base")} && {!(_cursorTarget getVariable["clothesTaken",false])}) then {
```
BELOW PASTE:
```ruby
if !(_cursorTarget getVariable["meatHarvested",false]) then {
	if (s_player_cannibal < 0) then {
	s_player_cannibal = player addAction ["butcher body","scripts\cannibal\player_gutPlayer.sqf",_cursorTarget,0, false,true];
	};
}else{
player removeAction s_player_cannibal;
	s_player_cannibal = -1;
};
 ``` 
  
  2. Near of buttom find:
  ```ruby
  player removeAction s_player_fuelauto2;
	s_player_fuelauto2 = -1;
	player removeAction s_player_manageDoor;
	s_player_manageDoor = -1;
  ```
  
  Below PAste:
  
  ```ruby
  player removeAction s_player_cannibal;
 s_player_cannibal = -1;
 ```
 
 3.Open your variables.sqf  and add with the rest of actions:
 
 ```ruby
 s_player_cannibal = -1;  
 ```
 
 
 
 4.Drop cannibal folder into your scripts folder. 
