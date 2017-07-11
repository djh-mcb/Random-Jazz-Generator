public class SwingCounter
{
    int myBeats[4];
    int minim, crotchet, semiquaver, demisemiquaver;
    dur microbeat;
    dur halfloop;
    dur chordloop;
    
    fun void tempo (float beat) 
    {
        //beat is the BPM, for example, 120.0
        60.00/(beat) => float SPB;
        SPB/8=>float tinybeat;
        tinybeat::second => microbeat;//allows for expressivity and swing
        tinybeat*1024::second=>chordloop;
        tinybeat*512::second=> halfloop;
        16 => minim;
        8 => crotchet;// Counter % any
        2 => semiquaver;//of these values will 
        1 => demisemiquaver;//give the subdivision listed.
        [minim, crotchet, semiquaver, demisemiquaver] @=> myBeats;
    }
}