using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PersonInDialog : MonoBehaviour
{
    [SerializeField] private string Id;
    [SerializeField] private Animation _sadAnimation;

    private Animator _animator;

    public string ID => Id;
    public void PlaySadAnimation()
    {
        _animator.Play(_sadAnimation.name);
    }
}
