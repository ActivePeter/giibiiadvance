/*
    GiiBiiAdvance - GBA/GB  emulator
    Copyright (C) 2011-2014 Antonio Ni�o D�az (AntonioND)

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

#ifndef __GBA_DEBUG_VIDEO__
#define __GBA_DEBUG_VIDEO__

void GBA_Debug_PrintZoomedSpriteAt(int spritenum, int buf_has_alpha_channel, char * buffer, int bufw, int bufh,
                                   int posx, int posy, int sizex, int sizey);

//starting sprite number = page*64
void GBA_Debug_PrintSpritesPage(int page, int buf_has_alpha_channel, char * buffer, int bufw, int bufh);

#endif // __GBA_DEBUG_VIDEO__
