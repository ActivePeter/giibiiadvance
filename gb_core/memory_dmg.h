/*
    GiiBiiAdvance - GBA/GB  emulator
    Copyright (C) 2011-2015 Antonio Ni�o D�az (AntonioND)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef __GB_MEMORY_DMG__
#define __GB_MEMORY_DMG__

//----------------------------------------------------------------

#include "gameboy.h"

//----------------------------------------------------------------

u32 GB_MemRead8_DMG_BootEnabled(u32 address);
u32 GB_MemRead8_DMG_BootDisabled(u32 address);

void GB_MemWrite8_DMG(u32 address, u32 value);

//----------------------------------------------------------------

u32 GB_MemReadReg8_DMG(u32 address);

void GB_MemWriteReg8_DMG(u32 address, u32 value);

//----------------------------------------------------------------

#endif //__GB_MEMORY_DMG__
