using System.Collections.Generic;
using UnityEngine;

public class PeopleInDialog
{
   private readonly Dictionary<string,DialogTarget> _personInDialog = new Dictionary<string, DialogTarget>();
   
   public void SwitchPerson(string ID, string mood)
   {
      Debug.Log("Current author: " + _personInDialog[ID].gameObject.name);
   }

   public void AddPerson(string ID, DialogTarget personInDialog) => _personInDialog.Add(ID, personInDialog);

}
