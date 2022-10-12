using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PersonInDialog : MonoBehaviour
{
    [SerializeField] private string ID;
    [SerializeField] private Animation _sadAnimation;

    private Animator _animator;
    
    public void PlaySadAnimation()
    {
        _animator.Play(_sadAnimation.name);
    }
}
