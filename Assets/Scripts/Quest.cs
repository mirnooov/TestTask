using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Quest : MonoBehaviour
{
    [SerializeField] private List<Task> _tasks;
    [SerializeField] private bool _startOnAwake;
    [SerializeField] private QuestDisplayer _questDisplayer;
    
    private bool _isStarted;

    private void Awake()
    {
        if(_startOnAwake)
            StartQuest();
    }
    public void StartQuest()
    {
        if (_isStarted == false)
        {
            StartTask();
            _isStarted = true;
        }
    }

    public void StartTask()
    {
        _tasks[0].StartTask();
        _questDisplayer.Init(_tasks[0].Name, _tasks[0].Description, _tasks[0].Icon);
    }

    public void OnCompleteTask()
    {
        _tasks.RemoveAt(0);
        if (_tasks.Count <= 0)
        {
            OnCompleteQuest();
            return;
        }
        StartTask();
    }

    public void OnCompleteQuest()
    {
        
    }
    
    
}
