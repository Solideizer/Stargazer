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
    private float vertical_Velocity;  

    private PlayerFootsteps playerFootsteps;
    private float sprintVolume = 1f;
    private float crouchVolume = 0.1f;
    private float walkVolumeMin = 0.2f, walkVolumeMax = 0.6f;
    private float walkStepDistance = 0.4f;
    private float sprintStepDistance = 0.25f;
    private float crouchStepDistance = 0.5f;


    void Awake()
    {
        playerMovement = GetComponent<PlayerMovement>();
        character_Controller = GetComponentInParent<CharacterController>();        
        playerFootsteps = GetComponentInChildren<PlayerFootsteps>();
    }

    private void Start()
    {
        playerFootsteps.volume_Min = walkVolumeMin;
        playerFootsteps.volume_Max = walkVolumeMax;
        playerFootsteps.step_Distance = walkStepDistance;
    }

    void Update()
    {
       MoveThePlayer();
       Sprint();       
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

               playerFootsteps.step_Distance = walkStepDistance;
               playerFootsteps.volume_Min = walkVolumeMin;
               playerFootsteps.volume_Max = walkVolumeMax;

            }
            else
            {
                    // if we are not crouching - crouch

                fpsCam.localPosition = new Vector3(0f, crouch_Height, 0f);
                playerMovement.speed = crouchSpeed;
                is_Crouching = true;

                playerFootsteps.step_Distance = crouchStepDistance;
                playerFootsteps.volume_Min = crouchVolume;
                playerFootsteps.volume_Max = crouchVolume;
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

    }// move player

        void Sprint()
        {
            if (Input.GetKeyDown(KeyCode.LeftShift) && !is_Crouching)
            {

                playerMovement.speed = sprintSpeed;

                playerFootsteps.step_Distance = sprintStepDistance;
                playerFootsteps.volume_Min = sprintVolume;
                playerFootsteps.volume_Max = sprintVolume;
                
            }

            if (Input.GetKeyUp(KeyCode.LeftShift) && !is_Crouching)
            {

                playerMovement.speed = speed;

                playerFootsteps.step_Distance = walkStepDistance;
                playerFootsteps.volume_Min = walkVolumeMin;
                playerFootsteps.volume_Max = walkVolumeMax;

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

}
