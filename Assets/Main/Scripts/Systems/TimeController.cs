using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimeController : MonoBehaviour
{

    [SerializeField] private Light sun;
    [SerializeField] private float dayDuration = 120f;

    [Range(0, 1)] [SerializeField] private float currentTimeOfDay = 0f;
    private float timeMultiplier = 1f;
    private float sunInitialIntensity;
    // Start is called before the first frame update
    void Start()
    {
        sunInitialIntensity = sun.intensity;
    }

    // Update is called once per frame
    void Update()
    {
        UpdateSun();
        currentTimeOfDay += (Time.deltaTime / dayDuration) * timeMultiplier;
        if (currentTimeOfDay >= 1)
        {
            currentTimeOfDay = 0;
        }
    }

    void UpdateSun()
    {
        sun.transform.localRotation = Quaternion.Euler((currentTimeOfDay * 360f) - 90, 170, 0);
        float intensityMultiplier = 1f;
        if (currentTimeOfDay <= 0.23f || currentTimeOfDay >= 0.75f)
        {
            intensityMultiplier = 0f;
        }
        else if (currentTimeOfDay <= 0.25)
        {
            intensityMultiplier = Mathf.Clamp01((currentTimeOfDay - 0.23f) * (1 / 0.02f));
        }
        else if (currentTimeOfDay <= 0.75)
        {
            intensityMultiplier = Mathf.Clamp01(1 - ((currentTimeOfDay - 0.73f) * (1 / 0.02f)));
        }
    }


}
