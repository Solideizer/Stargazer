using System.Collections;
using UnityEngine;

public class Gun : MonoBehaviour
{
    #region Variable Declarations
    [SerializeField] private float damage = 100f;
    [SerializeField] private float range = 50f;
    [SerializeField] private int maxAmmo = 12;
    [SerializeField] private float reloadTime = 3.2f;
    [SerializeField] private float impactForce = 0.5f;
    [SerializeField] private float fireRate = 1f;

    public Camera fpsCam;
    public GameObject hitEffect;
    //public ParticleSystem mf;
    
    private float _nextTimeToFire = 0f;
    private int _currentAmmo;
    private Animator _anim;
    
    #endregion
    private void Start()
    {
        _anim = GetComponent<Animator>();
        _currentAmmo = maxAmmo;
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.R) && _currentAmmo != maxAmmo)
        {
            StartCoroutine(Reload());
        }

        if (Input.GetButton("Fire1") && Time.time >= _nextTimeToFire && _currentAmmo > 0)
        {
            _anim.SetBool("shoot", true);
            Shoot();
            _nextTimeToFire = Time.time + 1f / fireRate;
        }
        else
        {
            _anim.SetBool("shoot", false);
        }
    }

    private void Shoot()
    {
        AudioManager.PlaySound("gunshoot");
        _currentAmmo--;
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
        _anim.SetTrigger("reload");
        yield return new WaitForSeconds(reloadTime);
        _currentAmmo = maxAmmo;
    }
}