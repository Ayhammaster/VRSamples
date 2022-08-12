#default{ finish{ ambient 0.3 diffuse 0.6 }} 
#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "shapes2.inc"   
#include "metals.inc"
#macro  objrad (  obj_w,obj_h, obj_t , obj_color ) //--constracur radio with 4 value
#local ww = obj_w; 
#local hh = obj_h; 
#local tt = obj_t;
#local rc = obj_color;
union{    
box {<0, 0, 0>, < ww, hh, tt>  //large box 
 texture { pigment{ rc}  } 
          scale <1,1,1>
}
box { <0, 0, -0.0003>, < 0.5*ww , hh -0.1, tt-0.1> 
texture { pigment{ Black} } // sound area 
 scale <1,1,1>  
}  
box { <0.5*ww + 0.1, 0, -0.0003>, < ww - 0.1, hh -0.1, tt-0.1> 
texture { pigment{ White} } // channel area
 scale <1,1,1>  
}     
cylinder {< 0.25*ww,hh/2 , -0.05>, <0.25*ww, hh/2, 0>, 0.4 // sound source
        texture { pigment{ rc*0.4}}    
}  

cylinder {< ww+ 0.1,hh/2 , tt/2>, <ww, hh/2, tt/2>, 0.2 // sound control
        texture { pigment{ Black}}    
}  

cylinder { < 0.75*ww,  0.2 , -0.0003>, <0.75*ww, hh-0.2 , -0.0003>, 0.05  //channel control
   texture { pigment{ rc}}    
} 
cylinder { < ww-0.05,  hh ,0.5*tt>, <ww -0.05, hh*2 , 0.5*tt>, 0.025  //right collector
   texture { pigment{ Black}}    
}  
cylinder { < 0.05,  hh ,0.5*tt>, <0.05, hh*2 , 0.5*tt>, 0.025  //left collecter
   texture { pigment{ Black}}    
} 
     
}
#end