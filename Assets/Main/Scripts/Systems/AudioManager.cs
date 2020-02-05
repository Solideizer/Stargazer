﻿using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioClip lightSwitchSound;
    public static AudioClip thrusterAccSound;
    public static AudioClip thrusterDecSound;
    public static AudioClip explosionSound;
    public static AudioClip cockpitExitSound;
    public static AudioClip scaryAmbianceSound;
    public static AudioClip miningLaserSound;
    public static AudioClip thrusterSound;
    public static AudioClip gunShootSound;
    public static AudioClip reloadSound;
    public static AudioClip[] laserSounds = new AudioClip[4];
    public static AudioSource audioSrc;

    // Start is called before the first frame update
    private void Start()
    {
        lightSwitchSound = Resources.Load<AudioClip>("lightSwitch");
        thrusterAccSound = Resources.Load<AudioClip>("thrusterAcc");
        thrusterDecSound = Resources.Load<AudioClip>("thrusterDec");
        explosionSound = Resources.Load<AudioClip>("explosion");
        laserSounds[0] = Resources.Load<AudioClip>("laser0");
        laserSounds[1] = Resources.Load<AudioClip>("laser1");
        laserSounds[2] = Resources.Load<AudioClip>("laser2");
        laserSounds[3] = Resources.Load<AudioClip>("laser3");
        cockpitExitSound = Resources.Load<AudioClip>("cockpitExit");
        scaryAmbianceSound = Resources.Load<AudioClip>("scaryambiance");
        miningLaserSound = Resources.Load<AudioClip>("mininglaser");
        gunShootSound = Resources.Load<AudioClip>("gunshoot");
        reloadSound = Resources.Load<AudioClip>("reload");
        //thrusterSound = Resources.Load<AudioClip>("thrusterSound");

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

            case "explosion":
                audioSrc.PlayOneShot(explosionSound);
                break;

            case "laser":
                int randomInd = Random.Range(0, laserSounds.Length);
                audioSrc.PlayOneShot(laserSounds[randomInd]);
                break;

            case "cockpitExit":
                audioSrc.PlayOneShot(cockpitExitSound);
                break;

            case "scaryambiance":
                audioSrc.PlayOneShot(scaryAmbianceSound);
                break;

            case "mininglaser":
                audioSrc.PlayOneShot(miningLaserSound);
                break;

            case "gunshoot":
                audioSrc.PlayOneShot(gunShootSound, 1);
                break;

            case "reload":
                audioSrc.PlayOneShot(reloadSound, 1);
                break;
                //case "thruster":
                //    audioSrc.PlayOneShot(thrusterSound);
                //    break;
        }
    }
}