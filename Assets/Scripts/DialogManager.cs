using System;
using System.Collections.Generic;
using MalbersAnimations.Events;
using UnityEngine;

public class DialogManager : MonoBehaviour
{
    [SerializeField] private DialogDisplayer _dialogDisplayer;
    [SerializeField] private MEvent _cannotInteractiveEvent;
    
    private List<DialogPhrase> _currentDialogsPhrases;
    private PeopleInDialog _peopleInDialog;
    private bool _dialogStarted = false;

    private Action _dialogEnded;
    private void Update()
    {
        if(Input.GetKeyUp(KeyCode.Space) && _dialogStarted)
            EndPhrases();
    }

    public void Init(ITaskArgument taskArgument)
    {
        var followTaskArgument = taskArgument as FollowTaskArgument;
        _currentDialogsPhrases = followTaskArgument.Dialog;
        InitPerson(followTaskArgument.Target);
        _dialogEnded = followTaskArgument.Done;
    }
    public void StartDialog()
    {
        _dialogStarted = true;
        _peopleInDialog.SwitchPerson(_currentDialogsPhrases[0].Author, _currentDialogsPhrases[0].Mood);
        _dialogDisplayer.UpdatePhrases(_currentDialogsPhrases[0].Author, _currentDialogsPhrases[0].Phrases);
    }

    private void InitPerson(params DialogTarget[] personInDialogs)
    {
        _peopleInDialog = new PeopleInDialog();
        foreach (var person in personInDialogs)
        {
            _peopleInDialog.AddPerson(person.ID, person);
        }
    }
    private void EndPhrases()
    {
        _currentDialogsPhrases.RemoveAt(0);

        if (_currentDialogsPhrases.Count <= 0)
            EndDialog();
        else
            _dialogDisplayer.UpdatePhrases(_currentDialogsPhrases[0].Author, _currentDialogsPhrases[0].Phrases);
        
        _peopleInDialog.SwitchPerson(_currentDialogsPhrases[0].Author, _currentDialogsPhrases[0].Mood);
    }
    private void EndDialog()
    {
        _dialogStarted = false;
        _dialogDisplayer.Reset();
        _cannotInteractiveEvent.Invoke();
        _dialogEnded?.Invoke();
    }
}

[Serializable]
public class DialogPhrase
{
    public string Author;
    public string Phrases;
    public string Mood;
}
