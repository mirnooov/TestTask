using System;
using System.Collections.Generic;
using MalbersAnimations.Events;
using UnityEngine;

public class DialogManager : MonoBehaviour
{
    [SerializeField] private List<DialogPhrase> _dialogsPhrasesForStart;
    [SerializeField] private List<DialogPhrase> _dialogsPhrasesForFinal;
    [SerializeField] private DialogDisplayer _dialogDisplayer;
    [SerializeField] private MEvent _cannotInteractiveEvent;
    
    private List<DialogPhrase> _currentDialogsPhrases;
    private PeopleInDialog _peopleInDialog;
    private bool _dialogStarted = false;

    private void Update()
    {
        if(Input.GetKeyUp(KeyCode.Space) && _dialogStarted)
            EndPhrases();
    }

    public void StartDialog(bool isFinal = false)
    {
        _dialogStarted = true;
        _currentDialogsPhrases = _dialogsPhrasesForStart;
        
        _dialogDisplayer.UpdatePhrases(_currentDialogsPhrases[0].Author, _currentDialogsPhrases[0].Phrases);
    }

    public void InitPerson(params PersonInDialog[] personInDialogs)
    {
        foreach (var person in personInDialogs)
        {
            _peopleInDialog.AddPerson(person);
        }
    }
    private void EndPhrases()
    {
        _currentDialogsPhrases.RemoveAt(0);

        if (_currentDialogsPhrases.Count <= 0)
            EndDialog();
        else
            _dialogDisplayer.UpdatePhrases(_currentDialogsPhrases[0].Author, _currentDialogsPhrases[0].Phrases);
        
        //_peopleInDialog.SwitchPerson(_currentDialogsPhrases[0].Author, _currentDialogsPhrases[0].Mood);
    }
    private void EndDialog()
    {
        _dialogStarted = false;
        _dialogDisplayer.Reset();
        _cannotInteractiveEvent.Invoke();
    }
}

[Serializable]
public class DialogPhrase
{
    public string Author;
    public string Phrases;
    public string Mood;
}
