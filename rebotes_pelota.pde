import android.content.Context;               
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

Pelota bola;
float acx;
float acy;

// variables acelerómetro
SensorManager sensorManager;      
SensorListener sensorListener;   
Sensor accelerometer;             
float[] accelData; 

void setup(){
  orientation(PORTRAIT);
  size(320,480);
  smooth();
  noStroke();
  fill(255,0,0);
  bola = new Pelota(width/2,height/2,15);
}

void draw(){
  background(0,255,0);
  bola.mover(-accelData[0],accelData[1]);
  bola.dibujar();
}

void onResume()
{
  super.onResume();
  sensorManager = (SensorManager)getSystemService(Context.SENSOR_SERVICE);
  sensorListener = new SensorListener();
  accelerometer = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  sensorManager.registerListener(sensorListener, accelerometer, SensorManager.SENSOR_DELAY_GAME); 
};
 
void onPause()
{
  sensorManager.unregisterListener(sensorListener);
  super.onPause();
};
 
 
class SensorListener implements SensorEventListener
{
  void onSensorChanged(SensorEvent event)
  {
    if (event.sensor.getType() == Sensor.TYPE_ACCELEROMETER)
    {
      accelData = event.values;
    }
  }
  void onAccuracyChanged(Sensor sensor, int accuracy)
  {
       //todo
  }
}
