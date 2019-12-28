using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{

    private CharacterController character_Controller;
    private PlayerMovement playerMovement;
    private Vector3 move_Direction;

    [SerializeField] private Transform fpsCam;
    private float stand_Height = 4f;
    private float crouch_Height = 2.35f;
    private bool is_Crouching;

    private float speed = 5f;
    private float crouchSpeed = 2f;
    private float sprintSpeed = 10f;
    private float gravity = 10f;

    private float jump_Force = 5f;
    [SerializeField] private float thrustForce = 200f;
    private float vertical_Velocity;
    private Rigidbody rb;

    void Awake()
    {
        playerMovement = GetComponent<PlayerMovement>();
        character_Controller = GetComponent<CharacterController>();
        rb = GetComponent<Rigidbody>();
    }

    void Update()
    {
        MoveThePlayer();
        Sprint();
        Thruster();
        Crouch();
    }
    void Crouch()
    {
        if (Input.GetKeyDown(KeyCode.LeftControl))
        {
            if (is_Crouching)
            {

                fpsCam.localPosition = new Vector3(0f, stand_Height, 0f);
                playerMovement.speed = speed;
                is_Crouching = false;
            }
            else
            {
                // if we are not crouching - crouch

                fpsCam.localPosition = new Vector3(0f, crouch_Height, 0f);
                playerMovement.speed = crouchSpeed;
                is_Crouching = true;
            }
        }
    }

    void MoveThePlayer()
    {
        
        move_Direction = new Vector3(Input.GetAxis("Horizontal"), 0f,
                                     Input.GetAxis("Vertical"));

        move_Direction = transform.TransformDirection(move_Direction);
        move_Direction *= speed * Time.deltaTime;

        ApplyGravity();

        character_Controller.Move(move_Direction);


    } // move player

    void Sprint()
    {
        if (Input.GetKeyDown(KeyCode.LeftShift) && !is_Crouching)
        {

            playerMovement.speed = sprintSpeed;
        }
        else if(Input.GetKeyUp(KeyCode.LeftShift) && !is_Crouching)
        {

            playerMovement.speed = speed;
        }

    }

    void Thruster()
    {
        if (Input.GetKey(KeyCode.R))
        {
            rb.AddForce(0, thrustForce * Time.deltaTime, 0, ForceMode.Impulse);
        }
        else if (Input.GetKey(KeyCode.F))
        {
            rb.AddForce(0, -thrustForce * Time.deltaTime, 0, ForceMode.Impulse);
        }
    }

    void ApplyGravity()
    {

        vertical_Velocity -= gravity * Time.deltaTime;

        // jump
        PlayerJump();

        move_Direction.y = vertical_Velocity * Time.deltaTime;

    } // apply gravity

    void PlayerJump()
    {

        if (character_Controller.isGrounded && Input.GetKeyDown(KeyCode.Space))
        {
            vertical_Velocity = jump_Force;
        }

    }

} // class