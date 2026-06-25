# SDL_BlitSurface

## Function Documentation

### `SDL_Surface* SDL_BlitSurface(SDL_Surface *src, SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect)`

Perform a fast blit from the source surface to the destination surface.

#### Parameters

- **src** - Pointer to the source SDL_Surface structure.
- **srcrect** - Currently ignored in this implementation. The entire source surface is always blitted.
- **dst** - Pointer to the destination SDL_Surface structure.
- **dstrect** - Pointer to SDL_Rect structure. Only the x and y positions from the SDL_Rect are used to determine the destination position. The width and height members are ignored and are taken from the source surface.

#### Return Value

Returns 0 on success, or -1 on failure.

#### Remarks

- In this implementation, the **srcrect** parameter is currently not used. The function always blits the entire source surface.
- For **dstrect**, only the **x** and **y** fields are used to specify the destination position. The width and height are taken from the source surface dimensions.
- If you need specific width and height scaling, use SDL_BlitScaled() instead.

#### See Also

- [SDL_BlitScaled](_SDL_BlitScaled.md)
- [SDL_Surface](_SDL_Surface.md)
- [SDL_Rect](_SDL_Rect.md)
