// For SDL_Init
#define SDL_INIT_EVENTS 0x01

#define SDL_WINDOWPOS_CENTERED 0x2F

#define SDL_CAN_NOT_BE_STORE_INTO_READ_ONLY_STORAGE $FE


char SDL_Init(char value); //  SDL_Init(SDL_INIT_VIDEO);
void SDL_Quit();
void SDL_Delay(unsigned int ms); // Delay execution for specified milliseconds
void SDL_GetRelativeMouseState(signed char *x, signed char *y);


// Since 2026.3
#define SDL_INIT_VIDEO 0X20

typedef struct SDL_Window SDL_Window;

SDL_Window* SDL_CreateWindow(const char *title, unsigned char x, unsigned char y, unsigned char w, unsigned char h, unsigned char flags);
void SDL_DestroyWindow(SDL_Window* win);



