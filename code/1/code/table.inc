// author: Friedrich A. Lohmueller, Dec-2005 / May-2014


#ifndef( Chair_s10_Inc_Temp)
#declare Chair_s10_Inc_Temp = version;
#version 3.6;

#ifndef(  Shapes_Inc_Temp)
#include "shapes.inc"                                             
#end

//--------------------------------------------------------------------
#macro table ( Seat__Height, 
                   Chair__Half_Width, 
                   Chair__Feet_Radius, 
                 ) //-------------------------------------------------

#local CR = Chair__Feet_Radius; 
#local CW = Chair__Half_Width - CR; 
#local SH =  Seat__Height - CR; 

#local SW = Chair__Half_Width ; 
#local ST = 2*CR ; 

union{ // total union
union{
// seat
box { <-CW, 0.00, -CW>,< CW, 0, CW>  translate<0,SH,0> }  
// feet
cylinder { <0,0,0>,<0,SH,0>, CR translate< CW,0,-CW> } 
cylinder { <0,0,0>,<0,SH,0>, CR translate<-CW,0,-CW> }
cylinder { <0,0,0>,<0,SH,0>, CR translate< CW,0, CW> }
cylinder { <0,0,0>,<0,SH,0>, CR translate<-CW,0, CW> }
// frontside horizontal seat level
cylinder { <-CW,0,  0>,< CW,0, 0>, CR  translate<0,SH, CW> }
cylinder { <-CW,0,  0>,< CW,0, 0>, CR  translate<0,SH,-CW> }
cylinder { <  0,0,-CW>,<  0,0,CW>, CR  translate< CW,SH,0> }
cylinder { <  0,0,-CW>,<  0,0,CW>, CR  translate<-CW,SH,0> }
// frontside horizontal seat level
sphere{ < CW,SH,-CW>, CR  } 
sphere{ <-CW,SH,-CW>, CR  } 
// backside horizontal seat level
sphere{ < CW,SH, CW>, CR } 
sphere{ <-CW,SH, CW>, CR } 

}// end of union

// seat
object { // Round_Box(A, B, WireRadius, UseMerge)
         Round_Box(<-SW,0,-SW>,<SW,2*CR,CW>, CR , 0)  
         scale<1,1,1>  rotate<0, 0,0> translate<0,SH,0>
       } // ---------------------------------------------------------




}// end of total union
#end  
#end