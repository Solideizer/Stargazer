using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Patrol : StateMachineBehaviour
{

    GameObject NPC;
    GameObject[] waypoints;
    int currentWP;
    public float moveSpeed = 0.05f;

    private void Awake()
    {
        waypoints = GameObject.FindGameObjectsWithTag("Waypoints");

    }
    //OnStateEnter is called when a transition starts and the state machine starts to evaluate this state
    override public void OnStateEnter(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
    {
        NPC = animator.gameObject;
        currentWP = 0;
    }

    // OnStateUpdate is called on each Update frame between OnStateEnter and OnStateExit callbacks
    override public void OnStateUpdate(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
    {
        if (waypoints.Length == 0) return;
        if (Vector3.Distance(waypoints[currentWP].transform.position, NPC.transform.position) < 5.0f)
        {
            currentWP++;
            if (currentWP >= waypoints.Length)
            {
                currentWP = 0;
            }

        }

        //rotate
        var direction = waypoints[currentWP].transform.position - NPC.transform.position;
        NPC.transform.rotation = Quaternion.Slerp(NPC.transform.rotation, Quaternion.LookRotation(direction), 1.0f * Time.deltaTime);

        NPC.transform.Translate(0, 0, moveSpeed);
        //Debug.Log(waypoints[currentWP]);


    }

    
}
