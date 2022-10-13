using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// Quest giver script, contains functionality for a quest giver.
/// </summary>
public class QuestGiver : MonoBehaviour
{
    /// <summary>
    /// A list of quests this QuestGiver can give
    /// </summary>
    [Tooltip("Set this to the quests, the questgiver should give.")]
    public List<ForExampleQuest> quests = new List<ForExampleQuest>();

    /// <summary>
    /// Radius the quest giver will give the quest in.
    /// </summary>
    [SerializeField, Tooltip("Radius of the QuestGiver")]
    public float radius = 3;

    /// <summary>
    /// Radius player has to move away, before quest is considered declined
    /// </summary>
    [SerializeField, Tooltip("Radius player has to move away, before quest is considered declined")]
    public float declineDistance = 5;

    /// <summary>
    /// If true, player will be able to pickup quest by walking within radius
    /// </summary>
    [SerializeField, Tooltip("If true, player will be able to pickup quest by walking within radius")]
    public bool walkIntoStartQuest = true;

    /// <summary>
    /// The quest symbol over the quest giver
    /// </summary>
    public GameObject questSymbol;

    /// <summary>
    ///  Use this for initialization
    /// </summary>
    private void Start()
    {
        //Adds a collider to the questgiver, and sets it's values.
        this.gameObject.AddComponent<SphereCollider>();
        this.GetComponent<SphereCollider>().radius = radius;
        this.GetComponent<SphereCollider>().isTrigger = true;
        if (this.GetComponentInChildren<Canvas>())
        {
            if (questSymbol != null)
            {
                questSymbol = this.GetComponentInChildren<Canvas>().gameObject;
            }
        }
        else
        {
            Debug.LogWarning("A quest object is missing its canvas. Quest symbol logic will no work.");
        }
        if (quests.Count == 0)
        {
            questSymbol.SetActive(false);
        }

    }

    /// <summary>
    /// Is run every frame
    /// </summary>
    private void Update()
    {
        if (questSymbol != null)
        {
            foreach (ForExampleQuest quest in quests)
            {
                if (quest != null)
                {
                    quest.AddPlayerToCriterias();
                    if (quest == null || quest.pickUpAble != true || quest.playersUnCompleted.Contains(QuestHandler.Instance.SelectedPlayer) || quest.playersCompleted.Contains(QuestHandler.Instance.SelectedPlayer)) //TODO: This should just be changed when an update happens, not waste resource by checking every update
                    {
                        questSymbol.SetActive(false);
                        if (quest.remainingRepeatableTime.ContainsKey(QuestHandler.Instance.SelectedPlayer))
                        {
                            if (quest.playersCompleted.Contains(QuestHandler.Instance.SelectedPlayer) && quest.repeatable == true && quest.remainingRepeatableTime[QuestHandler.Instance.SelectedPlayer] <= 0 && !quest.playersUnCompleted.Contains(QuestHandler.Instance.SelectedPlayer))
                            {
                                questSymbol.SetActive(true);
                                break;
                            }
                        }
                    }
                    else
                    {
                        questSymbol.SetActive(true);
                        break;
                    }
                }
                else
                {
                    quests.Remove(quest);
                    break;
                }
            }
        }
    }

    /// <summary>
    /// If a player collides with the QuestGiver, the questgiver will give the quest to the player by instantiating it.
    /// </summary>
    /// <param name="coll">The collider colliding with the questGiver</param>
    public void OnTriggerEnter(Collider coll)
    {
        if (radius > 0 && walkIntoStartQuest == true)
        {
            CQPlayerObject player = coll.GetComponent<CQPlayerObject>();
            if (player == null)
            {
                player = coll.GetComponentInParent<CQPlayerObject>();
            }
            if (player != null)
            {
                foreach (ForExampleQuest quest in quests)
                {
                    if (quest != null && quest.pickUpAble == true)
                    {
                        StartQuestPopUp(player, quest);
                    }
                }
            }
        }
    }

    /// <summary>
    /// Starts the progress of a quest pop up.
    /// </summary>
    /// <param name="player">The player recieving the quest pop up</param>
    public void StartQuestPopUp(CQPlayerObject player, ForExampleQuest forExampleQuest)
    {
        if (forExampleQuest)
        {
            if (forExampleQuest.pickUpAble == true)
            {
                if (FindObjectOfType<QuestUI>())
                {
                    EventInfoHolder tmpE = new EventInfoHolder();
                    tmpE.player = player;
                    tmpE.ForExampleQuest = forExampleQuest;
                    tmpE.questGiver = this;
                    QuestHandler.TriggerEvent("StartQuestPopUp", tmpE); //Sends out the StartQuestPopUp event
                }
                else
                {
                    QuestHandler.Instance.QuestsDiscovered(forExampleQuest, player);
                }
            }
        }
        else
        {
            Debug.LogWarning("Quest is null in: " + this.gameObject + " Cannot give quest");
        }
    }
}