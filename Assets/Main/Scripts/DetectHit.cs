using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DetectHit : MonoBehaviour
{
    //public Slider healthBar;
    public static float health = 100f;

    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.tag == "Player")
        {
            //healthBar.value -= 20;
            health -= 20;

            if (health <= 0)
            {
                Debug.Log("You died.");
            }
        }
    }
}

