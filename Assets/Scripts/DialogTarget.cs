using UnityEngine;

public class DialogTarget : MonoBehaviour, ITaskTarget
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
