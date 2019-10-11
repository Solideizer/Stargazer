using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyAttack : MonoBehaviour
{
    [SerializeField] Transform target;
    [SerializeField] float weaponMaxDis = 300f;


    private void Update()
    {
        isInFront();
        haveLos();
        canAttack();
    }

    bool isInFront()
    {
        Vector3 directonToTarget = transform.position - target.position;
        float angle = Vector3.Angle(transform.forward, directonToTarget);

        if (Mathf.Abs(angle) > 90 && Mathf.Abs(angle) < 270)
        {
            Debug.DrawLine(transform.position, target.position, Color.green);
            return true;
        }
        else
        {
            Debug.DrawLine(transform.position, target.position, Color.yellow);
            return false;
        }
        
    }
    bool haveLos()
    {
        RaycastHit hitInfo;
        Vector3 direction = target.position - transform.position ;
        Debug.DrawLine(transform.position, direction, Color.red);

        if (Physics.Raycast(transform.position, direction, out hitInfo, weaponMaxDis))
        {
            if (hitInfo.transform.CompareTag("Player"))
            {
                Debug.Log("Firing from haveLos");
                return true;
            }
        }
        return false;
    }

    void canAttack()
    {
        if(haveLos() && isInFront() )
        {
            Debug.Log("Firing from canAttack");
        }
    }
}
