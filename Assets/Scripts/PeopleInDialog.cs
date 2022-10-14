using System.Collections.Generic;

public class PeopleInDialog
{
   private readonly Dictionary<string,DialogTarget> _personInDialog = new Dictionary<string, DialogTarget>();
   
   public void SwitchPerson(string ID, Mood mood)
   {
      switch (mood)
      {
         case Mood.Sad:
            _personInDialog[ID].PlaySadAnimation();
            break;
         case Mood.Happy:
            _personInDialog[ID].PlayHappyAnimation();
            break;
         case Mood.Win:
            _personInDialog[ID].PlayWinAnimation();
            break;
      }
   }

   public void AddPerson(string ID, DialogTarget personInDialog) => _personInDialog.Add(ID,personInDialog);

}
