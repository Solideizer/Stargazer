using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterController : MonoBehaviour
{
    [SerializeField] private float speed = 10.0f;
    [SerializeField] private float thrustForce = 1f;

    private float translation;
    private float straffe;    
    private Rigidbody rb;
    
    void Start()
    {
        Cursor.lockState = CursorLockMode.None;
        rb = GetComponent<Rigidbody>();
    }

    void Update()
    {        
        translation = Input.GetAxis("Vertical") * speed * Time.deltaTime;
        straffe = Input.GetAxis("Horizontal") * speed * Time.deltaTime;
        transform.Translate(straffe, 0, translation);
        if (Input.GetKeyDown("escape"))
        {
            
            Cursor.lockState = CursorLockMode.Locked;
        }       
            
    }

    void FixedUpdate()
    {
        if (Input.GetKey(KeyCode.R))
        {
            rb.AddForce(0, thrustForce * Time.deltaTime, 0 , ForceMode.Impulse);            
        }
        else if (Input.GetKey(KeyCode.F))
        {
            rb.AddForce(0, -thrustForce * Time.deltaTime, 0 , ForceMode.Impulse);
        }
    }

   



}