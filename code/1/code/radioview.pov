 #default{ finish{ ambient 0.1 diffuse 0.9 }} 
//------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"



//------------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 15      // front view
                            location  <0.0 , 1.0 ,-40.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_1 = camera { orthographic 
                            /*ultra_wide_angle*/ angle 15   // diagonal view
                            location  <20.0 , 20.0 ,-20.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 0.5 , 0.0>} 

#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 15      // front view
                            location  <0.0 , 100 ,0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}                     

camera{Camera_2}
//------------------------------------------------------------------------


light_source{<-1000,2500,-2500> color White*0.9}  // sunlight
light_source{ <20.0 , 20.0 ,-20.0>color White*0.1 shadowless} // flash

background { White}

#declare Radio_Texture = 
      texture { pigment{ color radioc * 0.6}  
                finish { phong 1 reflection 0.00}
              }  // end of texture  
//----------------------------------------------------------------------------
#include "radio.inc"
//----------------------------------------------------------------------------
object{ radio ( 2, // Total_Chair_Height, 
                    1, // Seat_Height, 
                    1,// Chair_Half_Width 
                    0,
                   0,
                   0,// Chair_Feet_Radius,
                  ) //---------------------------- 
        scale <1,1,1> rotate<0,0,0> translate< 0.50,0.00,0.00>
      } 