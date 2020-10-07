using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Weapons : MonoBehaviour{   

    [SerializeField] public float maxDistance = 400f;
    [SerializeField] public float damage = 20f;
    [SerializeField] float fireDelay = 2f;
    [SerializeField] float laserOffTime = 0.1f;
    LineRenderer laser;
    public GameObject hitExplosion;

    bool canFire;

    void Awake()
    {
        laser = GetComponent<LineRenderer>();
    }

    // Start is called before the first frame update
    void Start()
    {
        canFire = true;
        laser.enabled = false;
        
    }

    // Update is called once per frame
    void Update()
    {        
        if (canFire && Input.GetButtonDown("Fire1"))
        {
            Shoot();
            ActivateLasers();
            AudioManager.PlaySound("laser");            
            canFire = false;
            Invoke("CanFire", fireDelay);
            Invoke("DeactivateLasers", laserOffTime);

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
            Debug.DrawLine(ray.origin, hitInfo.point, Color.red);

            Asteroid targetInfo = hitInfo.transform.GetComponent<Asteroid>();         
            Instantiate(hitExplosion, hitInfo.point, Quaternion.identity, transform);
            targetInfo.TakeDamage(damage);

        }        
    }

    void CanFire()
    {
        laser.enabled = false;
        canFire = true;
    }

    void ActivateLasers()
    {
        laser.SetPosition(0, transform.position);        
        laser.SetPosition(1, transform.position + transform.forward * maxDistance);        
        laser.enabled = true;   
        
    }

    void DeactivateLasers()
    {
        laser.enabled = false;
    }


}
