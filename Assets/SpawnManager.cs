
using System;
using UnityEngine;

public class SpawnManager : MonoBehaviour
{ 
    public void StartSpawnKillTarget(ITaskTarget killTarget, int amount, Action kill) 
    {
      for (int i = 0; i < amount; i++)
      {
        var target = Instantiate((KillTarget)killTarget, Vector3.zero, Quaternion.identity);
        target.KilledEvent += kill;
      }
    }
}
