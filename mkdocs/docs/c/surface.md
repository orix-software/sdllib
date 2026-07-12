# SDL Image Test - sdlimg.c

```c
#include <SDL.h>
#include <SDL_rect.h>
#include <SDL_image.h>
#include <stdio.h>
#include <conio.h>

int main(int argc, char* argv[]) {
    SDL_Surface* image_surface;
    SDL_Window *window;
    SDL_Surface *screen_surface;
    SDL_Rect rect_atomix_position = {120, 20, 162, 50};
    const char *img_hir = "/usr/share/atomix/atomix.hir";
    unsigned char atomix_img_width = 162; // 162  27
    unsigned char atomix_img_height = 30;

    printf("Chargement de l'image: %s\n", img_hir);

    // 1. Initialization
    SDL_Init(SDL_INIT_VIDEO);
    IMG_Init(IMG_INIT_HRS);

    // 2. Create a window and get its surface
    window = SDL_CreateWindow(
        "sdk-image test",
        SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED,
        240, 200,
        0);

    screen_surface = SDL_GetWindowSurface(window);

    image_surface = IMG_Load(img_hir);
    if (!image_surface) {
        SDL_Quit();
        SDL_DestroyWindow(window);
        printf("Erreur de chargement de l'image: %s\n", IMG_GetError());
        IMG_Quit();
        return 1;
    }

    image_surface->w = atomix_img_width;
    image_surface->h = atomix_img_height;

    SDL_BlitSurface(image_surface, NULL, screen_surface, &rect_atomix_position);

    // 5. Update the display
    SDL_UpdateWindowSurface(window);

    // 6. Wait for 3 seconds
    SDL_Delay(3000);

    // 7. Free resources

    SDL_FreeSurface(image_surface);

    SDL_DestroyWindow(window);


    cgetc();
    IMG_Quit();
    SDL_Quit();

    return 0;
}
```
