using System;
using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;
using UnityEngine.Events;

[Serializable]
public class Task
{
    [SerializeField] private string _name;
    [SerializeField] private string _description;
    [SerializeField] private Sprite _icon;

    [SerializeField] private TypeTask _typeTask;

    [ShowIf("_typeTask", TypeTask.Kill)]
    [SerializeField] private KillTaskData _killTaskData;
    
    [ShowIf("_typeTask", TypeTask.Follow)]
    [SerializeField] private FollowTaskData _followTaskData;
    
    [SerializeField] private UnityEvent<ITaskTarget,int,Action> _startTaskEvent;
    [SerializeField] private UnityEvent _completedTaskEvent;

    public string Name => _name;
    public string Description => _name;
    public Sprite Icon  => _icon;
    

    public void StartTask()
    {
        _killTaskData.Init(_startTaskEvent,_completedTaskEvent);
    }

}

public enum TypeTask
{
    Follow,
    Kill
}

[Serializable]
public class KillTaskData : ITaskData
{
    [SerializeField] private int _amount;
    [SerializeField] private KillTarget _killTarget;

    private UnityEvent _completedEvent;
    private int _currentKillCount;
    
    public void Init( UnityEvent<ITaskTarget,int,Action> startEvent, UnityEvent completedEvent)
    {
        startEvent.Invoke(_killTarget, _amount, OnKillAdd);
        _completedEvent = completedEvent;
    }

    private void OnKillAdd()
    {
        if (++_currentKillCount >= _amount)
        {
            _completedEvent.Invoke();
        }
    }
}

[Serializable]
public class FollowTaskData : ITaskData
{
    [SerializeField] private DialogTarget _dialogTarget;
    [SerializeField] private List<DialogPhrase> _dialog;

    private UnityEvent _completedEvent;
    
    public void Init( UnityEvent<ITaskTarget,int,Action> startEvent, UnityEvent completedEvent)
    {
        _dialogTarget.DialogEnded += OnDialogEnded;
        startEvent.Invoke(_dialogTarget, 0, null);
        _completedEvent = completedEvent;
    }

    private void OnDialogEnded()
    {
        _completedEvent.Invoke();
    }
}

public interface ITaskData 
{
    public void Init( UnityEvent<ITaskTarget,int,Action> startEvent, UnityEvent completedEvent);
}
public interface ITaskTarget
{
    
}