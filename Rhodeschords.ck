Rhodey rhodes[4];//Four notes possible of the Rhodes
Gain master;//Master gain for four rhodes
0=> int counter;

SetUniversalParameters universal;//Accesses universal parameters

SwingCounter count;//accesses universal counter
count.tempo(universal.Tempo);//Sets tempo to universal

ChordProg progression;//Accesses universal progression
progression.chordbuild(universal.Tonic);//Sets key to universal

for (0 => int i; i<rhodes.cap(); i++)
        {
            rhodes[i] => master => dac; //Use array to chuck unit generator to DAC
            1.0/rhodes.cap() => rhodes[i].gain;//Setting volume so no Peaking Distortion
        }
        
0.075=>master.gain;        

fun void JazzComper (int swinger)//Swinger makes sure it swings, all other variables are global.
{
    if (((swinger==0)||(swinger==6))&&(Std.rand2(1,6)==1)) //If the beat is one of the swung beats
    // and the random number equals 1, then
    {
    Rhodesplayer();//A chord is played. Basically this just means there's a fair chance that a chord
                  //will be played on any giving swung beat, making for interesting rhythms.
    }
}

fun void TheChords (int WholeProg)
{
     if ((WholeProg==progression.Start)|| //These conditions specify when it should be...
     (WholeProg==progression.ChangeTwo) ||
     (WholeProg==progression.ChangeFive) ||
     (WholeProg==progression.ChangeSeven) ||
     (WholeProg==progression.ChangeTen))
     
     {
  Std.mtof(progression.ChordOne[0]+12)=>rhodes[0].freq;//Playing chord 1
  Std.mtof(progression.ChordOne[1]+12)=>rhodes[1].freq;
  Std.mtof(progression.ChordOne[2]+12)=>rhodes[2].freq;
     }

  if ((WholeProg==progression.ChangeOne)|| //These conditions specify when it should be...
     (WholeProg==progression.ChangeThree) ||
     (WholeProg==progression.ChangeSix) ||
     (WholeProg==progression.ChangeNine))
     
     {
  Std.mtof(progression.ChordTwo[0]+12)=>rhodes[0].freq;//Playing chord 2
  Std.mtof(progression.ChordTwo[1]+12)=>rhodes[1].freq;
  Std.mtof(progression.ChordTwo[2]+12)=>rhodes[2].freq;
     }
  
    if ((WholeProg==progression.ChangeFour))//These conditions specify when it should be...
     
     {
  Std.mtof(progression.ChordThree[0]+12)=>rhodes[0].freq;//Playing chord 3
  Std.mtof(progression.ChordThree[1]+12)=>rhodes[1].freq;
  Std.mtof(progression.ChordThree[2]+12)=>rhodes[2].freq;
     }
     
       if ((WholeProg==progression.ChangeEight))//These conditions specify when it should be...
     
     {
  Std.mtof(progression.ChordFour[0]+12)=>rhodes[0].freq;//Playing chord 4
  Std.mtof(progression.ChordFour[1]+12)=>rhodes[1].freq;
  Std.mtof(progression.ChordFour[2]+12)=>rhodes[2].freq;
     }
 }


fun void Rhodesplayer()
{
    Std.rand2f(0.3,0.7) => float chordvolume;//Determines volume of rhodes chords.
    
    chordvolume+0.1=>rhodes[0].noteOn;
    chordvolume=>rhodes[1].noteOn;
    chordvolume=>rhodes[2].noteOn;

}

while (true)
{
    JazzComper(counter%count.crotchet);
    TheChords(counter%1024);//Length of chord progression
    count.microbeat => now;//Time passing determined by universal counter
    counter++;
}