---

## IMG_Load

***Description***

Load an image from a file and return an SDL_Surface pointer. We only manage files smaller than 64KB. It means that a file larger than 64KB will be loaded but only the first 64KB will be used.

***Input***

* Accumulator : ptr to a null-terminated string containing the file path of the image to load (low byte)
* X Register : ptr to a null-terminated string containing the file path of the image to load. (high byte)


***Returns***

* Accumulator : pointer to an SDL_Surface containing the loaded image, or NULL on failure.
* Y Register : pointer to an SDL_Surface containing the loaded image, or NULL on failure.

***Example***

```asm
 jsr IMG_Load
 rts
```

