SwingCounter count;//Accesses universal counter
SetUniversalParameters universal;//Set universal parameters
count.tempo(universal.Tempo);//Sets tempo to universal tempo

SndBuf hats => Gain master => dac;//Master prevents peaking
SndBuf snare => master => JCRev r => dac;//Reverb on snare
SndBuf kick => master => dac;

0.075 => r.mix;//Small amount of snare rev
0.2=>master.gain;
0.2=>float mastergain;


"sounds/hh_01.wav"=>hats.read;
hats.samples()=>hats.pos;


"sounds/snare_01.wav"=>snare.read;
snare.samples()=>snare.pos;

"sounds/kick_03.wav"=>kick.read;
kick.samples()=>kick.pos;

fun void JazzDrummer (int beat, int swinger)//Beat keeps time, swinger means the drums only play on the 'swung' beats.
{  
   
   if((beat==0)||(beat==8)||(beat==13))//These three events create the constant hi hat pattern.
   {
       if(beat==13)//On the last beat of each pattern
       {Std.rand2f(0.05,0.1)=>hats.gain;}//The volume is less, giving accentuation to the pattern
       else//On every other beat
       {Std.rand2f(0.1,0.2)=>hats.gain;}//The volume is higher than the weak beat.
       0=>hats.pos;
   }
   if ((swinger==0)||(swinger==6))//On any 'swung beat'
   {
   if (Std.rand2(0,10)==0)//1 in ten times
   {
       Std.rand2f(0.1,0.3)=>snare.gain;//The snare will play at a random volume.
       0=>snare.pos;
   }
   }
    if ((swinger==0)||(swinger==6))//On any 'swung beat'
   {
   if (Std.rand2(0,20)==0)//1 in 20 times
   {
       Std.rand2f(0.02,0.1)=>kick.gain;//The kick will play at a random volume.
       0=>kick.pos;
   }
   }
}

0 => int counter;

while(true)
{
    JazzDrummer(counter%count.minim, counter%count.crotchet); //Hat pattern is measured in minim, everything else crotchet
    count.microbeat=>now; //Time passing determined by universal counter
    counter++;
}