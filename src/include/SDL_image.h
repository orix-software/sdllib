
#include "SDL_Surface.h"

// Since 2026.3
void IMG_Init(unsigned char value);
SDL_Surface* IMG_Load(const char* file);

const char* IMG_GetError(void);

#define IMG_INIT_JPG 1
#define IMG_INIT_PNG 2
#define IMG_INIT_TIF 4
#define IMG_INIT_WEBP 8
#define IMG_INIT_JXL 16
#define IMG_INIT_AVIF 32
#define IMG_INIT_HRS 64

