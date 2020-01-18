using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class gun : MonoBehaviour
{

    public float damage = 100f;
    public float range = 50f;
    public float impactForce = 0.5f;
    public float fireRate = 0.5f;
    private float nextTimeToFire = 0f;

    public Camera fpsCam;
    //public ParticleSystem mf;
    public GameObject hitEffect;

    // Update is called once per frame
    void Update()
    {
        if (Input.GetButton("Fire1") && Time.time >= nextTimeToFire)
        {
            Shoot();
            nextTimeToFire = Time.time + 1f / fireRate;                     
        }
    }
    void Shoot()
    {
        AudioManager.PlaySound("gunshoot");
        //mf.Play();
        RaycastHit hit;
        bool isHit = Physics.Raycast(fpsCam.transform.position, fpsCam.transform.forward, out hit, range);

        if (isHit)
        {
            EnemyHumanoid target = hit.transform.GetComponent<EnemyHumanoid>();
            if (target != null)
            {
                target.takeDamage(damage);
            }
            if (hit.rigidbody != null)
            {
                hit.rigidbody.AddForce(-hit.normal * impactForce);
            }
            GameObject impactGo = Instantiate(hitEffect, hit.point, Quaternion.LookRotation(hit.normal));
            Destroy(impactGo, 2f);

        }
    }
}


