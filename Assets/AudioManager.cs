using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioClip lightSwitchSound;
    public static AudioClip thrusterAccSound;
    public static AudioClip thrusterDecSound;
    public static AudioSource audioSrc;
    // Start is called before the first frame update
    void Start()
    {
        lightSwitchSound = Resources.Load<AudioClip>("lightSwitch");
        thrusterAccSound = Resources.Load<AudioClip>("thrusterAcc");
        thrusterDecSound = Resources.Load<AudioClip>("thrusterDec");
        audioSrc = GetComponent<AudioSource>();
    }     


    public static void PlaySound(string clip)
    {
        switch (clip)
        {
            case "lightSwitch":                
                audioSrc.PlayOneShot(lightSwitchSound);
                break;
            case "thrusterAcc":
                audioSrc.PlayOneShot(thrusterAccSound);
                break;
            case "thrusterDec":
                audioSrc.PlayOneShot(thrusterDecSound);
                break;
        }
    }
}
