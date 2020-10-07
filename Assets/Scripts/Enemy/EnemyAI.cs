using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyAI : MonoBehaviour
{
    public Transform player;
    public float distance = 30f;
    public float moveSpeed;
    
    private static Animator _anim;
    private float runMultiplier = 1.4f;

    private void Start()
    {
        _anim = GetComponent<Animator>();
    }

    private void Update()
    {
        EnemyAi();
    }

    private void EnemyAi()
    {
        Vector3 direction = player.position - this.transform.position;
        float angle = Vector3.Angle(direction, this.transform.forward);

        if (EnemyHumanoid.isAlive)
        {
            if (EnemyHumanoid.health > DetectHit.health) //if enemies health is greater than players health
            {
                if (Vector3.Distance(player.position, this.transform.position) < distance &&
                    angle < 115 | EnemyHumanoid.isHit == true)
                {
                    direction.y = 0;

                    this.transform.rotation =
                        Quaternion.Slerp(this.transform.rotation, Quaternion.LookRotation(direction), 0.1f);

                    _anim.SetBool("isPatrolling", false);

                    if (direction.magnitude > 3)
                    {
                        this.transform.Translate(0, 0, moveSpeed * runMultiplier);
                        _anim.SetBool("isRunning", true);
                        _anim.SetBool("isAttacking", false);
                    }
                    else
                    {
                        _anim.SetBool("isAttacking", true);
                        _anim.SetBool("isRunning", false);
                    }
                }
                else
                {
                    _anim.SetBool("isPatrolling", true);
                    _anim.SetBool("isAttacking", false);
                    _anim.SetBool("isRunning", false);
                }
            }
            else //if enemies health is lower than players health
            {
                if (Vector3.Distance(player.position, this.transform.position) < distance
                ) //if the distance between player and enemy is less than aggro distance
                {
                    direction.y = 0;
                    this.transform.rotation =
                        Quaternion.Slerp(this.transform.rotation, Quaternion.LookRotation(-direction), 0.1f);

                    this.transform.Translate(0, 0, moveSpeed * runMultiplier);
                    _anim.SetBool("isRunning", true);
                    _anim.SetBool("isAttacking", false);
                }
                else
                {
                    _anim.SetBool("isPatrolling", true);
                    _anim.SetBool("isRunning", false);
                    _anim.SetBool("isAttacking", false);
                }
            }
        }
    }
}