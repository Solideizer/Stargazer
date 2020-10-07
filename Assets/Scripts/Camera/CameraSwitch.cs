using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraSwitch : MonoBehaviour
{
    #region Variable Declerations
    
    public GameObject cameraOne;
    public GameObject cameraTwo;

    private AudioListener _camOneAudioListener;
    private AudioListener _camTwoAudioListener;

    #endregion
   
    void Awake()
    {
        //Get Camera Listeners
        _camOneAudioListener = cameraOne.GetComponent<AudioListener>();
        _camTwoAudioListener = cameraTwo.GetComponent<AudioListener>();

        //Camera Position Set
        CameraPositionChange(PlayerPrefs.GetInt("CameraPosition"));
    }

    void Update()
    {
        SwitchCamera();
    }

    void SwitchCamera()
    {
        if (Input.GetKeyDown(KeyCode.C) || Input.GetKeyDown(KeyCode.LeftAlt) || Input.GetKeyDown(KeyCode.RightAlt))
        {
            CameraChangeCounter();
        }
    }

    
    void CameraChangeCounter()
    {
        int cameraPositionCounter = PlayerPrefs.GetInt("CameraPosition");
        cameraPositionCounter++;
        CameraPositionChange(cameraPositionCounter);
    }

    //Camera change Logic
    void CameraPositionChange(int camPosition)
    {
        if (camPosition > 1)
        {
            camPosition = 0;
        }

        //Set camera position database
        PlayerPrefs.SetInt("CameraPosition", camPosition);

        //Set camera position 1
        if (camPosition == 0)
        {
            cameraOne.SetActive(true);
            _camOneAudioListener.enabled = true;

            _camTwoAudioListener.enabled = false;
            cameraTwo.SetActive(false);
        }

        //Set camera position 2
        if (camPosition == 1)
        {
            cameraTwo.SetActive(true);
            _camTwoAudioListener.enabled = true;

            _camOneAudioListener.enabled = false;
            cameraOne.SetActive(false);
        }

    }
}

