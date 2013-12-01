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

	generate_zone	= compile preprocessFile "DCL\generate_zone.sqf";
	walk		= compile preprocessFile "DCL\walk.sqf";

	civilclass = ["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_Orestes","C_Nikos","C_man_p_fugitive_F","C_man_p_fugitive_F_afro","C_man_p_fugitive_F_euro","C_man_p_fugitive_F_asia","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_beggar_F_euro","C_man_p_beggar_F_asia","C_man_w_worker_F","C_man_hunter_1_F","C_man_p_shorts_1_F","C_man_p_shorts_1_F_afro","C_man_p_shorts_1_F_euro","C_man_p_shorts_1_F_asia","C_man_shorts_1_F","C_man_shorts_1_F_afro","C_man_shorts_1_F_euro","C_man_shorts_1_F_asia","C_man_shorts_2_F","C_man_shorts_2_F_afro","C_man_shorts_2_F_euro","C_man_shorts_2_F_asia","C_man_shorts_3_F","C_man_shorts_3_F_afro","C_man_shorts_3_F_euro","C_man_shorts_3_F_asia","C_man_shorts_4_F","C_man_shorts_4_F_afro","C_man_shorts_4_F_euro","C_man_shorts_4_F_asia","C_man_pilot_F","C_man_polo_1_F_afro","C_man_polo_1_F_euro","C_man_polo_1_F_asia","C_man_polo_2_F_afro","C_man_polo_2_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F_afro","C_man_polo_3_F_euro","C_man_polo_3_F_asia","C_man_polo_4_F_afro","C_man_polo_4_F_euro","C_man_polo_4_F_asia","C_man_polo_5_F_afro","C_man_polo_5_F_euro","C_man_polo_5_F_asia","C_man_polo_6_F_afro","C_man_polo_6_F_euro","C_man_polo_6_F_asia"];
	DCLaltistownpositions = [[20875,6575],[20775,6675],[20875,6675],[20775,6775],[20875,6775],[21675,7575],[21775,7575],[20475,8875],[20575,8875],[3775,11075],[3875,11075],[5175,11075],[3875,11175],[5075,11175],[5175,11175],[5075,11275],[5175,11275],[4975,11375],[5075,11375],[9475,11575],[20175,11575],[4175,11675],[20175,11675],[20275,11675],[4075,11775],[4175,11775],[20175,11775],[20275,11775],[9075,11875],[9175,11875],[9275,11875],[9375,11875],[8975,11975],[9075,11975],[9175,11975],[8875,12075],[8975,12075],[9075,12075],[10675,12175],[10575,12275],[10675,12275],[16575,12475],[16675,12475],[16775,12475],[16775,12575],[16875,12575],[16975,12575],[3475,12675],[16775,12675],[16875,12675],[16975,12675],[3475,12775],[3575,12775],[3775,12775],[3875,12775],[16775,12775],[16875,12775],[3475,12875],[3575,12875],[3675,12875],[16775,12875],[16875,12875],[3275,12975],[3375,12975],[3475,12975],[3575,12975],[3675,12975],[3375,13075],[3475,13075],[3575,13075],[3675,13075],[3275,13175],[3375,13175],[3475,13175],[3575,13175],[17375,13175],[17475,13175],[3475,13275],[3575,13275],[3675,13275],[3775,13275],[19375,13275],[19475,13275],[3575,13375],[10975,13375],[11075,13375],[3675,13475],[3775,13475],[3575,13575],[3675,13575],[3775,13575],[3875,13575],[3775,13675],[3875,13675],[3975,13675],[11675,13675],[3675,13775],[3775,13775],[3875,13775],[3975,13775],[11775,13775],[3875,13875],[3575,13975],[12375,14175],[3375,14275],[12275,14275],[12375,14275],[12575,14275],[12675,14275],[12475,14375],[12575,14375],[12675,14375],[3575,14475],[12475,14475],[11075,14575],[11175,14575],[4275,15075],[9575,15075],[12875,15075],[12975,15075],[17975,15175],[18075,15175],[18175,15175],[17975,15275],[18075,15275],[18175,15275],[18275,15275],[7375,15375],[18175,15375],[12375,15575],[12475,15575],[20575,15675],[9075,15775],[9275,15775],[20775,15775],[9175,15875],[9275,15875],[9375,15875],[9375,15975],[9475,15975],[9575,15975],[9575,16075],[16675,16075],[4775,16175],[4875,16175],[15575,16175],[16675,16175],[6275,16275],[14175,16275],[15275,16275],[15975,16275],[21275,16375],[21375,16375],[21475,16375],[21575,16375],[7175,16475],[18775,16575],[18875,16575],[18775,16675],[18675,16775],[20875,16875],[20975,16875],[20875,16975],[20975,16975],[21075,16975],[15975,17075],[20875,17075],[20975,17075],[16475,17175],[20975,17175],[10475,17275],[16175,17275],[16275,17275],[16375,17275],[16475,17275],[14475,17575],[14575,17575],[14475,17675],[8575,18275],[8675,18275],[13975,18575],[14075,18575],[13875,18675],[13975,18675],[14075,18675],[13875,18775],[13975,18775],[14075,18775],[10275,19075],[10375,19075],[20975,19175],[9375,20275],[9475,20275],[25575,21275],[25675,21275],[25775,21275],[4575,21375],[25575,21375],[25675,21375],[25775,21375],[25775,21475],[26875,23175],[26975,23275],[27075,23275]];

	// civilian pop when players are at x meters
	DCLdistancepop = 800;

	// Civilians are in a group when they pop
	// Number max random of civilians in the group are x numbers
	DCLgroupsize = 5;

	// civilian can move in houses around x meters
	// of theirs initial position
	DCLdistancemove = 300;

	// civilian side
	DCLcivilianside = civilian;

	// HC client
	DCLusehclient = false;

	// HC client name
	DCLhclientname = "HC";

	{
		garbage = [_x] spawn generate_zone;
		sleep 0.01;
	}foreach DCLaltistownpositions;