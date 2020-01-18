using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PickItem : MonoBehaviour
{

    public GameObject[] itemsToPickFrom;
    [Tooltip("Random min/max scale to apply.")]
    public Vector2 scaleRange = new Vector2(1.0f, 5.0f);

    // Start is called before the first frame update
    void Start()
    {
        Pick();
    }

    void Pick()
    {
        int randomIndex = Random.Range(0, itemsToPickFrom.Length);
        GameObject clone = Instantiate(itemsToPickFrom[randomIndex], transform.position, transform.rotation);

        float scale = Random.Range(scaleRange.x, scaleRange.y);
        clone.transform.localScale = Vector3.one * scale;
    }


}

