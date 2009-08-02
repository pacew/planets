#include "colors.inc"
#include "stones.inc"
#include "metals.inc"
#include "woods.inc"
#include "golds.inc"

#declare plate = rgb <.66, .48, .15>;

background { color plate  }
camera {
  location <0, 0, -6>
  look_at  <0, 0,  0>
}
light_source { <-10, 10, -20> color White}

/*
cylinder {
  <0,0,0> <10,0,0> .05
  pigment { color Red }
}
cylinder {
  <0,0,0> <0,10,0> .05
  pigment { color Green }
}
*/

sphere {
  <0, 0, 0>, .7
  texture {
    T_Brass_3A
    finish { phong .1 }
    normal { bumps 0.05 scale 0.05 }  
  }
}

#declare hand_main = box {
  // near lower left, far upper right 
  <0,-.10,-.1>, <2.6,.10,0>
  texture {
    T_Brass_3A
    finish { phong 1 }
    normal { bumps 0.05 scale 0.05 }  
  }
}

#declare cutout_x = 3.05;
#declare cutout_y = -.47;
#declare cutout_r = .7;
#declare hand_cutout = cylinder {
  <cutout_x,cutout_y,.2>, <cutout_x,cutout_y,-.2> cutout_r
  texture {
    T_Brass_3A
    finish { phong 1 }
    normal { bumps 0.05 scale 0.05 }  
  }
}

#declare hand = difference {
  object { hand_main }
  object { hand_cutout }
}



cylinder {
   <0,0,-.5>, <0,0,-.2> 1.3
  texture {
    T_Brass_3A
    finish { phong 1 }
    normal { bumps 0.05 scale 0.05 }  
  }
}

#declare moon_light = difference {
  sphere {
    <0, 0, 0>, .15
    pigment { color White }
  }
  box {
    <-.2,-.2,-.2>, <.2,0,.2>
    pigment { color Yellow }
  }
}

#declare moon_dark = difference {
  sphere {
    <0, 0, 0>, .15
    pigment { color Black }
  }
  box {
    <-.2,0,-.2>, <.2,.2,.2>
    pigment { color Yellow }
  }
}

#declare moon = union {
  object { moon_light }
  object { moon_dark }
}

difference {
  box {
    <-10,-10,0> <10,10,-.1>
    texture {
      T_Brass_1A
      normal { bumps 0.05 scale 0.05 }  
    }
  }
  cylinder {
    <0,0,1> <0,0,-.6> 2.8
    texture {
      T_Brass_1A
      normal { bumps 0.05 scale 0.05 }  
    }
  }
}

cylinder {
  <0,0,0> <0,0,.5> 4
  texture {
    T_Gold_3B
    normal { bumps 0.02 scale 0.02 }  
  }
}




