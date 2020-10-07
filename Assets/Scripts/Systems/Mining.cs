using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Mining : MonoBehaviour
{
    [SerializeField] public float maxDistance = 400f;
    [SerializeField] public float damage = 5f;
    [SerializeField] float fireDelay = 2f;
    [SerializeField] GameObject MiningRef;

    LineRenderer laser;
    public GameObject hitEffects;   

    void Awake()
    {
        laser = GetComponent<LineRenderer>();
    }

    // Start is called before the first frame update
    void Start()
    {
        laser.enabled = false;
    }

    // Update is called once per frame
    void Update()
    {//Input.GetMouseButton(2)
        if (Input.GetMouseButton(1))
        {
            Shoot();
            ActivateLasers();
            AudioManager.PlaySound("mininglaser");
        }
        else
        {
            DeactivateLasers();
        }
    }

    public void Shoot()
    {
        Ray ray = new Ray(transform.position, transform.forward);
        RaycastHit hitInfo;

        Debug.DrawLine(ray.origin, ray.origin + ray.direction * maxDistance, Color.green);

        if (Physics.Raycast(ray, out hitInfo, maxDistance))
        {
            print(hitInfo.collider.gameObject.name);
            print(hitInfo.distance);
            //Debug.DrawLine(ray.origin, hitInfo.point, Color.red);

            Asteroid targetInfo = hitInfo.transform.GetComponent<Asteroid>();
            Instantiate(hitEffects, hitInfo.point, Quaternion.identity, transform);
            targetInfo.TakeDamage(damage);

        }
    }
    

    void ActivateLasers()
    {
        laser.SetPosition(0, MiningRef.transform.position);
        laser.SetPosition(1, MiningRef.transform.position + transform.forward * maxDistance);
        laser.enabled = true;

    }

    void DeactivateLasers()
    {
        laser.enabled = false;
    }


}


