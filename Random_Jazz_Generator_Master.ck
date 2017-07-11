//Set your Chuck directory to "McBride_6", wherever you've put that folder, and this program should work fine.

Machine.add ("SwingCounter.ck") => int ID1;//Universal counter
Machine.add ("A6ChordProg.ck") => int ID2;//Universal chord progression
Machine.add ("Drummer.ck") => int ID3;//Drums enter solo

13::second => now;//Play for 13 seconds

Machine.remove(ID3);//Cut out

2::second => now;//Pause

Machine.add ("Drummer.ck") => int ID7;//Drums come in with
Machine.add ("Bassist.ck") => int ID4;//Bass

10::second => now;//Play for 10 seconds

Machine.remove(ID7);//Cut
Machine.remove(ID4);//out

2::second => now;//Pause

Machine.add ("Drummer.ck") => int ID8;//Drums come back in
Machine.add ("Bassist.ck") => int ID9;//with bass
Machine.add ("Rhodeschords.ck") => int ID5;//chord comping
Machine.add ("Soloist.ck") => int ID6;//And a soloist.

60::second => now;//Play til the end.

    Machine.remove(ID8);//Cut out
    Machine.remove(ID9);
    Machine.remove(ID5);
    Machine.remove(ID6);
    
public class SetUniversalParameters//Allows tempo and key to be set from master file.
{
    300 => float Tempo;
    38 => int Tonic;
}
