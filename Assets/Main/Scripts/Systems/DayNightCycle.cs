using System.Collections;
using UnityEngine;

public class DayNightCycle : MonoBehaviour
{
    public DayPhases _dayPhases;

    private Transform _sunPivotPoint;
    private int _centreOfGameWorld = 500;

    public int _days;
    public int _hours;
    public int _minutes;
    public int _seconds;
    public float _counter;

    public int _dawnStartTime = 6;
    public int _dayStartTime = 8;
    public int _duskStartTime = 18;
    public int _nightStartTime = 20;

    public float _sunDimTime = 0.01f;               //speed at which sun dims
    public float _dawnSunIntensity = 0.5f;
    public float _daySunIntensity = 1f;
    public float _duskSunIntensity = 0.25f;
    public float _nightSunIntensity = 0f;

    public float _ambientDimTime = 0.01f;         //speed at which ambient light is adjusted
    public float _dawnAmbientIntensity = 0.5f;
    public float _dayAmbientIntensity = 1f;
    public float _duskAmbientIntensity = 0.25f;
    public float _nightAmbientIntensity = 0f;

    public float _dawnSkyboxBlendFactor = 0.5f;
    public float _daySkyboxBlendFactor = 1f;
    public float _duskSkyboxBlendFactor = 0.25f;
    public float _nightSkyboxBlendFactor = 0f;

    public float _skyboxBlendFactor;
    public float _skyboxBlendSpeed = 0.01f;

    public int _guiWidth = 100;
    public int _guiHeight = 20;

    public int TimeScale = 100;
    private float _RotationValue;
    private float _degreesSun = 360f;
    private int _secondsInaDay = 86400;

    public enum DayPhases
    {
        Dawn,
        Day,
        Dusk,
        Night
    }

    private void Awake()
    {
        _dayPhases = DayPhases.Night;
        RenderSettings.ambientIntensity = _nightAmbientIntensity;
        GetComponent<Light>().intensity = _nightSunIntensity;

        transform.position = new Vector3((_centreOfGameWorld * 2), 0, _centreOfGameWorld);

        transform.localEulerAngles = new Vector3(0, -90, 0);
    }

    // Start is called before the first frame update
    private void Start()
    {
        StartCoroutine("TimeOfDayFiniteStateMachine");

        _hours = 5;
        _minutes = 59;
        _counter = 59;

        _days = 1;

        GameObject _sunPivotGO = GameObject.FindGameObjectWithTag("SunPivot");

        _sunPivotPoint = _sunPivotGO.transform;

        _sunPivotPoint.transform.position = new Vector3(_centreOfGameWorld, 0, _centreOfGameWorld);
    }

    // Update is called once per frame
    private void Update()
    {
        SecondsCounter();
        UpdateSkybox();
        SunRotationManager();
    }

    private IEnumerator TimeOfDayFiniteStateMachine()
    {
        while (true)
        {
            switch (_dayPhases)
            {
                case DayPhases.Dawn:
                    Dawn();
                    break;

                case DayPhases.Day:
                    Day();
                    break;

                case DayPhases.Dusk:
                    Dusk();
                    break;

                case DayPhases.Night:
                    Night();
                    break;
            }
            yield return null;
        }
    }

    private void SecondsCounter()
    {
        if (_counter == 60)
        {
            _counter = 0;
        }
        _counter += TimeScale * Time.deltaTime;

        _seconds = (int)_counter;

        if (_counter < 60) { return; }
        if (_counter > 60) { _counter = 60; }    //fail safe stuff

        if (_counter == 60)
        {
            MinutesCounter();
        }
    }

    private void MinutesCounter()
    {
        _minutes++;

        if (_minutes == 60)
        {
            HoursCounter();
            _minutes = 0;
        }
    }

    private void HoursCounter()
    {
        _hours++;

        if (_hours == 24)
        {
            DayCounter();
            _hours = 0;
        }
    }

    private void DayCounter()
    {
        _days++;
    }

    private void Dawn()
    {
        //directional light intensity adjustments
        if (GetComponent<Light>().intensity < _dawnSunIntensity)
        {
            GetComponent<Light>().intensity += _sunDimTime * Time.deltaTime;
        }
        if (GetComponent<Light>().intensity > _dawnSunIntensity)
        {
            GetComponent<Light>().intensity = _dawnSunIntensity;
        }

        //ambient intensity adjustments
        if (RenderSettings.ambientIntensity < _dawnAmbientIntensity)
        {
            RenderSettings.ambientIntensity += _ambientDimTime * Time.deltaTime * TimeScale;
        }
        if (RenderSettings.ambientIntensity > _dawnAmbientIntensity)
        {
            RenderSettings.ambientIntensity = _dawnAmbientIntensity;
        }

        if (_hours == _dayStartTime && _hours < _duskStartTime)      //if hours equals start time AND hours is still less than dusk start time
        {
            _dayPhases = DayPhases.Day;
        }
    }

