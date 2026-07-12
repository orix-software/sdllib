---

## SDL_Init

***Description***

Sdl initialization

***Input***

* Accumulator : value to init sdl with SDL_INIT_EVENTS


***Returns***

* Accumulator : error code in sdl_error or A $00 if no error, else SDL_CAN_NOT_BE_STORE_INTO_READ_ONLY_STORAGE if lib is stored into read-only storage

***Example***

```asm
 jsr SDL_Init
 rts
```

SDL_Window sdl_window_main;