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


#macro radio (  
                   radio_point_x,
                   radio_point_y,
                   radio_point_z,

                 ) //--

#local w = 2; 
#local h = 1; 
#local l = 1;
#local rx = radio_point_x; 
#local ry = radio_point_y; 
#local rz = radio_point_z; 
#local fs =  h/10; 
#local radiop = <rx,ry,rz>;  //first cornar of radio 
#local radioep = <rx + w ,ry + h,rz + l>;  //first cornar of radio 
#local  radioc = rgb<0.8, 0.65, 0.05> ;  // radio color   // radio color 
#local fs = h/10 ;
#local   fontp1p  = <rx +fs ,ry +fs ,rz -fs>;
#local   fonte1p  = < w - 5 *fs ,h - fs , l - fs >;    
#local   fontp1p2  = <w - 5 * fs ,ry +fs ,rz -fs>;
#local   fonte1p2  = < w - 0.5 *fs ,h - fs , l - 5*fs >;  
#local   frontcolor =  rgb<1.00, 1.00, 0.00> ;
#local   channelswitch  = < 2*w - 5 * fs ,h  ,-3*fs>;
#local   channelswitch2  = < 2*w - 5 * fs ,h ,l>;
#local swithr =  h/3; 
#local   smalvolumes  = < 2*w - 3 * fs ,4 *fs  ,-4*fs>;
#local   smalvolumee  = < 2*w - 3 * fs ,4 *fs  ,l>;
#local vol = h/5; 
#local   smamtuners  = < 2*w - 6 * fs   ,4 *fs ,-4*fs>;
#local   smalltunere  = < 2*w - 6 * fs ,4 *fs ,l>;

 union{
// radio
box { radiop ,radioep   

      texture { pigment{ color radioc * 0.6}  
                finish { phong 1 reflection 0.00}
              } // end of texture
          scale <1,1,1>*2 rotate radiop translate radiop 

}
        
 box { fontp1p,fonte1p                                          
      texture { pigment{ color rgb<1.00, 1.00, 1.00>*0.6}  
                finish { phong 1 reflection 0.00}
              } // end of texture
      scale <1,1,1>*2 rotate radiop translate radiop 

 }
box { fontp1p2,fonte1p2   
      texture { pigment{ color rgb<1.00, 1.00, 1.00>*0.8}  
                finish { phong 1 reflection 0.00}
              } // end of texture  
                    scale <1,1,1>*2 rotate radiop translate radiop 

}
 cylinder { channelswitch ,channelswitch2, swithr }      
cylinder { smalvolumes, smalvolumee, vol } 
   
cylinder { smamtuners, smalltunere, vol }    
     
}
#end