using UnityEngine;

public class EnemyMovement : MonoBehaviour
{
    [SerializeField] private Transform target;
    [SerializeField] private float rotationalDamp = 1.25f;
    [SerializeField] private float movementSpeed = 25f;

    // Update is called once per frame
    private void Update()
    {
        Turn();
        Move();
    }

    private void Turn()
    {
        //if not destroyed
        if (target != null)
        {
            Vector3 pos = target.position - transform.position;
            Quaternion rotation = Quaternion.LookRotation(pos);
            transform.rotation = Quaternion.Slerp(transform.rotation, rotation, Time.deltaTime * rotationalDamp);
        }
    }

    private void Move()
    {
        transform.position += transform.forward * Time.deltaTime * movementSpeed;
    }
}