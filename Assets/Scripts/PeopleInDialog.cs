using System.Collections.Generic;

public class PeopleInDialog
{
   private List<PersonInDialog> _personInDialog;
   public void SwitchPerson(string ID, string mood)
   {
      //_personInDialog[ID].enabled = true;
      switch (mood)
      {
         case "Sad":
            _personInDialog[0].PlaySadAnimation();
            break;
         default: 
            break;
      }
   }

   public void AddPerson(PersonInDialog personInDialog) => _personInDialog.Add(personInDialog);

}
