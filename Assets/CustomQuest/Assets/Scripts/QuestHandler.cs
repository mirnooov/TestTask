using CustomQuest;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.Events;

/// <summary>
/// The quest handler, keeps track of players and quests. Can be accessed from anywhere, thanks to the Manager
/// </summary>
public class QuestHandler : Manager<QuestHandler>
{
    #region Field

    /// <summary>
    /// A list over the quests currently in the scene.
    /// </summary>
    public List<ForExampleQuest> allQuests = new List<ForExampleQuest>();

    /// <summary>
    /// A list over the players currently in the scene. To add a new player, use "AddPlayer".
    /// </summary>
    public List<CQPlayerObject> players = new List<CQPlayerObject>();

    /// <summary>
    /// A dictonary which contains all the players, and the quests they each have
    /// </summary>
    public Dictionary<CQPlayerObject, List<ForExampleQuest>> availableQuests = new Dictionary<CQPlayerObject, List<ForExampleQuest>>();

    /// <summary>
    /// The currently selected player. In networking enviroments, this would be the local client.
    /// </summary>
    public CQPlayerObject selectedPlayer;

    /// <summary>
    /// The event dictonary - Stores all events
    /// </summary>
    private Dictionary<string, List<UnityAction<EventInfoHolder>>> eventDictonary;

    #endregion Field

    #region Properties

    /// <summary>
    /// The properties for selectedPlayer - Tries to find a player, if its null
    /// </summary>
    public CQPlayerObject SelectedPlayer
    {
        get
        {
            if (selectedPlayer == null)
            {
                if (players.Count > 0)
                {
                    selectedPlayer = players[0];
                }
                else
                {
                    selectedPlayer = FindObjectOfType<CQPlayerObject>();
                }
            }
            if (selectedPlayer == null)
            {
                Debug.LogWarning("No player found in scene, quest system not funktional. Make sure there is a player in the scene. (Add the CQPlayerObject component to your player object)");
            }
            return selectedPlayer;
        }

        set { selectedPlayer = value; }
    }

    /// <summary>
    /// The properties for EventDictonary - Creates a new dictionary, if its null
    /// </summary>
    public Dictionary<string, List<UnityAction<EventInfoHolder>>> EventDictonary
    {
        get
        {
            if (eventDictonary == null)
            {
                eventDictonary = new Dictionary<string, List<UnityAction<EventInfoHolder>>>();
            }
            return eventDictonary;
        }

        set { eventDictonary = value; }
    }

    #endregion Properties

    /*** Unity Methods ***/

    /// <summary>
    /// Awake is run before Start
    /// </summary>
    public override void Awake()
    {
        base.Awake();
        // Initializes the eventdictonary, if its null
        if (EventDictonary == null)
        {
            EventDictonary = new Dictionary<string, List<UnityAction<EventInfoHolder>>>();
        }
        // find all players
        FindPlayers();
        // find all quests
        FindQuests();
    }

    /// <summary>
    ///  Use this for initialization
    /// </summary>
    private void Start()
    {
        Reset();

#if UNITY_EDITOR
        CustomQuestSettings.Start();
#endif
    }

    /// <summary>
    /// Is run everytime a component is added, or reset button pressed. Used to set needed variables
    /// </summary>
    private void Reset()
    {
        if (SelectedPlayer == null)
        {
            SelectedPlayer = FindObjectOfType<CQPlayerObject>();
        }
    }

    /*** Public Methods ***/

    /// <summary>
    /// Tells the quest system that a quest has been discovered by a player
    /// </summary>
    /// <param name="forExampleQuest">The quest discovered</param>
    /// <param name="player">The player who discovered the quest</param>
    public void QuestsDiscovered(ForExampleQuest forExampleQuest, CQPlayerObject player)
    {
        if (!availableQuests[player].Contains(forExampleQuest))
        {
            availableQuests[player].Add(forExampleQuest);
            forExampleQuest.playersUnCompleted.Add(player);
            if (forExampleQuest.startSpawningOnDiscover)
            {
                forExampleQuest.StartSpawning(player);
            }
            if (!allQuests.Contains(forExampleQuest))
            {
                allQuests.Add(forExampleQuest);
            }
            forExampleQuest.ResetCriterias(player);
            if (forExampleQuest.timed)
            {
                if (!forExampleQuest.remainingTime.ContainsKey(player))
                {
                    forExampleQuest.remainingTime.Add(player, forExampleQuest.time);
                }
                else
                {
                    forExampleQuest.remainingTime[player] = forExampleQuest.time;
                }
            }
            forExampleQuest.StartCriterias();

            EventInfoHolder tmpE = new EventInfoHolder();
            tmpE.player = player;
            tmpE.ForExampleQuest = forExampleQuest;
            TriggerEvent("UpdateQuestTracker", tmpE); //Sends out the UpdateQuestTracker event

            if (forExampleQuest.autoComplete == true && forExampleQuest.orikList.Count == 0)
            {
                forExampleQuest.OnCompletion(player, player.GetComponent<CQExamplePlayer>());
            }
        }
    }

