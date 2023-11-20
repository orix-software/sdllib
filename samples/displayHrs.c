#include <SDL2/SDL.h>

int main() {
    // Initialisation de SDL
    SDL_Window *window;
    SDL_Event event;
    int running = 1;

    SDL_Init(SDL_INIT_VIDEO);

    // Création de la fenêtre
    window = SDL_CreateWindow("Ma première fenêtre SDL", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, SDL_WINDOW_SHOWN);

    // Attente d'une fermeture de fenêtre

    while (running) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = 0;
            }
        }
    }

    // Destruction de la fenêtre et de SDL
    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}








