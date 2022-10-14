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
    
    [SerializeField] private UnityEvent<ITaskArgument> _startTaskEvent;
    [SerializeField] private UnityEvent _completedTaskEvent;

    public string Name => _name;
    public string Description => _description;
    public Sprite Icon  => _icon;
    

    public void StartTask()
    {
        if(_typeTask == TypeTask.Kill)
            _killTaskData.Init(_startTaskEvent,_completedTaskEvent);
        else
            _followTaskData.Init(_startTaskEvent,_completedTaskEvent);
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
    
    public void Init(UnityEvent<ITaskArgument> startEvent, UnityEvent completedEvent)
    {
        var argument = new KillTaskArgument(_killTarget, _amount, OnKillAdd);
        startEvent.Invoke(argument);
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
    [SerializeField] private DialogTarget[] _dialogTarget;
    [SerializeField] private List<DialogPhrase> _dialog;
    private UnityEvent _completedEvent;
    
    public void Init(UnityEvent<ITaskArgument> startEvent, UnityEvent completedEvent)
    {
        var argument = new FollowTaskArgument(_dialogTarget, _dialog, OnDialogEnded);
        startEvent.Invoke(argument);
        _completedEvent = completedEvent;
    }

    private void OnDialogEnded()
    {
        _completedEvent.Invoke();
    }
}

public interface ITaskData 
{
    public void Init( UnityEvent<ITaskArgument> startEvent, UnityEvent completedEvent);
}
public interface ITaskTarget
{
}

public interface ITaskArgument
{
}


public class KillTaskArgument : ITaskArgument
{
    public KillTarget Target;
    public int Amount;
    public Action Done;
    
    public KillTaskArgument(KillTarget target, int amount, Action done)
    {
        Target = target;
        Amount = amount;
        Done = done;
    }
}

public class FollowTaskArgument : ITaskArgument
{
    public DialogTarget[] Target;
    public Action Done;
    public List<DialogPhrase> Dialog;
    
    public FollowTaskArgument(DialogTarget[] target, List<DialogPhrase> dialog,Action done)
    {
        Target = target;
        Done = done;
        Dialog = dialog;
    }
}