    /// <summary>
    /// Finds all the quests in the scene, and adds them to the allQuests list
    /// </summary>
    public void FindQuests()
    {
        allQuests.AddRange(FindObjectsOfType<ForExampleQuest>());
    }

    /// <summary>
    /// Finds all the players in the scene, and adds them to the players list
    /// </summary>
    public void FindPlayers()
    {
        foreach (CQPlayerObject p in FindObjectsOfType<CQPlayerObject>())
        {
            if (!players.Contains(p))
            {
                AddPlayer(p);
            }
        }
    }

    /// <summary>
    /// Adds a player to the players list
    /// </summary>
    /// <param name="p">The player to be added</param>
    public void AddPlayer(CQPlayerObject p)
    {
        players.Add(p);
        availableQuests.Add(p, new List<ForExampleQuest>()); //Add a list to all players
        foreach (ForExampleQuest quest in allQuests)
        {
            if (quest.startAvailability == true)
            {
                if (!availableQuests[p].Contains(quest))
                {
                    QuestsDiscovered(quest, p);
                }
            }
        }
    }

    /// <summary>
    /// Find a componet by name, and returns it
    /// </summary>
    /// <param name="name">The name of the component to find</param>
    /// <returns>The component which has the name, or null</returns>
    public static System.Type GetComponentTypeByName(string name)
    { //Source: https://forum.unity3d.com/threads/update-changes-addcomponent-and-strings.308309/#post-2018213
        if (string.IsNullOrEmpty(name)) return null;

        var ctp = typeof(Component);
        foreach (var assemb in System.AppDomain.CurrentDomain.GetAssemblies())
        {
            foreach (var tp in assemb.GetTypes())
            {
                if (ctp.IsAssignableFrom(tp) && tp.Name == name) return tp;
            }
        }
        return null;
    }

    /*** Event System Methods ***/

    public static void StartListening(string eventName, UnityAction<EventInfoHolder> listener)
    {
        List<UnityAction<EventInfoHolder>> thisEvent;
        if (Instance.EventDictonary.TryGetValue(eventName, out thisEvent))
        {
            thisEvent.Add(listener);
        }
        else
        {
            thisEvent = new List<UnityAction<EventInfoHolder>>();
            thisEvent.Add(listener);
            Instance.EventDictonary.Add(eventName, thisEvent);
        }
    }

    public static void StopListening(string eventName, UnityAction<EventInfoHolder> listener)
    {
        List<UnityAction<EventInfoHolder>> thisEvent = null;
        if (Instance != null)
        {
            if (Instance.EventDictonary.TryGetValue(eventName, out thisEvent))
            {
                thisEvent.Remove(listener);
            }
        }
    }

    public static void TriggerEvent(string eventName, EventInfoHolder e)
    {
        List<UnityAction<EventInfoHolder>> thisEvent = null;
        if (Instance.EventDictonary.TryGetValue(eventName, out thisEvent))
        {
            foreach (UnityAction<EventInfoHolder> item in thisEvent)
            {
                item.Invoke(e);
            }
        }
    }

    /*** Unity Editor ***/

#if UNITY_EDITOR

    /// <summary>
    /// Sets a gameobject field by its name. It searches itself and children for a matching name.
    /// </summary>
    /// <param name="fieldName">The name of the field to be set</param>
    private void SetFieldByNameAsObject(string fieldName)
    {
        // Magic of reflection
        // For each field in your class/component we are looking only for those that are empty/null
        foreach (var field in typeof(QuestHandler).GetFields().Where(field => field.Name == fieldName))
        {
            // Now we are looking for object (self or child) that have same name as a field
            Transform obj;
            if (transform.name == field.Name)
            {
                obj = transform;
            }
            else
            {
                obj = transform.Find(field.Name); // Or you need to implement recursion to looking into deeper childs
            }

            // If we find object that have same name as field we are trying to get component that will be in type of a field and assign it
            if (obj != null)
            {
                field.SetValue(this, obj.gameObject);
            }
        }
    }

#endif
}