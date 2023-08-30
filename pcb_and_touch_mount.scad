
$fs = .1;
$fa = 2;

module original () 
{
  *color ("red") import ("files/5015upgrade-V3.1.stl", convexity = 10);
  color ("blue") import ("5015upgrade-V3.1_fixed.stl", convexity = 10);
}


module roundedcube (size, r)
{
  x = size[0];
  y = size[1];
  z = size[2];
  xr = x-r;
  yr = y-r;
  zr = z-r;

  hull () {
    translate ([ r, r, 0]) cylinder (r=r, h=z);
    translate ([xr, r, 0]) cylinder (r=r, h=z);
    translate ([ r,yr, 0]) cylinder (r=r, h=z);
    translate ([xr,yr, 0]) cylinder (r=r, h=z);
  }
}


module my_mount ()
{
  translate ([-23.45,34.25,0]) rotate ([90,0,0]) {
    difference () {
      union () {
	roundedcube ([54,51,2.6], 2.5);
	translate ([-3.5,20,0])roundedcube ([10,31,2.6], 5);
      }
      translate ([11.8,43,-.5]) roundedcube ([30,6,2], 1);
      translate ([46,9.5,-.5]) roundedcube ([5,8,2], 1);
      translate ([13.8,8.5,-1]) roundedcube ([30,30,5], 1);
      translate ([31.3,3.65,-1]) cylinder (d=4.7,h=5);
      translate ([17.34,5.59,-1]) cylinder (d=3.6,h=5);

      translate ([51.3,47.2,-1]) cylinder (d=2.6,h=5); 
      translate ([3,47.2,-1]) cylinder (d=2.6,h=5); 
    }
  }

  translate ([30.5,21,12+31.3])rotate ([0,90,0]) difference () {
    roundedcube ([12,13,2.5], 2);
    translate ([12-35+31.3,4,-1]) cylinder (d=3.5,h=5); // XXX check pos. 
    translate ([5,-4,-.5])  rotate (-45) roundedcube ([12,13,3.5], 2);

  }

  translate ([-27,-6,47])rotate ([0,90,0]) difference () {
    roundedcube ([46,40,1.5], 2);
    translate ([18.5,21,-1]) cylinder (d=28,h=5); // XXX check pos. 
    translate ([30,34,-1]) roundedcube ([20,10,3.5], 5);
  }

  // XXX Deze moet dikker! 
  translate ([-13.65,-25,45.5])rotate ([0,90,0]) difference () {
    roundedcube ([25,20,1.5], 2);
    translate ([12,10.3,-1]) cylinder (d=3,h=5);
  }

  difference () {
    translate ([-27,-6,45])  roundedcube ([15,40,1.5], .1);
    translate ([-20.5,30,45-1])  cylinder (d=7,h=3.5);
  }
  translate ([-27+13.5,-6,45-1])  roundedcube ([1.5,40,2.5], .1);
  translate ([-27,25,45-.4])  roundedcube ([15,1.5,1.5], .1);

  // XXX Deze mag dichter naar de achterkant. 
  translate ([-26.2,-4,20.5])rotate ([90,0,0]) roundedcube ([14,26,1.5], 2);


  translate ([-27.2,-34,20.5])rotate ([0,0,0])  difference () {
    union () {
      roundedcube ([15,30,2.5], 2.5);
      translate ([10,0,0]) roundedcube ([5,30,7],.1);
    }
    // XXX dit mag dichter naar achteren.
    translate ([5,13-yy,-1]) cylinder (d=3,h=5);
    translate ([5,13+yy,-1]) cylinder (d=3,h=5);
    
    // Mijn 3D-touch heeft dit niet echt nodig. 
    translate ([-2,13-4,-1]) roundedcube ([10,8,4.5],2);

   translate ([10,-1,2.5]) rotate ([0,-45,0]) roundedcube ([10,32,7],.1);     

  }

}


xx=21;
yy=8.5;
crt_y=-20;


my_mount ();
//original ();

//themotor ();

module themotor ()
{
  difference () {
    translate ([10,5,21]) intersection () {
      cube ([42,62,42],center=true);
      rotate ([90,0,0]) cylinder (d=54,h=50,center=true);
    }
    translate ([-5,-14.77,33.57])  rotate ([0,-90,0])cylinder (d=2.9, h=10);
  }
  
  translate ([-23,0,15]) color ("black") cube ([12,30,30]);
  
  translate ([-xx,crt_y,0]) cylinder (d=15,h=20.5);
  color ("red")  translate ([-xx,crt_y,19]) cube  ([10,25,3],center=true);
  translate ([-xx,crt_y+yy,20]) cylinder (d=3,h=6);
  translate ([-xx,crt_y-yy,20]) cylinder (d=3,h=6);
}
