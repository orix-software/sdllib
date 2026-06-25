[![build](https://github.com/orix-software/sdllib/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/orix-software/sdllib/actions/workflows/main.yml)

# sdllib for orix and twilighte board

Provides :

* char SDL_Init(char value);
* void SDL_Quit();
* void SDL_GetRelativeMouseState(signed char *x, signed char *y);

# Build doc

For dev
mike deploy --update-aliases 2026.3 dev --allow-empty
mike serve