    private void Day()
    {
        //directional light intensity adjustments
        if (GetComponent<Light>().intensity < _daySunIntensity)
        {
            GetComponent<Light>().intensity += _sunDimTime * Time.deltaTime;
        }
        if (GetComponent<Light>().intensity > _daySunIntensity)
        {
            GetComponent<Light>().intensity = _daySunIntensity;
        }

        //ambient intensity adjustments
        if (RenderSettings.ambientIntensity < _dayAmbientIntensity)
        {
            RenderSettings.ambientIntensity += _ambientDimTime * Time.deltaTime * TimeScale;
        }
        if (RenderSettings.ambientIntensity > _dayAmbientIntensity)
        {
            RenderSettings.ambientIntensity = _dayAmbientIntensity;
        }

        if (_hours == _duskStartTime && _hours < _nightStartTime)
        {
            _dayPhases = DayPhases.Dusk;
        }
    }

    private void Dusk()
    {
        //directional light intensity adjustments
        if (GetComponent<Light>().intensity > _duskSunIntensity)
        {
            GetComponent<Light>().intensity -= _sunDimTime * Time.deltaTime;
        }
        if (GetComponent<Light>().intensity < _duskSunIntensity)
        {
            GetComponent<Light>().intensity = _dawnSunIntensity;
        }

        //ambient intensity adjustments
        if (RenderSettings.ambientIntensity > _duskAmbientIntensity)
        {
            RenderSettings.ambientIntensity -= _ambientDimTime * Time.deltaTime * TimeScale;
        }
        if (RenderSettings.ambientIntensity < _duskAmbientIntensity)
        {
            RenderSettings.ambientIntensity = _dawnAmbientIntensity;
        }

        if (_hours == _nightStartTime)
        {
            _dayPhases = DayPhases.Night;
        }
    }

    private void Night()
    {
        //directional light intensity adjustments
        if (GetComponent<Light>().intensity > _nightSunIntensity)
        {
            GetComponent<Light>().intensity -= _sunDimTime * Time.deltaTime;
        }
        if (GetComponent<Light>().intensity < _nightSunIntensity)
        {
            GetComponent<Light>().intensity = _nightSunIntensity;
        }

        //ambient intensity adjustments
        if (RenderSettings.ambientIntensity > _nightAmbientIntensity)
        {
            RenderSettings.ambientIntensity -= _ambientDimTime * Time.deltaTime * TimeScale;
        }
        if (RenderSettings.ambientIntensity < _nightAmbientIntensity)
        {
            RenderSettings.ambientIntensity = _nightAmbientIntensity;
        }

        if (_hours == _dawnStartTime && _hours < _dayStartTime)
        {
            _dayPhases = DayPhases.Dawn;
        }
    }

    private void OnGUI()
    {
        GUI.Label(new Rect(Screen.width - 50, 5, _guiWidth, _guiHeight), "Day " + _days);
        if (_minutes < 10)
        {
            GUI.Label(new Rect(Screen.width - 50, 25, _guiWidth, _guiHeight), _hours + " : " + 0 + _minutes + " : " + _seconds);
        }
        else
            GUI.Label(new Rect(Screen.width - 50, 25, _guiWidth, _guiHeight), _hours + " : " + _minutes + " : " + _seconds);
    }

    private void UpdateSkybox()
    {
        if (_dayPhases == DayPhases.Dawn)
        {
            if (_skyboxBlendFactor == _dawnSkyboxBlendFactor) { return; }
            _skyboxBlendFactor += _skyboxBlendSpeed * Time.deltaTime;

            if (_skyboxBlendFactor > _dawnSkyboxBlendFactor)
            {
                _skyboxBlendFactor = _dawnSkyboxBlendFactor;
            }
        }
        if (_dayPhases == DayPhases.Day)
        {
            if (_skyboxBlendFactor == _daySkyboxBlendFactor) { return; }
            _skyboxBlendFactor += _skyboxBlendSpeed * Time.deltaTime;

            if (_skyboxBlendFactor > _daySkyboxBlendFactor)
            {
                _skyboxBlendFactor = _daySkyboxBlendFactor;
            }
        }
        if (_dayPhases == DayPhases.Dusk)
        {
            if (_skyboxBlendFactor == _duskSkyboxBlendFactor) { return; }
            _skyboxBlendFactor -= _skyboxBlendSpeed * Time.deltaTime;

            if (_skyboxBlendFactor < _duskSkyboxBlendFactor)
            {
                _skyboxBlendFactor = _duskSkyboxBlendFactor;
            }
        }
        if (_dayPhases == DayPhases.Night)
        {
            if (_skyboxBlendFactor == _nightSkyboxBlendFactor) { return; }
            _skyboxBlendFactor -= _skyboxBlendSpeed * Time.deltaTime;

            if (_skyboxBlendFactor < _nightSkyboxBlendFactor)
            {
                _skyboxBlendFactor = _nightSkyboxBlendFactor;
            }
        }

        RenderSettings.skybox.SetFloat("_Blend", _skyboxBlendFactor);
    }

    private void SunRotationManager()
    {
        _RotationValue = _degreesSun / _secondsInaDay * TimeScale;

        transform.RotateAround(_sunPivotPoint.position, Vector3.forward, _RotationValue * Time.deltaTime);
    }
}