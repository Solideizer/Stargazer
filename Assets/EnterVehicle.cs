using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class EnterVehicle : MonoBehaviour
{
    public GameObject fpPlayer;
    public GameObject playerShip;
    public GameObject cockpitRef;
    Vector3 exitPoint;
    [SerializeField] Vector3 exitOffset = new Vector3(-10, 3, 0);
    Vector3 enterPoint;
    
    public Camera fpCam;
    public Camera cockpitCam;    
    
    void OnTriggerStay(Collider other)
    {
        //TODO : Change 'Player' tag to 'PlayerShip'
        //ENTERING
        if (other.gameObject.tag == "Player" )
        {
            if (Input.GetKey(KeyCode.U))
            {
                Debug.Log("this is ENTERING part");
                
                fpPlayer.GetComponent<CharacterController>().enabled = false;

                enterPoint = cockpitRef.transform.position;
                fpPlayer.transform.position = enterPoint;

                cockpitCam.GetComponent<Camera>().enabled = true;
                fpCam.GetComponent<Camera>().enabled = false;
                fpCam.GetComponent<MouseCamLook>().enabled = false;    


                fpPlayer.transform.parent = cockpitRef.gameObject.transform;
                fpPlayer.SetActive(false);                

                playerShip.GetComponent<ShipInput>().enabled = true;
                playerShip.GetComponentInChildren<Weapons>().enabled = true;              
                
                
                Debug.Log("finished ENTERING");                            

            }
        }        
    }  

}        
       