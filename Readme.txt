	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2013 Nicolas BOITEUX

	Dynamic Civilian Life v 1.1 (DCL)
	
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

	Create dynamic civilian life in towns
	
	Usage:
		put the directory DCL in your mission directory
		put this code into your mission init.sqf
		[] execVM "DCL\init.sqf";

	See example mission in directory: civilian_life.Altis
	
	Licence: 
	You can share, modify, distribute this script but don't remove the licence and the name of the original author

	logs:
		1.2
			add HC client support
			add civilian side
			replace side detection by player detection (fix depop problem)
		1.1 
			MP support - tune optimization
			Fix side support 
		1.0 original version - pedestrian life on ALTIS