#include <SDL.h>
#include <SDL_image.h>
#include <stdio.h>
#include <conio.h>

int main(int argc, char* argv[]) {
    SDL_Surface* image_surface;
    SDL_Window *window;
    SDL_Surface *screen_surface;

    const char *img_hir = "/usr/share/atomix/atomix.hir";
    unsigned char atomix_img_width = 28;
    unsigned char atomix_img_height = 40;
    printf("Chargement de l'image: %s\n", img_hir);


   // 1. Initialisation
    SDL_Init(SDL_INIT_VIDEO);
    IMG_Init(IMG_INIT_HRS);

    // 2. Créer une fenêtre et obtenir sa surface
    window = SDL_CreateWindow(
        "sdk-image test",
        SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED,
        240, 200,
        0);

    screen_surface = SDL_GetWindowSurface(window);
/*
    // 3. Charger une image dans une surface
    SDL_Surface *image = IMG_Load("image.png");
    if (!image) {
        printf("Erreur de chargement : %s\n", IMG_GetError());
        return 1;
    }

    // 4. Copier l'image sur la surface de la fenêtre avec SDL_BlitSurface
    SDL_BlitSurface(image, NULL, screen_surface, NULL);

    // 5. Mettre à jour l'affichage
    SDL_UpdateWindowSurface(window);

    // 6. Attendre 3 secondes
    SDL_Delay(3000);

    // 7. Libérer les ressources
    SDL_FreeSurface(image);
    SDL_DestroyWindow(window);
    IMG_Quit();
    SDL_Quit();

    return 0;
*/



    // Initialisation de SDL
    /*
if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        fprintf(stderr, "Erreur d'initialisation de SDL: %s\n", SDL_GetError());
        return 1;
    }

    // Initialisation de SDL_image
    if (IMG_Init(IMG_INIT_PNG | IMG_INIT_JPG) != (IMG_INIT_PNG | IMG_INIT_JPG)) {
        fprintf(stderr, "Erreur d'initialisation de SDL_image: %s\n", IMG_GetError());
        SDL_Quit();
        return 1;
    }

    // Création de la fenêtre
    SDL_Window* window = SDL_CreateWindow(
        "Exemple IMG_Load avec SDL2",
        SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED,
        800, 600,
        SDL_WINDOW_SHOWN
    );
    if (!window) {
        fprintf(stderr, "Erreur de création de la fenêtre: %s\n", SDL_GetError());
        IMG_Quit();
        SDL_Quit();
        return 1;
    }

    // Création du rendu
    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (!renderer) {
        fprintf(stderr, "Erreur de création du rendu: %s\n", SDL_GetError());
        SDL_DestroyWindow(window);
        IMG_Quit();
        SDL_Quit();
        return 1;
    }

    // Chargement de l'image avec IMG_Load
    */
    image_surface = IMG_Load(img_hir);
    if (!image_surface) {
        SDL_Quit();
        printf("Erreur de chargement de l'image: %s\n", IMG_GetError());
    /*
        SDL_DestroyRenderer(renderer);
        SDL_DestroyWindow(window);
        IMG_Quit();
        SDL_Quit();
*/
        return 1;
    }
    else {
        printf("Img load OK: %s\n", img_hir);
    }


    image_surface->w = atomix_img_width;
    image_surface->h = atomix_img_height;

      SDL_BlitSurface(image_surface, NULL, screen_surface, NULL);
/*
    // 5. Mettre à jour l'affichage
    SDL_UpdateWindowSurface(window);

    // 6. Attendre 3 secondes
    SDL_Delay(3000);

    // 7. Libérer les ressources
    SDL_FreeSurface(image);
    SDL_DestroyWindow(window);
    IMG_Quit();
    SDL_Quit();

    return 0;
*/

/*
    // Conversion de la surface en texture pour le rendu
    SDL_Texture* image_texture = SDL_CreateTextureFromSurface(renderer, image_surface);
    SDL_FreeSurface(image_surface); // Libération de la surface
    if (!image_texture) {
        fprintf(stderr, "Erreur de création de la texture: %s\n", SDL_GetError());
        SDL_DestroyRenderer(renderer);
        SDL_DestroyWindow(window);
        IMG_Quit();
        SDL_Quit();
        return 1;
    }

    // Boucle principale
    int running = 1;
    SDL_Event event;
    while (running) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = 0;
            }
        }

        // Effacer l'écran
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
        SDL_RenderClear(renderer);

        // Afficher l'image
        SDL_Rect dest_rect = {100, 100, 600, 400}; // Position et taille de l'image
        SDL_RenderCopy(renderer, image_texture, NULL, &dest_rect);

        // Mise à jour de l'écran
        SDL_RenderPresent(renderer);
    }

    // Nettoyage
    SDL_DestroyTexture(image_texture);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    IMG_Quit();
*/
    cgetc();
    SDL_Quit();

    return 0;
}