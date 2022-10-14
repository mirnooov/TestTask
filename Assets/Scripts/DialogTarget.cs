using System;
using UnityEngine;

public class DialogTarget : MonoBehaviour, ITaskTarget
{
    [SerializeField] private string Id;

    private Animator _animator;

    public string ID => Id;

    private void OnEnable()
    {
        _animator = GetComponent<Animator>();
    }

    public void PlaySadAnimation()
    {
        _animator.SetTrigger("SadDialog");
    }
    public void PlayHappyAnimation()
    {
        _animator.SetTrigger("HappyDialog");
    } public void PlayWinAnimation()
    {
        _animator.SetTrigger("HipHopDialog");
    }
}
