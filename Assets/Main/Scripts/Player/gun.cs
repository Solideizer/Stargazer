using System.Collections;
using UnityEngine;

public class gun : MonoBehaviour
{
    [SerializeField] private float damage = 100f;
    [SerializeField] private float range = 50f;
    [SerializeField] private int maxAmmo = 12;
    private int currentAmmo;
    [SerializeField] private float reloadTime = 3.2f;

    [SerializeField] private float impactForce = 0.5f;
    [SerializeField] private float fireRate = 1f;

    private float nextTimeToFire = 0f;

    private Animator anim;
    public Camera fpsCam;

    //public ParticleSystem mf;
    public GameObject hitEffect;

    private void Start()
    {
        anim = GetComponent<Animator>();
        currentAmmo = maxAmmo;
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.R) && currentAmmo != maxAmmo)
        {
            StartCoroutine(Reload());
        }

        if (Input.GetButton("Fire1") && Time.time >= nextTimeToFire && currentAmmo > 0)
        {
            anim.SetBool("shoot", true);
            Shoot();
            nextTimeToFire = Time.time + 1f / fireRate;
        }
        else
        {
            anim.SetBool("shoot", false);
        }
    }

    private void Shoot()
    {
        AudioManager.PlaySound("gunshoot");
        currentAmmo--;
        //mf.Play();

        RaycastHit hit;
        bool isHit = Physics.Raycast(fpsCam.transform.position, fpsCam.transform.forward, out hit, range);

        if (isHit)
        {
            EnemyHumanoid target = hit.transform.GetComponent<EnemyHumanoid>();
            if (target != null)
            {
                EnemyController.isHit = true;
                target.takeDamage(damage);
            }
            if (hit.rigidbody != null)
            {
                hit.rigidbody.AddForce(-hit.normal * impactForce);
            }
            GameObject impactGo = Instantiate(hitEffect, hit.point, Quaternion.LookRotation(hit.normal));
            Destroy(impactGo, 2f);
        }
    }//void shoot

    private IEnumerator Reload()
    {
        AudioManager.PlaySound("reload");
        anim.SetTrigger("reload");
        yield return new WaitForSeconds(reloadTime);
        currentAmmo = maxAmmo;
    }
}