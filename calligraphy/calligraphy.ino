
//Left servo
#define L_SERVO_ADJUST 10 //degrees from 90
#define L_SERVO_PIN 5
#define L_SERVO_BACKLASH 0//degrees

//Right servo
#define R_SERVO_ADJUST 15//degrees from 90
#define R_SERVO_PIN 3
#define R_SERVO_BACKLASH 0//degrees

//Arms characteristic

#define ARM_LENGTH 60 //mm
#define MAX_ANGLE 70 //degrees from centre, either way (= origin)
#define ORIGIN_Y 70//distance of pen origin from servo origin, in mm

#define DEG_CIRCLE 360
#define DEG_TO_RAD (M_PI / (DEG_CIRCLE / 2))
#define RAD_TO_DEG ((DEG_CIRCLE / 2) / M_PI)

//#define FUDGE 0.85
#define FUDGE 0.8

#include <Servo.h> 
Servo leftServo; 
Servo rightServo;  

int currentX = 0;
int currentY = 0;



void setup() {
  leftServo.attach(L_SERVO_PIN);
  rightServo.attach(R_SERVO_PIN);
  
  //moveTo(currentX,currentY);
  //delay(1000);
    //     X  Y
/*  moveTo(0,0);
  delay(1000);
  moveTo(30,30);
  delay(1000);
  moveTo(0,0);
  delay(1000);
  moveTo(40,10);
    delay(1000);
  moveTo(-40,10);

*/


 
 /*
 for(int i=-20;i<20;i++){
   moveTo(i,0);
   delay(50);
 } 
  for(int i=0;i<40;i++){
   moveTo(20,i);
   delay(50);
 } 
  for(int i=20;i>-20;i--){
   moveTo(i,40);
   delay(50);
 } 
 
   for(int i=40;i>0;i--){
   moveTo(-20,i);
   delay(50);
 } 
 
 
 
  delay(1000);
  for(double i=0;i<40;i+=0.01){
   moveTo(-20,i);
   
 }  
 delay(1000);
 for(double i=-20;i<20;i+=0.01){
   moveTo(i,40);

 } 
  delay(1000);
   for(int i=40;i>0;i--){
   moveTo(20,i);
   delay(50);
 } 
  delay(1000);
  for(int i=20;i>-20;i--){
   moveTo(i,00);
   delay(50);
 } 
 
 
  for(int i=40;i>0;i--){
   moveTo(-20,i);
  
  }
   delay(1000);
   
     for(int i=0;i<40;i++){
   moveTo(-20,i);
  
  }
   delay(1000);

  
  moveTo(0,0);
  delay(500);
  
  
  drawLine(0,40);
  //delay(500);
  drawLine(40,40);
  //delay(500);
  drawLine(40,0);
  //delay(500);
  drawLine(0,0);
  
  //moveTo(0,45);
  //delay(500);
  
  moveLeft(-45);
  moveRight(45);
  delay(1000);
    moveLeft(0);
  moveRight(0);
  delay(1000);
    moveLeft(-45);
  moveRight(45);
  delay(1000);
    moveLeft(0);
  moveRight(0);
  delay(1000);
     moveLeft(-45);
  moveRight(45);
  delay(1000);
  
 

//S
moveTo(-30, 50);
delay(500);
drawLine(-60,40);
drawLine(-30, 30);
drawLine(-60, 20);


//H
moveTo(-10,50);
drawLine(-10,20);
drawLine(-10,35);
drawLine(10,35);
drawLine(10,50);
drawLine(10,20);
*/


  square();
   square();
    square();
}


void square(){
  //  moveTo(-20,50);
  
  //delay(500);

  drawLine(25,50);
  drawLine(25,0);
    drawLine(-25,0);
    drawLine(-25,50);
}


void loop() {
  //moveLeft(-MAX_ANGLE);
  //moveRight(MAX_ANGLE); 
 


  
  
}

void drawLine(double x, double y)
{

  
  double deltaX = double(x - currentX);
  double deltaY = double(y - currentY);
  


  double distance = sqrt((deltaX*deltaX) + (deltaY*deltaY));
  
  for(double i=0; i<distance; i++) {
    moveTo(double(currentX) + ((deltaX * i) / distance), double(currentY) + ((deltaY * i) / distance));
    delay(10);
  }
  
  currentX = x;
  currentY = y;
  delay(100);
}

void moveTo(double x, double y) {
  x *=  FUDGE;
    y *=  FUDGE;
  double h = double(y) + double(ORIGIN_Y); //height of point from servo origin
  double d = sqrt((h*h) + (x*x)); //length of diagonal from servo origin to point

 // double e = (atan((d/2)/ARM_LENGTH)) * RAD_TO_DEG * 2; //angle inside elbow
  
  double D1 = atan(x/h) * RAD_TO_DEG;
  double D2 = acos((d/2) / ARM_LENGTH) * RAD_TO_DEG;
  
  moveLeft(double(D2-D1) * -1);
  moveRight(double(D2+D1));
  
}

//for these two, position is in degrees relative to vertical
void moveLeft(double position) {
  position *= FUDGE;
  static double lastPosition;

  int backlashAdjust = 0;
  
  if(position < lastPosition)
  {
     backlashAdjust = L_SERVO_BACKLASH * -1;
  }
 

  
  leftServo.write(90 +position + backlashAdjust - L_SERVO_ADJUST);
  lastPosition = position;
  
}

void moveRight(double position) {
  static double lastPosition;
  position *= FUDGE;
//  static bool lastMoveWasOutwards = false;
  
  int backlashAdjust = 0;
  
  if (position > lastPosition)
  {
    backlashAdjust = R_SERVO_BACKLASH;
  }

  rightServo.write(90 +position + backlashAdjust - R_SERVO_ADJUST);
  lastPosition = position;

}

