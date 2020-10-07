using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerInput : MonoBehaviour{

    public Light cockpitLight;
    public GameObject fpPlayer;
    public GameObject cockpitRef;
    Weapons[] weaponsArray;
    Vector3 offset = new Vector3(0, 0.3f, 0);


   
    public GameObject playerShip;    
    Vector3 exitPoint;
    [SerializeField] Vector3 exitOffset = new Vector3(-30, 10, 0);
    

    public Camera fpCam;
    public Camera cockpitCam;

    private void Start()
    {
        cockpitLight = GetComponentInChildren<Light>();
    }
    private void Update()
    {
        CockpitLightSwitch();
        ExitVehicle();

    }

    void ExitVehicle()
    {
        if (Input.GetKeyDown(KeyCode.I))
        {
            //fpPlayer.transform.parent = cockpitRef.transform;
            //fpPlayer.transform.position = cockpitRef.transform.position + offset;
            //Instantiate(fpPlayer, cockpitRef.transform.position + offset, Quaternion.identity);
            //fpPlayer.SetActive(true);
            Debug.Log("this is exiting part");
            //fpPlayer.SetActive(true);

            cockpitCam.GetComponent<Camera>().enabled = false;
            fpCam.GetComponent<Camera>().enabled = true;            
            fpCam.gameObject.SetActive(true);

            playerShip.GetComponent<ShipInput>().enabled = false;
            
            weaponsArray = playerShip.GetComponentsInChildren<Weapons>();
            for (int i = 0; i < weaponsArray.Length; i++)
            {
                weaponsArray[i].enabled = false;
            }

            Debug.Log("shipInput disabled");

            exitPoint = cockpitRef.transform.position + exitOffset;
            fpPlayer.transform.position = exitPoint;
            Debug.Log("fpplayer exited");
            
            fpPlayer.GetComponent<CharacterController>().enabled = true;
            fpCam.GetComponent<MouseLook>().enabled = true;

            fpPlayer.transform.parent = null;
            fpPlayer.SetActive(true);
            AudioManager.PlaySound("cockpitExit");
            Debug.Log("exiting finished");
            
            
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

