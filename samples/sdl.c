#include <SDL.h>

int main(int argc, char argv[]) {

//SDL_Event event;
SDL_Init(SDL_INIT_VIDEO|SDL_INIT_JOYSTICK);
SDL_Window * window = SDL_CreateWindow("Displays",SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,240,200,0);

//SDL_Render * renderer = SDL_CreateRenderer(window,-1,0);
//SDL_Surface * image = SDL_LoadHRS("andre.hir");
//SDL_Texture * texture = SDL_CreateTextureFromSurface(renderer,image);

}

