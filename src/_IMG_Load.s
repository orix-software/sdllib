.export _IMG_Load

.import IMG_Load

.proc _IMG_Load
    ;;@proto SDL_Surface* IMG_Load(unsigned char *filename);
    ;;@brief Load an image from a file and return a new surface with the image data.
    ;;@details The input file must have a .hrs extension. This function supports the HRS (Hires Screen) image format.
    ;;@param filename The file name of the image to load. Must have .hrs extension.
    ;;@returns A pointer to a new SDL_Surface containing the loaded image, or NULL on failure.
    ;;@note The returned surface should be freed with SDL_FreeSurface() when no longer needed.
    jmp    IMG_Load
.endproc

