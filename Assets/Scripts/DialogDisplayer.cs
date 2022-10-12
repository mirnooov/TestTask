using System;
using TMPro;
using UnityEngine;

public class DialogDisplayer : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI _authorText;
    [SerializeField] private TextMeshProUGUI _phraseText;
    
    public void UpdatePhrases(string author, string phrase)
    {
        _authorText.text = author + ": ";
        _phraseText.text = phrase;
    }

    public void Reset()
    {
        _authorText.text = string.Empty;
        _phraseText.text = string.Empty;
    }
    
}
