#include <SDL.h>
#include <stdio.h>

int main(int argc, char argv[]) {
// Démarre SDL avec la gestion des joysticks

int numJoystick;
int i;

SDL_Joystick pJoystick;

if ( SDL_Init(SDL_INIT_JOYSTICK) == -1 )
{
    printf("Erreur lors de l'initialisation de la SDL\n");
    return -1;
}

//SDL_Joystick* pJoystick = NULL;


numJoystick = SDL_NumJoysticks(); // Compte le nombre de joysticks

printf("Vous avez %d joysticks sur cette machine\n",numJoystick);
if ( numJoystick >= 1 )
{
    // Ouvre le premier joystick présent sur la machine
    pJoystick = SDL_JoystickOpen(0);
    if ( pJoystick == -1 )
    {
        printf("Erreur pour ouvrir le premier joystick\n");
    }
}

printf("Informations du joystick\n");
printf("Nom : %s\n",SDL_JoystickName(0));
printf("Nombre d'axes : %d\n",SDL_JoystickNumAxes(pJoystick));
// printf("Nombre de chapeaux : %d\n",SDL_JoystickNumHats(pJoystick));
// printf("Nombre de trackballs : %d\n",SDL_JoystickNumBalls(pJoystick));
printf("Nombre de boutons : %d\n",SDL_JoystickNumButtons(pJoystick));

// Gestion du joystick
SDL_JoystickUpdate(); // Mise à jour de l'état des joysticks

// Analyse des axes
for ( i = 0 ; i < SDL_JoystickNumAxes(pJoystick) ; i++ )
{
    printf("Axe %d à la valeur %d\n",i,SDL_JoystickGetAxis(pJoystick,i));
}

// Analyse des boutons
for ( i = 0 ; i < SDL_JoystickNumButtons(pJoystick) ; i++ )
{
    if ( SDL_JoystickGetButton(pJoystick,i) )
    {
        printf("Bouton %d appuyé\n",i);
    }
    else
    {
        printf("Bouton %d n'est pas appuyé\n",i);
    }
}

// Analyse des chapeaux
/*
for ( i = 0 ; i < SDL_JoystickNumHats(pJoystick) ; i++ )
{
    Uint8 hatValue = SDL_JoystickGetHat(pJoystick,i);
    printf("Chapeau %d : ",i);
    if ( hatValue == SDL_HAT_CENTERED )
    {
        printf("Retour position neutre\n");
    }
    if ( hatValue == SDL_HAT_DOWN )
    {
        printf("Position bas\n");
    }
    if ( hatValue == SDL_HAT_LEFT )
    {
        printf("Position gauche\n");
    }
    if ( hatValue == SDL_HAT_RIGHT )
    {
        printf("Position droite\n");
    }
    if ( hatValue == SDL_HAT_UP )
    {
        printf("Position haut\n");
    }
}

// Analyse du déplacement des trackballs
for ( i = 0 ; i < SDL_JoystickNumBalls(pJoystick) ; i++ )
{
    int dx = 0;
    int dy = 0;
    if ( SDL_JoystickGetBall(pJoystick,i,&dx,&dy) == 0)
    {
        printf("Trackball %d a été déplacée %d;%d\n",i,dx,dy);
    }
    else
    {
        fprintf(stderr,"Erreur de lecture de la trackball %d\n",i);
    }
}
*/
}

