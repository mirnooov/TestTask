using System;
using UnityEngine;

public class SpawnManager : MonoBehaviour
{ 
    public void StartSpawnKillTarget(ITaskArgument taskArgument)
    {
        var killTaskArgument = taskArgument as KillTaskArgument;
      for (int i = 0; i < killTaskArgument.Amount; i++)
      {
        var target = Instantiate(killTaskArgument.Target, Vector3.zero, Quaternion.identity);
        target.KilledEvent += killTaskArgument.Done;
      }
    }
}
