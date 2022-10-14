using System;
using TMPro;
using UnityEngine;

public class DialogDisplayer : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI _phraseText;
    
    public void UpdatePhrases(string author, string phrase)
    {
        _phraseText.text = author + ": " + phrase;
    }

    public void Reset()
    {
        _phraseText.text = string.Empty;
    }
    
}
