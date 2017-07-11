public class ChordProg// A class that provides a universal chord progression
{
    int ChordOne[3];//Four
    int ChordTwo[3];//chord
    int ChordThree[4];//prog-
    int ChordFour[3];//ression
    0=> int Start;//These integers are the times (set as numbers) within the counter class when the chord should change.
    64 => int ChangeOne;
    128 => int ChangeTwo;
    256 => int ChangeThree;
    384 => int ChangeFour;
    512 => int ChangeFive;
    576 => int ChangeSix;
    640 => int ChangeSeven;
    768 => int ChangeEight;
    832 => int ChangeNine;
    896 => int ChangeTen;
    
    fun void chordbuild(int tonic)//Function that builds each chord.
    {
    
        [tonic, tonic+3, tonic+7] @=> ChordOne;//Chord one is tonic minor
        [tonic+5, tonic+8, tonic+12] @=> ChordTwo;//Chord two is subdominant minor
        [tonic+7, tonic+11, tonic+14, tonic+17] @=> ChordThree;//Chord three is dominant major 7
        [tonic+3, tonic+7, tonic+10] @=> ChordFour;//Chord four is mediant major
        
    }
}