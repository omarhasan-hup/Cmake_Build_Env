/*
 * File: Controller.h
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

#ifndef RTW_HEADER_Controller_h_
#define RTW_HEADER_Controller_h_
#include <string.h>
#ifndef Controller_COMMON_INCLUDES_
# define Controller_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* Controller_COMMON_INCLUDES_ */

#include "Controller_types.h"
#include "rt_defines.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

/* Block states (default storage) for system '<Root>' */
typedef struct {
  uint8_T Output_DSTATE;               /* '<S2>/Output' */
} DW_Controller_T;

/* Real-time Model Data Structure */
struct tag_RTM_Controller_T {
  const char_T * volatile errorStatus;
  DW_Controller_T *dwork;
};

/* Model entry point functions */
extern void Controller_initialize(RT_MODEL_Controller_T *const Controller_M,
  uint8_T *Controller_Y_Out1);
extern void Controller_step(RT_MODEL_Controller_T *const Controller_M, uint8_T
  *Controller_Y_Out1);
extern void Controller_terminate(RT_MODEL_Controller_T *const Controller_M);

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<S2>/Data Type Propagation' : Unused code path elimination
 * Block '<S3>/FixPt Data Type Duplicate' : Unused code path elimination
 * Block '<S4>/FixPt Data Type Duplicate1' : Unused code path elimination
 */

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Note that this particular code originates from a subsystem build,
 * and has its own system numbers different from the parent model.
 * Refer to the system hierarchy for this subsystem below, and use the
 * MATLAB hilite_system command to trace the generated code back
 * to the parent model.  For example,
 *
 * hilite_system('Second/Controller  ')    - opens subsystem Second/Controller
 * hilite_system('Second/Controller  /Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'Second'
 * '<S1>'   : 'Second/Controller  '
 * '<S2>'   : 'Second/Controller  /Counter Limited'
 * '<S3>'   : 'Second/Controller  /Counter Limited/Increment Real World'
 * '<S4>'   : 'Second/Controller  /Counter Limited/Wrap To Zero'
 */
#endif                                 /* RTW_HEADER_Controller_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
