using System;
using MalbersAnimations;
using UnityEngine;

public class KillTarget : MonoBehaviour, ITaskTarget
{
    private Stats _allStats;
    private Stat _health;
    public Action KilledEvent;

    public void OnEnable()
    {
        _allStats = GetComponent<Stats>();
        _health = _allStats.Stat_Get(1);
        _health.OnValueChange.AddListener(CheckHealth);
    }

    private void CheckHealth(float health)
    {
        if(health <= 0)
            KilledEvent?.Invoke();
    }
}
