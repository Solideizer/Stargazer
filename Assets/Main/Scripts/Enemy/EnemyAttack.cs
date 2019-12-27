using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyAttack : MonoBehaviour
{
    [SerializeField] Transform target;
    [SerializeField] float weaponMaxDis = 300f;
    [SerializeField] float enemyDamage = 20f;
    [SerializeField] float fireDelay = 4f;

    bool canFire;

    private void Start()
    {
        canFire = true;
    }

    private void Update()
    {
        isInFront();
        haveLos();
        canAttack();
    }

    bool isInFront()
    {
        //if not destroyed
        if(target != null)
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
        return false;
    }


    bool haveLos()
    {
        RaycastHit hitInfo;
        Vector3 direction = target.position - transform.position ;        

        if (Physics.Raycast(transform.position, direction, out hitInfo))
        {
            if (hitInfo.transform.CompareTag("Player"))
            {
                Debug.DrawLine(transform.position, direction, Color.red);                
                return true;
            }
        }
        return false;
    }

    void canAttack()
    {
        if(haveLos() && isInFront() && canFire )
        {
            Debug.Log("Firing from canAttack");
           
            Shoot();
            AudioManager.PlaySound("laser");
            canFire = false;
            Invoke("CanFire", fireDelay);

        }
    }

    public void Shoot()
    {
        Ray ray = new Ray(transform.position, transform.forward);
        RaycastHit hitInfo;

        //Debug.DrawLine(ray.origin, ray.origin + ray.direction * weaponMaxDis, Color.green);

        if (Physics.Raycast(ray, out hitInfo, weaponMaxDis))
        {
            

            EnemyHumanoid targetInfo = hitInfo.transform.GetComponent<EnemyHumanoid>();
            if (targetInfo.CompareTag("Player"))
            {
                Debug.DrawLine(ray.origin, hitInfo.point, Color.blue);
                print(hitInfo.collider.gameObject.name);
                print(hitInfo.distance);
                targetInfo.takeDamage(enemyDamage);
            }
        }
    }


    void CanFire()
    {
        canFire = true;
    }

}
