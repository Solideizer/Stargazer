using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerInput : MonoBehaviour{

    public Light cockpitLight;
    public GameObject fpPlayer;
    public GameObject cockpitRef;

    private void Start()
    {
        cockpitLight = GetComponentInChildren<Light>();
    }
    private void Update()
    {
        CockpitLightSwitch();
        CreatePlayer();

    }

    void CreatePlayer()
    {
        if (Input.GetKeyDown(KeyCode.I))
        {
            Instantiate(fpPlayer, cockpitRef.transform.position, Quaternion.identity);
            fpPlayer.SetActive(true);
        }
    }

    void CockpitLightSwitch()
    {
        if (Input.GetKeyDown(KeyCode.L))

            if (cockpitLight.enabled == true)
            {
                cockpitLight.enabled = false;
            }
            else
            {
                cockpitLight.enabled = true;
                AudioManager.PlaySound("lightSwitch");

            }

    }
    
    }

