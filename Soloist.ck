ModalBar soloist => JCRev r=> dac;//Vibraphone-ish soloist, with reverb
SetUniversalParameters universal;//Accesses Universal parameters class
SwingCounter count;//Accesses counter class
ChordProg progression;//Accesses chord progression class
count.tempo(universal.Tempo);//Sets tempo to universal tempo

.075=> r.mix;//Small amount of reverb

0.7=>soloist.gain;

universal.Tonic => int tonic;//Sets tonic to universal tonic
8 => int nownote;//Solo starts on tonic
int lastnote;

0=> int counter;//Counts!


fun void JazzImproviser (int swinger, int Leaper)//Swinger makes sure it swings!
// Leaper determines how likely it is the soloist will leap. All other variables are global.
{   
   
    [tonic-12, tonic-10, tonic-9, tonic-7, tonic-5, tonic-4, tonic-2, 
     tonic, tonic+2, tonic+3, tonic+5, tonic+7, tonic+8, tonic+10, tonic+12] @=>int scale[];//Possible notes the soloist will play, as related to the tonic.
    
    if ((swinger==0)||(swinger==5))//On swung beats
    {   
         if(Std.rand2(0,6)>2)//There is a probability that
         {
         if(Leaper>0)//If 'Leaper' is anything but zero
         {
         [-1,1] @=> int changer[];
         lastnote+(changer[Std.rand2(0,1)]%14)=>nownote;//The soloist will play either the same note as last time or one note either side.
         if (nownote<0)//If nownote goes outside the array bounds
         { Std.rand2(0,4)=>nownote;}//Put it back in.
         if (nownote>14)//Same here.
         { Std.rand2(10,14)=>nownote;}
         Std.mtof(scale[nownote]+24) => soloist.freq;//The soloist plays nownote.
         SoloistPlayer(swinger);//Calls 'soloist player' to determine how the note is played.
         nownote => lastnote;//The note just played is 'memorised' as the last note.
         }
         
         if(Leaper==0)//If leaper IS zero
         {
         lastnote+(Std.rand2(-5,5)%14)=>nownote;//The soloist will play any note 5 either way from the last note.
         if (nownote<0)//Same as last time, safeguard for the array.
         { Std.rand2(0,4)=>nownote;}//
         if (nownote>14)//
         { Std.rand2(10,14)=>nownote;}//
         Std.mtof(scale[nownote]+24) => soloist.freq;//The soloist plays nownote.
         SoloistPlayer(swinger);//Calls 'soloist player' to determine how the note is played.
         nownote => lastnote;//The note just played is 'memorised' as the last note.
         }
         }

    }
}

fun void SoloistPlayer (int swinger)//Swinger determines how the note is played.
{
    if (swinger==0)//On the strong quaver
    {Std.rand2f(0.8,1.0)=>soloist.noteOn;}//Play a most likely louder note.
    if (swinger==6)//On the weak quaver
    {Std.rand2f(0.7,0.9)=>soloist.noteOn;}//Play a most likely quieter note.
}



    
while(true)
{   
    JazzImproviser(counter%8, Std.rand2(0,9));
    count.microbeat=>now;//Time passes depends on set tempo, according to counter class
    counter++;
}