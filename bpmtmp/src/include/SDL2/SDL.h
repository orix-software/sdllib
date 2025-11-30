#define SDL_INIT_VIDEO          2
#define SDL_INIT_JOYSTICK       4

#define SDL_WINDOWPOS_UNDEFINED 255
#define SDL_WINDOWPOS_UNDEFINED 255
#define SDL_WINDOW_SHOWN        255

#define SDL_QUIT 27

typedef struct{
unsigned char test;
} SDL_Window;


typedef struct {
  unsigned char type;
//   SDL_ActiveEvent active;
//   SDL_KeyboardEvent key;
//   SDL_MouseMotionEvent motion;
//   SDL_MouseButtonEvent button;
//   SDL_JoyAxisEvent jaxis;
//   SDL_JoyBallEvent jball;
//   SDL_JoyHatEvent jhat;
//   SDL_JoyButtonEvent jbutton;
//   SDL_ResizeEvent resize;
//   SDL_ExposeEvent expose;
//   SDL_QuitEvent quit;
//   SDL_UserEvent user;
//   SDL_SysWMEvent syswm;
} SDL_Event;

// struct _SDL_Joystick;
// typedef struct _SDL_Joystick SDL_Joystick;

typedef int SDL_Joystick;

int SDL_Init(char value);
SDL_Window *SDL_CreateWindow(char *str, char temp, char temp2, char sizewindowx, char sizewindowy,char temp3);
void SDL_DestroyWindow(SDL_Window * window);
void SDL_Quit();

unsigned char SDL_PollEvent(SDL_Event *event);

//SDL_Texture *SDL_CreateTexture(SDL_Renderer* renderer, char format, char access, char w, char h);

// void SDL_BlitSprite(unsigned char x, unsigned char y, unsigned char w, unsigned char h);

/* Joysticks */
unsigned char SDL_NumJoysticks(void);
SDL_Joystick SDL_JoystickOpen(unsigned char id_joystick);
char          *SDL_JoystickName(unsigned char id_joystick);
unsigned char SDL_JoystickNumAxes(unsigned char id_joystick);
unsigned char SDL_JoystickNumHats(unsigned char id_joystick);

void SDL_JoystickUpdate();

unsigned char SDL_JoystickNumButtons(unsigned char id_joystick);

unsigned char SDL_JoystickGetAxis(SDL_Joystick pJoystick, unsigned char dunno);

unsigned char SDL_JoystickGetButton(SDL_Joystick pJoystick, unsigned char dunno);

unsigned char  _SDL_JoystickNumButtons;


/* Mouse*/
#define SDL_BUTTON_LEFT 10
// unsigned char SDL_GetMouseState(int *x, int *y);
// unsigned char SDL_BUTTON(unsigned char event);
