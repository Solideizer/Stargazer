using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterController : MonoBehaviour
{

    public float speed = 10.0f;
    private float translation;
    private float straffe;
    public float thrustForce = 1f;

    // Use this for initialization
    void Start()
    {
        Cursor.lockState = CursorLockMode.None;
    }

    // Update is called once per frame
    void Update()
    {
        // Input.GetAxis() is used to get the user's input
        // You can furthor set it on Unity. (Edit, Project Settings, Input)
        translation = Input.GetAxis("Vertical") * speed * Time.deltaTime;
        straffe = Input.GetAxis("Horizontal") * speed * Time.deltaTime;
        transform.Translate(straffe, 0, translation);
        if (Input.GetKeyDown("escape"))
        {
            
            Cursor.lockState = CursorLockMode.Locked;
        }
        thrusters();
            
    }

    void thrusters()
    {
        if (Input.GetKey(KeyCode.R))
        {
            transform.Translate(Vector3.up * Time.deltaTime * thrustForce, Space.World);
        }
        else if (Input.GetKey(KeyCode.F))
        {
            transform.Translate(Vector3.down * Time.deltaTime * thrustForce, Space.World);
        }
    }



}