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

#ifndef __GB_PPU_DMG__
#define __GB_PPU_DMG__

//----------------------------------------------------------------

#include "gameboy.h"

//----------------------------------------------------------------

void GB_PPUWriteLYC_DMG(int reference_clocks, int value);
void GB_PPUWriteLCDC_DMG(int reference_clocks, int value);
void GB_PPUWriteSTAT_DMG(int reference_clocks, int value);

//----------------------------------------------------------------

void GB_PPUUpdateClocks_DMG(int increment_clocks);

int GB_PPUGetClocksToNextEvent_DMG(void);

//----------------------------------------------------------------

#endif // __GB_PPU__
