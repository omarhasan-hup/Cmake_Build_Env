/*
 * File: Controller.c
 *
 * Code generated for Simulink model 'Controller'.
 *
 * Model version                  : 1.11
 * Simulink Coder version         : 8.14 (R2018a) 06-Feb-2018
 * C/C++ source code generated on : Sun Sep 15 00:02:31 2024
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "Controller.h"
#include "Controller_private.h"

/* Model step function */
void Controller_step(RT_MODEL_Controller_T *const Controller_M, uint8_T
                     *Controller_Y_Out1)
{
  DW_Controller_T *Controller_DW = ((DW_Controller_T *) Controller_M->dwork);

  /* Outport: '<Root>/Out1' incorporates:
   *  UnitDelay: '<S2>/Output'
   */
  *Controller_Y_Out1 = Controller_DW->Output_DSTATE;

  /* Sum: '<S3>/FixPt Sum1' incorporates:
   *  Constant: '<S3>/FixPt Constant'
   *  UnitDelay: '<S2>/Output'
   */
  Controller_DW->Output_DSTATE++;

  /* Switch: '<S4>/FixPt Switch' incorporates:
   *  Constant: '<S4>/Constant'
   *  UnitDelay: '<S2>/Output'
   */
  if (Controller_DW->Output_DSTATE > 9) {
    Controller_DW->Output_DSTATE = 0U;
  }

  /* End of Switch: '<S4>/FixPt Switch' */
}

/* Model initialize function */
void Controller_initialize(RT_MODEL_Controller_T *const Controller_M, uint8_T
  *Controller_Y_Out1)
{
  DW_Controller_T *Controller_DW = ((DW_Controller_T *) Controller_M->dwork);

  /* Registration code */

  /* states (dwork) */
  (void) memset((void *)Controller_DW, 0,
                sizeof(DW_Controller_T));

  /* external outputs */
  (*Controller_Y_Out1) = 0U;
}

/* Model terminate function */
void Controller_terminate(RT_MODEL_Controller_T *const Controller_M)
{
  /* (no terminate code required) */
  UNUSED_PARAMETER(Controller_M);
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
