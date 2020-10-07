using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WeaponManager : MonoBehaviour
{
    [SerializeField]
    private GameObject[] weapons;
    private Animator gunAnimator;
    private GameObject gun;
    private int current_Weapon_Index;

    // Use this for initialization    
    void Start()
    {
        gun =  GameObject.Find("Mark23");
        gunAnimator = gun.GetComponent<Animator>();

        current_Weapon_Index = 0;
        weapons[current_Weapon_Index].gameObject.SetActive(true);
    }

    // Update is called once per frame
    void Update()
    {

        if (Input.GetKeyDown(KeyCode.Alpha1))
        {            
            TurnOnSelectedWeapon(0); 
            gunAnimator.SetTrigger("draw");           
        }

        if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            TurnOnSelectedWeapon(1);
        }

    } // update

    void TurnOnSelectedWeapon(int weaponIndex)
    {

        if (current_Weapon_Index == weaponIndex)
            return;

        // turn of the current weapon
        weapons[current_Weapon_Index].gameObject.SetActive(false);

        // turn on the selected weapon
        weapons[weaponIndex].gameObject.SetActive(true);

        // store the current selected weapon index
        current_Weapon_Index = weaponIndex;

    }

    public GameObject GetCurrentSelectedWeapon()
    {
        return weapons[current_Weapon_Index];
    }

} // class
