using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class QuestDisplayer : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI _nameText;
    [SerializeField] private TextMeshProUGUI _descriptionText;
    [SerializeField] private Image _iconImage;

    public void Init(string name, string description, Sprite icon)
    {
        _nameText.text = name;
        _descriptionText.text = description;
        _iconImage.sprite = icon;
    }

}
