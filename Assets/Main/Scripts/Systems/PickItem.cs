using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PickItem : MonoBehaviour
{
    Quaternion rotationToSpawn;
    Vector3 positionToSpawn = new Vector3(0,0,0);
    public GameObject[] itemsToPickFrom;
    [Tooltip("Random min/max scale to apply.")]
    public Vector2 scaleRange = new Vector2(1.0f, 5.0f);

    // Start is called before the first frame update
    void Start()
    {
        Pick(positionToSpawn, rotationToSpawn);
    }

    public void Pick(Vector3 positionToSpawn, Quaternion rotationToSpawn)
    {
        int randomIndex = Random.Range(0, itemsToPickFrom.Length);
        //GameObject clone = Instantiate(itemsToPickFrom[randomIndex], transform.position, transform.rotation);
        GameObject clone = Instantiate(itemsToPickFrom[randomIndex], positionToSpawn, rotationToSpawn);

        float scale = Random.Range(scaleRange.x, scaleRange.y);
        clone.transform.localScale = Vector3.one * scale;
    }


}

