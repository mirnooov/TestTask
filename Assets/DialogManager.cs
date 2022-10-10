using System;
using System.Collections.Generic;
using Cinemachine;
using UnityEngine;

public class DialogManager : MonoBehaviour
{
    [SerializeField] private List<DialogPhrase> _dialogsPhrases;
    [SerializeField] private CinemachineBrain _cameraForDialog;
    [SerializeField] private DialogDisplayer _dialogDisplayer;
    
    private PeopleInDialog _peopleInDialog;
    
    public Action<string> DialogEndedEvent;

    private void OnEnable()
    {
        InitPerson();
    }

    private void InitPerson(params PersonInDialog[] personInDialogs)
    {
        foreach (var person in personInDialogs)
        {
            _peopleInDialog.AddPerson(person);
        }
    }

    public void StartDialog()
    {
        _cameraForDialog.SetEnable(true);
        _dialogDisplayer.UpdatePhrases(_dialogsPhrases[0].Author, _dialogsPhrases[0].Phrases);
    }

    public void EndPhrases()
    {
        _dialogsPhrases.RemoveAt(0);

        if (_dialogsPhrases.Count <= 0)
            EndDialog();
        else
            _dialogDisplayer.UpdatePhrases(_dialogsPhrases[0].Author, _dialogsPhrases[0].Phrases);
        
        _peopleInDialog.SwitchPerson(_dialogsPhrases[0].Author, _dialogsPhrases[0].Mood);
    }
    
    private void EndDialog()
    {
        DialogEndedEvent?.Invoke("KillWolf");
    }
}

[Serializable]
public class DialogPhrase
{
    public string Author;
    public string Phrases;
    public string Mood;
}
