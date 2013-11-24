	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2013 Nicolas BOITEUX

	Dynamic Civilian Life 
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	// This script runs only on server side
	if!(isserver) exitwith {};

	private ["_side"];

	_position = _this select 0;

	_allunits = [];
	_back = [];
	_positions = [];
	_start = true;

	switch (toUpper(DCLpopsidecondition)) do {
		case "WEST": {
			_side = [west];
		};

		case "EAST": {
			_side = [east];
		};

		case "GUER": {
			_side = [resistance];
		};

		default {
			_side = [west, east, resistance];
		};
	};

	DCLcountside = {
		private ["_array", "_count", "_side"];
		_array = _this select 0;
		_side = _this select 1;
		_count = 0;
		if (isnil "_array") exitwith {_count = 0; _count;};
		{
			if(side _x in _side) then {
				_count = _count + 1;
			};
			sleep 0.0001;
		}foreach _array;
		_count;
	};

	_active = createTrigger["EmptyDetector", _position];
	_active setTriggerArea[DCLdistancepop, DCLdistancepop, 0, false];
	_active setTriggerActivation[DCLpopsidecondition, "PRESENT", TRUE];
	_active setTriggerStatements["", "", ""];

	while { ([(list _active), _side] call DCLcountside == 0) } do { sleep (random 5); };

	_buildings = nearestObjects[_position,["House_F"], 150];
	sleep 1;
	{
		_index = 0;
		while { format ["%1", _x buildingPos _index] != "[0,0,0]" } do {
			_positione = _x buildingPos _index;
			_positions = _positions + [_positione];
			_index = _index + 1;
		};
	}foreach _buildings;

	_number = 1 + round (random DCLgroupsize);
	_group = creategroup civilian;
	for "_x" from 0 to _number do {
		_civiltype = civilclass call BIS_fnc_selectRandom;
		_position = _positions call BIS_fnc_selectRandom;
		_civilrole = "civil";
		_back = _back + [[_civiltype, _position, _civilrole]];

	};

	while { true } do {
		// restore civils
		if(([(list _active), _side] call DCLcountside == 0) or _start) then {
			_start = false;
			{
				if(alive _x) then {
					_civilrole = _x getvariable "civilrole";
					_back = _back + [[typeof _x, position _x, _civilrole]];
					_x removeAllEventHandlers "Killed";
					_x setdammage 1;
					deletevehicle _x;
				};
			}foreach (units _group);
			deletegroup _group;
			while { ([(list _active), _side] call DCLcountside == 0) } do { sleep (random 5); };
			_group = creategroup civilian;
			{
				_civiltype = _x select 0;
				_civil = _group createUnit [_civiltype, (_x select 1), [], 0, "FORM"];
				_position = _positions call BIS_fnc_selectRandom;
				_civil setvariable ["civilrole", (_x select 2), true];
				_civil setvariable ["destination", _position, false];
				_civil setvariable ["wcprotected", true, false];
				_civil addeventhandler ['FiredNear', {
					(_this select 0) playMove 'AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon';
					(_this select 0) stop true;
				}];
				sleep 0.01;
			}foreach _back;
			wcgarbage = [_group] spawn walk;
			_back = [];
		};
		sleep 5;
	};