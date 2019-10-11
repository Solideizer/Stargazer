using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Weapons : MonoBehaviour{   

    [SerializeField] private float maxDistance = 100f;
    [SerializeField] public float damage = 20f;
    [SerializeField] float fireDelay = 2f;
    
    bool canFire;

    // Start is called before the first frame update
    void Start()
    {
        canFire = true;
    }

    // Update is called once per frame
    void Update()
    {        
        if (canFire && Input.GetButtonDown("Fire1"))
        {
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

        Debug.DrawLine(ray.origin, ray.origin + ray.direction * maxDistance, Color.green);

        if (Physics.Raycast(ray, out hitInfo, maxDistance))
        {
            print(hitInfo.collider.gameObject.name);
            print(hitInfo.distance);
            Debug.DrawLine(ray.origin, hitInfo.point, Color.red);

            Enemy targetInfo = hitInfo.transform.GetComponent<Enemy>();
            if(targetInfo.tag == "Enemy")
            {
                targetInfo.TakeDamage(damage);
            }            
        }        
    }


    void CanFire()
    {
        canFire = true;
    }


}
