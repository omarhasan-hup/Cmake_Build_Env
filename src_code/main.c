
#define F_CPU 1000000L

#include <avr/io.h>
#include <util/delay.h>
#include <stddef.h>
#include <stdio.h>                     /* This ert_main.c example uses printf/fflush */
#include "Controller.h"                /* Model's header file */
#include "rtwtypes.h"

static RT_MODEL_Controller_T Controller_M_;
static RT_MODEL_Controller_T *const Controller_MPtr = &Controller_M_;/* Real-time model */
static DW_Controller_T Controller_DW;  /* Observable states */

/* '<Root>/Out1' */
static uint8_T Controller_Y_Out1;

/*
 * Associating rt_OneStep with a real-time clock or interrupt service routine
 * is what makes the generated code "real-time".  The function rt_OneStep is
 * always associated with the base rate of the model.  Subrates are managed
 * by the base rate from inside the generated code.  Enabling/disabling
 * interrupts and floating point context switches are target specific.  This
 * example code indicates where these should take place relative to executing
 * the generated code step function.  Overrun behavior should be tailored to
 * your application needs.  This example simply sets an error status in the
 * real-time model and returns from rt_OneStep.
 */
void rt_OneStep(RT_MODEL_Controller_T *const Controller_M);
void rt_OneStep(RT_MODEL_Controller_T *const Controller_M)
{
  static boolean_T OverrunFlag = false;

  /* Disable interrupts here */

  /* Check for overrun */
  if (OverrunFlag) {
    rtmSetErrorStatus(Controller_M, "Overrun");
    return;
  }

  OverrunFlag = true;

  /* Save FPU context here (if necessary) */
  /* Re-enable timer or interrupt here */
  /* Set model inputs here */

  /* Step the model */
  Controller_step(Controller_M, &Controller_Y_Out1);

  /* Get model outputs here */

  /* Indicate task complete */
  OverrunFlag = false;

  /* Disable interrupts here */
  /* Restore FPU context here (if necessary) */
  /* Enable interrupts here */
}

/*
 * The example "main" function illustrates what is required by your
 * application code to initialize, execute, and terminate the generated code.
 * Attaching rt_OneStep to a real-time clock is target specific.  This example
 * illustrates how you do this relative to initializing the model.
 */
int_T main(int_T argc, const char *argv[])
{
	DDRD  = DDRD & (~(1<<PD4)); // configure pin 4 in PORTD as input pin
	DDRC |= 0x0F; // configure first four pins of PORTC as output pins
	
	// initialize the 7-segment
	PORTC &= ~((1<<PC0) | (1<<PC1) | (1<<PC2) | (1<<PC3));
  RT_MODEL_Controller_T *const Controller_M = Controller_MPtr;

  /* Unused arguments */
  (void)(argc);
  (void)(argv);

  /* Pack model data into RTM */
  Controller_M->dwork = &Controller_DW;

  /* Initialize model */
  Controller_initialize(Controller_M, &Controller_Y_Out1);

  /* Attach rt_OneStep to a timer or interrupt service routine with
   * period 1.0 seconds (the model's base sample time) here.  The
   * call syntax for rt_OneStep is
   *
   *  rt_OneStep(Controller_M);
   */
  printf("Warning: The simulation will run forever. "
         "Generated ERT main won't simulate model step behavior. "
         "To change this behavior select the 'MAT-file logging' option.\n");
  fflush((NULL));
  while (rtmGetErrorStatus(Controller_M) == (NULL)) {
    /*  Perform other application tasks here */
	rt_OneStep(Controller_M);

	PORTC = (PORTC & 0xF0) | (Controller_Y_Out1 & 0x0F);

	_delay_ms(500);
  }

  /* Disable rt_OneStep() here */

  /* Terminate model */
  Controller_terminate(Controller_M);
  return 0;
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
