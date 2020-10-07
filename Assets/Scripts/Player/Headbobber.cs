using UnityEngine;

public class Headbobber : MonoBehaviour
{
    private float _timer = 0.0f;
    private const float BobbingSpeed = 0.18f;
    private const float BobbingAmount = 0.2f;
    private const float Midpoint = 4.0f;

    private void Update()
    {
        var waveslice = 0.0f;
        var horizontal = Input.GetAxis("Horizontal");
        var vertical = Input.GetAxis("Vertical");

        Vector3 cSharpConversion = transform.localPosition;

        if (Mathf.Abs(horizontal) == 0 && Mathf.Abs(vertical) == 0)
        {
            _timer = 0.0f;
        }
        else
        {
            waveslice = Mathf.Sin(_timer);
            _timer = _timer + BobbingSpeed;
            if (_timer > Mathf.PI * 2)
            {
                _timer = _timer - (Mathf.PI * 2);
            }
        }
        if (waveslice != 0)
        {
            float translateChange = waveslice * BobbingAmount;
            float totalAxes = Mathf.Abs(horizontal) + Mathf.Abs(vertical);
            totalAxes = Mathf.Clamp(totalAxes, 0.0f, 1.0f);
            translateChange = totalAxes * translateChange;
            cSharpConversion.y = Midpoint + translateChange;
        }
        else
        {
            cSharpConversion.y = Midpoint;
        }

        transform.localPosition = cSharpConversion;
    }
}