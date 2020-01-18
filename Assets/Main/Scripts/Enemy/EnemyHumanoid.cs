using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyHumanoid : MonoBehaviour
{

    static Animator anim;
    public static float health = 500f;
    public static bool isAlive = true;
    public static bool isHit = false;

    void Start()
    {
        anim = GetComponent<Animator>();

    }

    public void takeDamage(float amount)
    {
        health -= amount;
        isHit = true;

        if (health <= 0)
        {
            Die();
        }
    }
    void Die()
    {
        anim.SetBool("isDead", true);
        isAlive = false;
        Destroy(gameObject, 5f);
    }
}

