## Syntax

SDL_Surface* IMG_Load(unsigned char *filename);


## Description

Load an image from a file and return a new surface with the image data.
## Details
The input file must have a .hrs extension. This function supports the HRS (Hires Screen) image format.

## Input

| param      | Description                          |
| ----------- | ------------------------------------ |
| filename | The |


***Returns***

* A pointer to a new SDL_Surface containing the loaded image, or NULL on failure.
!!! note "The returned surface should be freed with SDL_FreeSurface() when no longer needed."

