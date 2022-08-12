 #default{ finish{ ambient 0.1 diffuse 0.9 }} 
#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "shapes2.inc"   
#include "metals.inc"

#macro rad (  r_width,r_height, r_deep,) //--

#local w = r_width; 
#local h = r_height; 
#local l = r_deep;





 union{    
 
 
box {
  <0, 0, 0>, < w, h, l> 

      texture { pigment{ rgb<0.6,0.05,0.01>
}  
            
              } // end of texture
          scale <1,1,1>*1

}
box {
  <0.1, 0.1, -0.001>, < w - 0.1, h -0.1, l-0.1> 
    texture { pigment{ Gray75}  
            
              } // end of texture
          scale <1,1,1>

  
}    


box {
  <0.11, 0.1, -0.01>, < w/1.5 , h-0.1 , l/2> 
    texture { 
pigment { rgb<0.20, 0.000200, 0.00100>
}

            
              } // end of texture
          scale <1,1,1>

  
}  


box {
  <w -0.5, h-0.2, -0.01>, < w-0.15, h-0.3, 0.1> 

      texture { pigment{ rgb<0.6,0.05,0.01>
}  
            
              } // end of texture
          scale <1,1,1>*1

}


 cylinder {
    < w/1.2,  h/2-0.1 , -0.05>, <w/1.2, h/2 -0.1, 1>, 0.2 // center of one end, center of other end, radius
     // remove end caps
        texture { pigment{ rgb<0.6,0.05,0.01>
}
}    
}     

cylinder {
    < w-0.1,  h ,l/2>, <w -0.1, h + 1.5 , l/2>, 0.03 // center of one end, center of other end, radius
     // remove encaps
        texture { pigment{ Black
}
}    
}  

     
}
#end