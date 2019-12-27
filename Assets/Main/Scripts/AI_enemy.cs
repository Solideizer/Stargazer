using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AI_enemy : MonoBehaviour
{
    public Transform player;
    public float distance = 30f;
    private static Animator anim;
    public float moveSpeed;
    private float runMultiplier = 1.4f;

    // Use this for initialization
    private void Start()
    {
        anim = GetComponent<Animator>();
    }

    // Update is called once per frame
    private void Update()
    {
        Vector3 direction = player.position - this.transform.position;
        float angle = Vector3.Angle(direction, this.transform.forward);

        if (EnemyHumanoid.isAlive)
        {
            if (EnemyHumanoid.health > DetectHit.health) //if enemies health is greater than players health
            {
                if (Vector3.Distance(player.position, this.transform.position) < distance && angle < 115 | EnemyHumanoid.isHit == true)
                {
                    direction.y = 0;

                    this.transform.rotation = Quaternion.Slerp(this.transform.rotation, Quaternion.LookRotation(direction), 0.1f);

                    anim.SetBool("isPatrolling", false);

                    if (direction.magnitude > 3)
                    {
                        this.transform.Translate(0, 0, moveSpeed * runMultiplier);
                        anim.SetBool("isRunning", true);
                        anim.SetBool("isAttacking", false);
                    }
                    else
                    {
                        anim.SetBool("isAttacking", true);
                        anim.SetBool("isRunning", false);
                    }
                }
                else
                {
                    anim.SetBool("isPatrolling", true);
                    anim.SetBool("isAttacking", false);
                    anim.SetBool("isRunning", false);
                }
            }
            else //if enemies health is lower than players health
            {
                if (Vector3.Distance(player.position, this.transform.position) < distance) //if the distance between player and enemy is less than aggro distance
                {
                    direction.y = 0;
                    this.transform.rotation = Quaternion.Slerp(this.transform.rotation, Quaternion.LookRotation(-direction), 0.1f);

                    this.transform.Translate(0, 0, moveSpeed * runMultiplier);
                    anim.SetBool("isRunning", true);
                    anim.SetBool("isAttacking", false);
                }
                else
                {
                    anim.SetBool("isPatrolling", true);
                    anim.SetBool("isRunning", false);
                    anim.SetBool("isAttacking", false);
                }
            }
        }
    }
}