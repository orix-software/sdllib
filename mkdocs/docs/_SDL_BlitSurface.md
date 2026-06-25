## int SDL_BlitSurface(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect);


***Description***

Perform a fast blit from the source surface to the destination surface.

***Input***

* src Pointer to the source SDL_Surface structure.
* srcrect Currently ignored. Intended for source rectangle definition (not implemented).
* dst Pointer to the destination SDL_Surface structure.
* dstrect Pointer to SDL_Rect structure. Only the x and y positions are used; width and height are ignored and taken from the source surface.

***Returns***

* Returns 0 on success, or -1 on failure.
