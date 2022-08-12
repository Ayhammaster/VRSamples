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



//-----------------------------------------Cameras-------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 0      // near chair
                            location  <0.0 , 1.0 ,10.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_1 = camera { orthographic 
                            /*ultra_wide_angle*/ angle 50   // zoom with tringle
                            location  <10.0 , 10.0 ,-10.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 0.5 , 0.0>} 

#declare Camera_2 = camera {/*ultra_wide_angle*/ angle  0    // top center 
                            location  <0.0 , 50 ,0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}                     
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 0    // in left side above
                            location  <10 ,10  ,-40>
                            right     x*image_width/image_height
                            look_at   <0.0 , 0.0 , 0.0>}                                                                 
                                                           
camera{Camera_3}
//------------------------------------------------------------------------


light_source{ <20.0 , 20.0 ,-20.0>color White*1} // right light
light_source{ <-20.0 , 20.0 ,-20.0>color White*1 shadowless} // leftlamb

background { White}


#include "radio.inc"
//-------------------------------------Radio CSG-------------------------------------
object{ radio (      0,
                   0,
                   0,// Radio 1,
                  ) //---------------------------- 
                  translate <0 ,-1 , 0>
             
      }      
      
 object{ radio (      0,
                   0,
                   0,// Radio 2,
                  ) //---------------------------- 
              
                 translate <1 ,-1 , 0>   rotate y*180
      }   
           
 object{ radio (      0,
                   0,
                   0,// Radio 3,
                  ) //---------------------------- 
              
                 translate <15 ,4.4 , -11>   
      } 
       object{ radio (      0,
                   0,
                   0,// Radio 4,
                  ) //---------------------------- 
              
                 translate <-15 ,4.4 , 0>   
      }   
           
          
 #declare Chair_Texture = 
       texture{ pigment{ color rgb< 0.75, 0.5, 0.30>*0.5 }  
                finish { ambient 0.1 diffuse 0.9 phong 1 } 
              } // end of texture  
//----------------------------------------------------------------------------
#include "chairs.inc"
object{ Chairs ( 4, // Chair_Height, 
               2, // Seat_Height, 
                    1,// Chair_Half_Width 
                    0.2,// Chair_Feet_Radius,
                  ) //------------------------------------------
        texture {Chair_Texture}
        scale <1,1,1>*2 rotate<0,0,0> translate< -10,0.00,14.00>} 

object{ Chairs ( 4, // Chair_Height, 
                    2, // Seat_Height, 
                    1,// Chair_Half_Width 
                    0.2,// Chair_Feet_Radius,
                  ) //------------------------------------------
        texture {Chair_Texture}
        scale <1,1,1>*2 rotate<0,0,0> translate< -5,0.00,14.00>}
        
object{ Chairs ( 4, // Chair_Height, 
                    2, // Seat_Height, 
                    1,// Chair_Half_Width 
                    0.2,// Chair_Feet_Radius,
                  ) //------------------------------------------
        texture {Chair_Texture}
        scale <1,1,1>*2 rotate<0,0,0> translate< 0,0.00,14.00>}        
#include "table.inc"
 #include "table.inc"
object{ table ( 2 , // Seat_Height, 
                    2,// Chair_Half_Width 
                    0.2,// Chair_Feet_Radius,
                  ) //------------------------------------------
        texture {Chair_Texture}
        scale <1,1,1>*2 rotate<0,0,0> translate< 15.00,0.00,-10.00>} 
object{ table ( 2 , // Seat_Height, 
                    2,// Chair_Half_Width 
                    0.2,// Chair_Feet_Radius,
                  ) //------------------------------------------
        texture {Chair_Texture}
        scale <1,1,1>*2 rotate<0,0,0> translate< -15.00,0.00,0.00>}        
#declare Brick =
texture {
pigment { Gray75 }
finish {
ambient 0.0
diffuse 0.8
}
scale 6
}

plane { x, -25 texture { pigment { P_WoodGrain19A }  rotate y*90 }} // left wall
plane { x, 20 texture { pigment { P_WoodGrain19A } rotate y*90}} // right wall
plane { z, 28      pigment { image_map {  jpeg "rocktor.JPG" map_type 1}}}// back wall
plane { y, 0     texture { pigment { P_WoodGrain10B color_map { M_Wood2A }}}
 translate -y*1 } // floor      
 