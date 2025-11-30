#include <SDL.h>
#include <stdio.h>
#include <stdbool.h>

int main(int argc, char* argv[]) {
    bool est_en_cours = true;
    signed char x, y;


    // --- 1. Initialisation de la SDL pour les Événements (et non la Vidéo) ---
    // Note : Certains OS/Drivers peuvent quand même nécessiter SDL_INIT_VIDEO
    // même pour les événements souris.
    if (SDL_Init(SDL_INIT_EVENTS) < 0) {
        fprintf(stderr, "Erreur d'initialisation de la SDL (EVENTS)\n");
        return 1;
    }

    printf("Programme demarre. Appuyez sur ECHAP pour quitter.\n");

    // --- 2. Boucle principale ---
    while (est_en_cours) {

        SDL_GetRelativeMouseState(&x, &y);
        printf("x:%d y:%d\n", x, y);

    }

    // --- 4. Nettoyage et sortie ---
    SDL_Quit();

    return 0;
}