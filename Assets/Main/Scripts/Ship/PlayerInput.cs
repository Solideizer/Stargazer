using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerInput : MonoBehaviour{

    public Light cockpitLight;    

    private void Start()
    {
        cockpitLight = GetComponentInChildren<Light>();
    }
    private void Update()
    {
        CockpitLightSwitch();

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

