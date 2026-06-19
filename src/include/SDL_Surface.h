typedef struct SDL_Surface
{
    void *pixels;
    unsigned char w;
    unsigned char h;
} SDL_Surface;


// Since 2026.3
void SDL_FreeSurface(SDL_Surface *surface);
SDL_Surface* SDL_GetWindowSurface(SDL_Window *window);
int SDL_BlitSurface(SDL_Surface *src, void *srcrect, SDL_Surface *dst, void *dstrect);