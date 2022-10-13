using System.Collections.Generic;

public class PeopleInDialog
{
   private Dictionary<string,PersonInDialog> _personInDialog;
   public void SwitchPerson(string ID, string mood)
   {
      switch (mood)
      {
         case "Sad":
            _personInDialog[ID].PlaySadAnimation();
            break;
         default: 
            break;
      }
   }

   public void AddPerson(string ID,PersonInDialog personInDialog) => _personInDialog.Add(ID,personInDialog);

}
