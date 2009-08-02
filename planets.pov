#include "colors.inc"
#include "stones.inc"
#include "metals.inc"
background { color Cyan }
camera {
  location <0, 1, -6>
  look_at  <0, 0,  0>
}
light_source { <-10, 10, -20> color White}

cylinder {
  <0,0,0> <10,0,0> .05
  pigment { color Red }
}
cylinder {
  <0,0,0> <0,10,0> .05
  pigment { color Green }
}

sphere {
  <0, 0, 0>, 1
  texture {
    T_Brass_3A
    finish { phong 1 }
    normal { bumps 0.05 scale 0.05 }  
  }
}

#declare hand_main = box {
  // near lower left, far upper right 
  <0,-.10,-.1>, <3,.10,0>
  texture {
    T_Brass_3A
    finish { phong 1 }
    normal { bumps 0.05 scale 0.05 }  
  }
}

#declare cutout_x = 3.4;
#declare cutout_y = -.46;
#declare cutout_r = .7;
#declare hand_cutout = cylinder {
  <cutout_x,cutout_y,.2>, <cutout_x,cutout_y,-.2> cutout_r
  pigment { color Yellow }
}

#declare hand = difference {
  object { hand_main }
  object { hand_cutout }
}


object {
  hand
  rotate <0,0,45>
  translate <0,0,-.1>
}

object {
  hand
  rotate <0,0,30>
}
