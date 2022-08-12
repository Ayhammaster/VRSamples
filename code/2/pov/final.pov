#default {finish {ambient 0.55 diffuse 0.25}}

#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "woods.inc"  
#include "stones.inc"  
#include "glass.inc"
#declare c1 = camera {location <0,4,-15>look_at 2*y} ///camera 1
#declare c2 = camera {location <0,28, 0>look_at  <-4,5,10>} ///camera 2
#declare c3 = camera {location <10,7,-20>look_at <0,0,0>}///camera 3
#declare c4 = camera {location <0,5 ,20>look_at <0,0,0>}///camera 4
light_source{ <10.0 , 10.0 ,-20.0>color White*0.6} //------- right light from door
light_source{ <-15.0 , 9.0 ,15.0>color White*7} ///     powr light
camera{c3}

//radio
#include "rad.inc"
//----------------------------------------------------------------------------
object{ rad ( 2,1, 1,) //-----------------------------Radio A above table
    translate <-2 ,3.2 , 5>          }   
 object{ rad ( 2,1, 1,) //----------------------------Radio B above table reverse 
 rotate y*180      translate <-4 ,3.2, 6>      
      }   
 object{ rad ( 2,1, 1, ) //---------------------------Radio C above blue cell
    translate <4 ,5 , 5.5>                       
      }  
 object{ rad ( 2,1, 1,) //----------------------------Radio D above Green cell
    translate <-14 ,5 , 5.5>            
        
      }  

#include "chr.inc"
object{ Chr ( 3,1.5, 1,0.1,) //----------------------chair
        texture {pigment{ color rgb< 0.75, 0.5, 0.30>*0.9}   }
        scale <1,1,1>*1.5 rotate<0,0,0> translate< -4,0.00,14.00>}         
   
#include "tbl.inc"

object{ tbl ( 3 , 4, 0.2,) //------------------------table
        texture {pigment{ color rgb< 0.75, 0.5, 0.30>*0.9} }
        scale <1,1,1> rotate<0,0,0> translate< -4.00,0.00,8.00>}    
  
  
blob {
  threshold 0.5
  cylinder { <0.0, 0.0,  0.0>,
             <0.0, 2.0,  0.0>,  1.0,   1.0 } // power lamp
  sphere   { <0.0, 2.5,  0.0>,  0.8,  -2.0 } // 
  sphere   { <0.0,-0.52, 0.0>,  0.8,  -2.0 } // 
  sphere   { <0.0, 2.0, -0.5>,  0.1,  -0.2 } // 
  cylinder { <0.0, 1.88,-0.52>,
             <0.0, 1.5, -0.52>, 0.05,  0.2 } // 
  sphere   { <0.0, 1.5, -0.55>, 0.07,  0.2 } //
  texture {
  
    pigment { color rgb <0.8,0.50,0.01> }
    finish{
      diffuse 0.6 specular 0.6 roughness 0.1
      subsurface { translucency <5,3,1>*0.5 }
    }
  }
  interior { ior 1.45 }
  rotate -y*45 
  translate< -15.00,0.00,15.00>   
  scale y*4
}  
    
    
 sphere { <-15, 9, 15>, 1.75     ///lamb is glass
 texture {
pigment { color Col_Glass_Clear }
finish { F_Glass6 }
}
    
   }  
  
object { Disk_Y translate < 5, 0, 6> scale y*5     texture { pigment {Blue} } }    ///blue disk-y
object { Disk_Y translate < -13, 0, 6> scale y*5 texture { pigment {Green} }}      /// green disk-y 
object { Disk_Y translate < 2, 0, 20> scale y*5     texture { pigment {Red} } }     ////Red disk-y
box {<0.0,2> <10,8,0.000001>     translate < -2,2, 23.999>   pigment { image_map {  jpeg "img.JPG" map_type 5}  }  }                           
box {<-30,0,-24>, <30,28,24> texture { pigment { P_WoodGrain1B color_map { M_Wood16B }}}           //// Room

hollow}
