using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioSelect : MonoBehaviour
{
    void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "SpaceStation")
        {
            AudioManager.PlaySound("scaryambiance");
        }
    }
}
