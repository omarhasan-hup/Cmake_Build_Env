# This si the CMakeLits for the SWC_One
message("Beging of the SWC_One CMakeLists")
add_library(Model


     Model_gen_data/Controller_private.h
     Model_gen_data/Controller_types.h
     Model_gen_data/rt_defines.h
     Model_gen_data/rtwtypes.h
     Model_gen_data/Controller.c
     Model_gen_data/Controller.h
)



message("Ending of the SWC_One CMakeLists")
