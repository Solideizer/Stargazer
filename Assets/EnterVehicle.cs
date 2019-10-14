using UnityEngine;
using System.Collections;

public class EnterVehicle : MonoBehaviour
{
    public GameObject fpPlayer;
    public GameObject playerShip;
    public GameObject cockpitRef;
    Vector3 exitPoint;
    [SerializeField] Vector3 exitOffset = new Vector3(-20, 0, 0);
    Vector3 enterPoint;
    
    public Camera fpCam;
    public Camera cockpitCam;

    bool inVehicle = false;
    bool isShipActive = false;

   
        //if (Input.GetKey(KeyCode.U)) {
        //    Debug.Log("U is working");
        //}

        //if (inVehicle == true && Input.GetKey(KeyCode.Y))
        //{
        //    Debug.Log("this is exiting part");
        //    playerShip.GetComponent<ShipInput>().enabled = false;


        //    exitPoint = playerShip.transform.position += exitOffset;
        //    fpPlayer.transform.position = exitPoint;

        //    fpPlayer.SetActive(true);
        //    fpPlayer.GetComponent<CharacterController>().enabled = true;
        //    fpPlayer.transform.parent = null;


        //    cockpitCam.gameObject.SetActive(false);
        //    fpCam.gameObject.SetActive(true);

        //    inVehicle = false;
        //}
        //}
    

    void OnTriggerStay(Collider other)
    {
        //TODO : Change 'Player' tag to 'PlayerShip'
        //ENTERING
        if (other.gameObject.tag == "Player" && inVehicle == false)
        {
            if (Input.GetKey(KeyCode.U))
            {
                Debug.Log("this is ENTERING part");
                
                fpPlayer.GetComponent<CharacterController>().enabled = false;
                enterPoint = cockpitRef.transform.position;
                fpPlayer.transform.position = enterPoint;


                cockpitCam.GetComponent<Camera>().enabled = true;
                fpCam.GetComponent<Camera>().enabled = false;
                //fpCam.gameObject.SetActive(false);
                //cockpitCam.gameObject.SetActive(true);
               


                fpPlayer.transform.parent = cockpitRef.gameObject.transform;
                fpPlayer.SetActive(false);
                

                playerShip.GetComponent<ShipInput>().enabled = true;
                playerShip.GetComponentInChildren<Weapons>().enabled = true;
                
                Debug.Log(inVehicle);
                inVehicle = true;
                Debug.Log("finished ENTERING");
                Debug.Log(inVehicle);                

            }

        }
       // Debug.Log("on stay");

        if (Input.GetKey(KeyCode.O))
        {

            Debug.Log("this is exiting part");
            fpPlayer.SetActive(true);

            cockpitCam.GetComponent<Camera>().enabled = false;
            fpCam.GetComponent<Camera>().enabled = true;
            //cockpitCam.gameObject.SetActive(false);
            //fpCam.gameObject.SetActive(true);

            playerShip.GetComponent<ShipInput>().enabled = false;
            playerShip.GetComponentInChildren<Weapons>().enabled = false;
            Debug.Log("shipInput disabled");
            

            exitPoint = playerShip.transform.position += exitOffset;
            fpPlayer.transform.position = exitPoint;
            //fpPlayer.GetComponent<Rigidbody>().isKinematic = false;

            fpPlayer.GetComponent<CharacterController>().enabled = true;     

            
            fpPlayer.transform.parent = null;


            

            inVehicle = false;
        }

    }
   

}
        
        //EXITING
        //if (inVehicle == true && Input.GetKey(KeyCode.I))
        //{
        //    Debug.Log("this is exiting part");
        //    playerShip.GetComponent<ShipInput>().enabled = false;                       


        //    exitPoint = playerShip.transform.position += exitOffset;   
        //    fpPlayer.transform.position = exitPoint;

        //    fpPlayer.SetActive(true);
        //    fpPlayer.GetComponent<CharacterController>().enabled = true;
        //    fpPlayer.transform.parent = null;


        //    cockpitCam.gameObject.SetActive(false);
        //    fpCam.gameObject.SetActive(true);

        //    inVehicle = false;
        //}
 