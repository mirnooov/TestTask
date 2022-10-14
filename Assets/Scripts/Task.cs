using System;
using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;
using UnityEngine.Events;

[Serializable]
public class Task
{
    [HorizontalGroup("Split", 65), PropertyOrder(-1)]
    [PreviewField(65, ObjectFieldAlignment.Left), HideLabel]
    [SerializeField] private Sprite _icon;
    
    [BoxGroup("Split/Field")]
    [SerializeField] private string _name;
    [BoxGroup("Split/Field")]
    [SerializeField] private string _description;
    
    [EnumToggleButtons]
    [SerializeField] private TypeTask _typeTask;
    
    [ShowIf("_typeTask", TypeTask.Kill)]
    [SerializeField] private KillTaskData _killTaskData;
    [ShowIf("_typeTask", TypeTask.Follow)]
    [SerializeField] private FollowTaskData _followTaskData;
    
    [FoldoutGroup("Events")]
    [SerializeField] private UnityEvent<ITaskArgument> _startTaskEvent;
    [FoldoutGroup("Events")]
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
    [TableList]
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

    public FollowTaskArgument(DialogTarget[] target, List<DialogPhrase> dialog, Action done)
    {
        Target = target;
        Done = done;
        Dialog = dialog;
    }
}


/*
[PropertyOrder(int.MinValue), OnInspectorGUI]
private void DrawIntroInfoBox()
{
    SirenixEditorGUI.InfoMessageBox("Out of the box, Odin significantly upgrades the drawing of lists and arrays in the inspector - across the board, without you ever lifting a finger.");
}

[Title("List Basics")]
[InfoBox("List elements can now be dragged around to reorder them and deleted individually, and lists have paging (try adding a lot of elements!). You can still drag many assets at once into lists from the project view - just drag them into the list itself and insert them where you want to add them.")]
public List<float> FloatList;

[InfoBox("Applying a [Range] attribute to this list instead applies it to all of its float entries.")]
[Range(0, 1)]
public float[] FloatRangeArray;

[InfoBox("Lists can be made read-only in different ways.")]
[ListDrawerSettings(IsReadOnly = true)]
public int[] ReadOnlyArray1 = new int[] { 1, 2, 3 };

[ReadOnly]
public int[] ReadOnlyArray2 = new int[] { 1, 2, 3 };

public SomeOtherStruct[] SomeStructList;

[Title("Advanced List Customization")]
[InfoBox("Using [ListDrawerSettings], lists can be customized in a wide variety of ways.")]
[ListDrawerSettings(NumberOfItemsPerPage = 5)]
public int[] FiveItemsPerPage;

[ListDrawerSettings(ShowIndexLabels = true, ListElementLabelName = "SomeString")]
public SomeStruct[] IndexLabels;

[ListDrawerSettings(DraggableItems = false, Expanded = false, ShowIndexLabels = true, ShowPaging = false, ShowItemCount = false, HideRemoveButton = true)]
public int[] MoreListSettings = new int[] { 1, 2, 3 };

[ListDrawerSettings(OnBeginListElementGUI = "BeginDrawListElement", OnEndListElementGUI = "EndDrawListElement")]
public SomeStruct[] InjectListElementGUI;

[ListDrawerSettings(OnTitleBarGUI = "DrawRefreshButton")]
public List<int> CustomButtons;

[ListDrawerSettings(CustomAddFunction = "CustomAddFunction")]
public List<int> CustomAddBehaviour;

[Serializable]
public struct SomeStruct
{
    public string SomeString;
    public int One;
    public int Two;
    public int Three;
}*/

/*
[Serializable]
public struct SomeOtherStruct
{
    [HorizontalGroup("Split", 55), PropertyOrder(-1)]
    [PreviewField(50, Sirenix.OdinInspector.ObjectFieldAlignment.Left), HideLabel]
    public UnityEngine.MonoBehaviour SomeObject;

    [FoldoutGroup("Split/$Name", false)]
    public int A, B, C;

    [FoldoutGroup("Split/$Name", false)]
    public int Two;

    [FoldoutGroup("Split/$Name", false)]
    public int Three;

    private string Name { get { return this.SomeObject ? this.SomeObject.name : "Null"; } }
}

private void BeginDrawListElement(int index)
{
    SirenixEditorGUI.BeginBox(this.InjectListElementGUI[index].SomeString);
}

private void EndDrawListElement(int index)
{
    SirenixEditorGUI.EndBox();
}

private void DrawRefreshButton()
{
    if (SirenixEditorGUI.ToolbarButton(EditorIcons.Refresh))
    {
        Debug.Log(this.CustomButtons.Count.ToString());
    }
}

private int CustomAddFunction()
{
    return this.CustomAddBehaviour.Count;
}
*/
