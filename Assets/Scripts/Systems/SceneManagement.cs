using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneManagement : MonoBehaviour
{
    public GameObject fpPlayer;
    public GameObject playerShip;
    public Camera fpCam;
    public Camera cockpitCam;
    string activeScene;

    public GameObject cockpitRef;
    Vector3 offset = new Vector3(0, 0.3f, 0);

    private void Start()
    {
        ManageScene();
    }

    void ManageScene()
    {
        activeScene = SceneManager.GetActiveScene().name;

        switch (activeScene)
        {
            
            default:
                cockpitCam.GetComponent<Camera>().enabled = true;
                fpCam.GetComponent<Camera>().enabled = false;
                playerShip.GetComponent<ShipInput>().enabled = true;
                playerShip.GetComponentInChildren<Weapons>().enabled = true;
                fpPlayer.GetComponent<CharacterController>().enabled = false;
                fpPlayer.transform.position = cockpitRef.transform.position + offset;
                break;
        }
    }



}