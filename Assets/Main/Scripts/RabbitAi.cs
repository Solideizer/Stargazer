using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RabbitAi : MonoBehaviour
{
    private Animator anim;    
    [SerializeField] private float wanderTime;
    [SerializeField] private float movementSpeed = 5f;
    [SerializeField] private bool isDead = false;
    
    void Start()
    {
        anim = transform.GetComponent<Animator>();
    }
    
    void Update()
    {
        if (!isDead)
        {
            if(wanderTime > 0)
            {

                transform.Translate(Vector3.forward * movementSpeed * Time.deltaTime);
                anim.SetBool("isRunning", true);
                anim.SetBool("isIdling", false);
                wanderTime -= Time.deltaTime;
            }
            else
            {
                wanderTime = Random.Range(5.0f, 10.0f);
                wander();
            }
        }
    }
    void FixedUpdate()
    {
        RaycastHit hit;
        Vector3 fwd = transform.TransformDirection(Vector3.forward);
        
        if (Physics.Raycast(transform.position, fwd ,out hit, 2))
        {            
            Debug.DrawRay(transform.position, fwd * hit.distance, Color.yellow);
            wander();
        }else{
            Debug.DrawRay(transform.position, fwd * hit.distance, Color.green);
        }
            
    }

    void wander()
    {
        transform.eulerAngles = new Vector3(0, Random.Range(0, 360), 0);
        anim.SetBool("isRunning", false);
        anim.SetBool("isIdling", true);

    }
}
