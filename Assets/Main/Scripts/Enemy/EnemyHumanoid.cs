using UnityEngine;

public class EnemyHumanoid : MonoBehaviour
{
    private static Animator anim;
    public static float health = 500f;
    public static bool isAlive = true;
    public static bool isHit = false;

    private void Start()
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

    private void Die()
    {
        anim.SetInteger("State",3);
        isAlive = false;
        Destroy(gameObject, 10f);
    }
}