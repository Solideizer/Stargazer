using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyMovement : MonoBehaviour
{
    [SerializeField] Transform target;
    [SerializeField] float rotationalDamp = 1.25f;
    [SerializeField] float movementSpeed = 25f;

    // Update is called once per frame
    void Update()
    {
        Turn();
        Move();
    }

    private void Turn()
    {
        Vector3 pos = target.position - transform.position;
        Quaternion rotation = Quaternion.LookRotation(pos);
        transform.rotation = Quaternion.Slerp(transform.rotation, rotation, Time.deltaTime * rotationalDamp);
    }

    private void Move()
    {
        transform.position += transform.forward * Time.deltaTime * movementSpeed;
    }
}
