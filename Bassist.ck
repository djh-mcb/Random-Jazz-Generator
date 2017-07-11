SinOsc bass => ADSR e => dac;//Sin osc run through envelope
SetUniversalParameters universal;//Accesses universal parameters
SwingCounter count;//Accesses universal counter
count.tempo(universal.Tempo);//Sets counter to universal tempo

ChordProg progression;//Accesses universal progression
progression.chordbuild(universal.Tonic);//Sets tonic to universal tonic


e.set (10::ms, 8::ms, .2, 300::ms);//Sets envelope

0=>int counter;

.2 => bass.gain;

fun void Bassist(int beat, int WholeProg)
{
 
  if (((WholeProg>=progression.Start && WholeProg<progression.ChangeOne)|| //These conditions specify when it should be...
     (WholeProg>=progression.ChangeTwo && WholeProg<progression.ChangeThree) ||
     (WholeProg>=progression.ChangeFive && WholeProg<progression.ChangeSix) ||
     (WholeProg>=progression.ChangeSeven && WholeProg<progression.ChangeEight) ||
     (WholeProg>=progression.ChangeTen)) && (beat == 0))
     
     {
  Std.mtof(progression.ChordOne[Std.rand2(0,2)])=>bass.freq;//...riffing on chord one
     }

  if (((WholeProg>=progression.ChangeOne && WholeProg<progression.ChangeTwo)|| //These conditions specify when it should be...
     (WholeProg>=progression.ChangeThree && WholeProg<progression.ChangeFour) ||
     (WholeProg>=progression.ChangeSix && WholeProg<progression.ChangeSeven) ||
     (WholeProg>=progression.ChangeNine && WholeProg<progression.ChangeTen)) && (beat == 0))
     
     {
  Std.mtof(progression.ChordTwo[Std.rand2(0,2)])=>bass.freq;//...riffing on chord two
     }
  
    if ((WholeProg>=progression.ChangeFour && WholeProg<progression.ChangeFive) && (beat == 0))//These conditions specify when it should be...
     
     {
  Std.mtof(progression.ChordThree[Std.rand2(0,3)])=>bass.freq;//...riffing on chord three
     }
     
       if ((WholeProg>=progression.ChangeEight && WholeProg<progression.ChangeNine)&& (beat == 0))//These conditions specify when it should be...
     
     {
  Std.mtof(progression.ChordFour[Std.rand2(0,2)])=>bass.freq;//riffing on chord four
     }
  
  if(beat == 0)//On every crotchet beat
  {
    // key on - start attack
    e.keyOn();
    // advance time by 50 ms
    50::ms => now;
    // key off - start release
    e.keyOff();
    // advance time by 50 ms
    50::ms => now;
  }
}

while(true)
    {
        spork ~ Bassist(counter%count.crotchet, counter%1024);//Sporking the play function allows the envelopes time parameters to operate without disrupting timeflow in the overall program.
        count.microbeat=>now;//Time passing is determined by universal counter class
        counter++;
    }
        