#default {finish {ambient 0.55 diffuse 0.25}}
global_settings {
assumed_gamma 1
}

//--------include files------------------------
#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "woods.inc"  
#include "stones.inc"  
#include "glass.inc" 
#include "objrad.inc"
#include "tbles.inc" 
#include "golds.inc"
#include "skies.inc"
//----------camera--------------------------------------
#declare cam1 = camera {location <-14.5,1,-11.5>look_at <13,5,11>} /// in coronr floor
#declare cam2 = camera {location <-3,13, -3>look_at <13,5,11>}  ///in the roof
#declare cam3 = camera {location <14,5,-10>look_at <1,5,12>   right x*image_width/image_height}/// near window     
#declare cam4 = camera {location <14 ,5,-11.5>look_at <-5,5,11>}/// in the door
#declare cam5 = camera {location <-14,1 ,10>look_at <15,5,0>}// close radios
camera{cam5}
//---------------light sources------------------------------
light_source{ <1.0 , 3.0 ,-5.0>color White*1} //---electricity
light_source{ <-15.0 , 9.0 ,15.0>color White*0.1} ///     powr light
light_source{ <14 ,7 ,0>color White*3  } /////////// sun shine


//----------------Room ---------------------------------
box {<-15,0,-12>, <15,14,12> 
texture {
T_Stone41
 }
   hollow}    ////Room 6 =30 4.8= 14     we muliplay from viwes

//----------------floor--------------------------------------
 plane { y, 0 texture { pigment { P_WoodGrain1B   
 }
 } translate y*0.00000001 }
 
//---------------Window--------------------------------
box {<14.8,5,-1.5>, <16,8,1.5>  
 pigment { rgbt<1, 1, 1, 0.8> }
finish {
ambient 0.0
diffuse 0.0
phong 1.0
phong_size 200
refraction 1
ior 1.05
}

 hollow on} 

//------------------------stand-------------------------  

box { <6,8,10> ,<12,8.5,12>            texture { pigment { P_WoodGrain19A color_map { M_Wood15A }}} hollow  }  
box { <0,4,10> ,<8,4.5,12>            texture { pigment { P_WoodGrain19A color_map { M_Wood15A }}} hollow  }
//-------------------large sheep under window ---------------------------
lathe {
cubic_spline
12,
<0.000000, 0.000000>,
<0.000000, 0.000000>,
<0.460606, 0.036364>,
<0.515152, 0.303030>,
<0.157576, 0.660606>,
<0.248485, 1.000000>,
<0.230303, 1.000000>,
<0.139394, 0.660606>,
<0.496970, 0.296970>,
<0.448485, 0.054545>,
<0.000000, 0.018182>,
<0.000000, 0.018182>

scale <1.5, 1.5, 1.5>*2 translate <10, 0., 0>  texture {T_Stone12}

}


//------------------big picture  in the wall ----------
box {<0.0,2> <10,8,0.000001>     translate < -12,2, 11.99999>   pigment { image_map {  jpeg "ger.JPG" map_type 5}  }  }                           
 
//-------------------------object of radios---------------------------------------------------
object{ objrad  ( 2,1, 1,Grey*0.5)  translate <-3 ,2.2 , 10> } //--------first radio on  table
object{ objrad  ( 2,1, 1,Green )  translate <10,8.5 ,10> } //--------second radio on high stand  
object{ objrad  ( 2,1, 1, Blue )  rotate <0,180,0> translate <8.5,8.5 ,11> } //--------second radio on high stand  
object{ objrad  ( 2,1, 1, Yellow*0.1 )  scale <1,1,1>*2 translate <10 ,0 , 10> } //--------large radio radio on floor 
object{ objrad  ( 2,1, 1,Red )  translate <5,4.5 ,10> } //--------radio on low stand  
object{ objrad  ( 2,1, 1, Orange )  rotate y*-45  translate <-4,1 ,0>  }  //--------------radio on center table
#declare TeaCup =
union {
   difference {
      cylinder {<0,1.2,0>, <0,6,0>, 4.2}
      cylinder {<0,1,0>, <0,6.2,0>, 3.8}
   }

   difference {
      cylinder {<0,0.2,0>, <0,2.5,0>, 4}
      torus {2.8, 1 translate y*2.5}
      torus {4, 1 translate y*0}
      cylinder {<0,1.5,0>, <0,2.6,0>, 2.8}
   }

   difference {
      #declare LiquidLevel = 5;
      cylinder {<0,1.4,0>, <0,LiquidLevel,0>, 4}
      torus {3.6, 0.2 translate y*LiquidLevel}
      cylinder {<0,LiquidLevel-0.2,0>,<0,LiquidLevel+0.3,0>,3.6}
      pigment {Orange*0.8 filter 0.6}
      finish {phong 0.7 reflection 0.15}
      normal {bumps 0.05 scale 1}
   }

   torus {4.0, 0.2 translate y*6.0}
   torus {4.0, 0.2 translate y*1.2}
   torus {2.8, 0.2 translate y*0.2}

   union {
      difference {
         cylinder {<0.2,0,0>,<-0.2,0,0>,0.5}
         torus {0.5, 0.2 rotate z*90 translate x*0.2}
         translate y*1.25
      }
      difference {
         cylinder {<0.2,0,0>,<-0.2,0,0>,0.5}
         torus {0.5, 0.2 rotate z*90 translate x*0.2}
         translate y*-1.25
      }
      torus {1.25, 0.3 rotate x*90 clipped_by {plane {x,0 inverse}} translate x*0.8}
      cylinder {<0,-1.25,0>,<0.8,-1.25,0>,0.3}
      cylinder {<0,1.25,0>,<0.8,1.25,0>,0.3}
      scale <1,1,1.5> translate <4.2,4,0> rotate y*-90
   }

   pigment {White}
   normal {bumps 0.05 scale 3}
   finish {phong 0.8 reflection 0.1}
}

object {TeaCup rotate y*50  scale 0.1  translate <3.5,4.5,11>}   //------------------tea cup on low stand  
object {TeaCup rotate y*50  scale 0.1  translate <2.5,4.5,11>}   ///----------------tea cup on low stand
object {TeaCup rotate y*50  scale 0.1  translate <0,1,0>}        ///----------------tea cup on center table
object {TeaCup rotate y*50  scale 0.1  translate <0,1,-2>}       ///----------------tea cup on center table
      
   

//----------------------------------tables--------------------------
object{ tbles ( 2 , 1, 0.2,) //------------------------table   near war
        texture {pigment{ color rgb< 0.75, 0.5, 0.30>*0.9} }
        scale <1,1,1> translate< -2,0,11>        texture { pigment { P_WoodGrain2B color_map { M_Wood8A }}}
         }   
         
object{ tbles ( 1 , 4, 0.1,) //------------------------table  on center
        texture {pigment{ color rgb< 0.75, 0.5, 0.30>*0.9} }
        scale <1,1,1> translate< -2,0,0>        texture { pigment { P_WoodGrain2B color_map { M_Wood8A }}}
         }    
            
  
