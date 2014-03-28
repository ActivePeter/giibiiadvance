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

#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdlib.h>

#include "window_handler.h"
#include "debug_utils.h"
#include "font_utils.h"
#include "file_utils.h"
#include "sound_utils.h"
#include "config.h"
#include "gui/win_main.h"

static int Init(void)
{
    Config_Load();
    atexit(Config_Save);

    WH_Init();

    //Initialize SDL
    if( SDL_Init(SDL_INIT_EVERYTHING) != 0 )
    {
        Debug_LogMsgArg( "SDL could not initialize! SDL Error: %s\n", SDL_GetError() );
        return 1;
    }
    atexit(SDL_Quit);

    //Enable VSync
    //if(!SDL_SetHint( SDL_HINT_RENDER_VSYNC, "1"))
    //{
    //    DU_Log("Warning: VSync not enabled!");
    //}

    Sound_Init();

    if(DirCheckExistence(DirGetScreenshotFolderPath()) == 0)
        DirCreate(DirGetScreenshotFolderPath());

    if(DirCheckExistence(DirGetBiosFolderPath()) == 0)
        DirCreate(DirGetBiosFolderPath());

    return 0;
}

#define FLOAT_MS_PER_FRAME ((float)1000.0/(float)60.0)

int main( int argc, char * argv[] )
{
    Debug_Init();
    atexit(Debug_End);

    if(argc > 0) Debug_LogMsgArg("argv[0] = %s",argv[0]);
    if(argc > 1) Debug_LogMsgArg("argv[1] = %s",argv[1]);

    if(argc > 0)
        DirSetRunningPath(argv[0]); // whatever...

    if(Init() != 0)
        return 1;

    Win_MainCreate( (argc > 1) ? argv[1] : NULL );

    Debug_LogMsgArg(DirGetRunningPath());
    Debug_LogMsgArg(DirGetBiosFolderPath());
    Debug_LogMsgArg(DirGetScreenshotFolderPath());

    //if(argc > 1) LOAD_GAME(argv[1]);

    float waitforticks = 0;

    while( !WH_AreAllWindowsClosed() )
    {
        //Handle all window events
        WH_HandleEvents();

        Win_MainLoopHandle();

        //Render main window every frame
        Win_MainRender();

        //-------------------

        while(waitforticks >= SDL_GetTicks()) SDL_Delay(1);

        int ticksnow = SDL_GetTicks();
        if(waitforticks < (ticksnow - FLOAT_MS_PER_FRAME)) // if lost a frame or more
            waitforticks = ticksnow + FLOAT_MS_PER_FRAME;
        else
            waitforticks += FLOAT_MS_PER_FRAME;
    }

    return 0;
}

