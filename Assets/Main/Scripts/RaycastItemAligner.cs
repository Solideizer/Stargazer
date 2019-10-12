using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RaycastItemAligner : MonoBehaviour{

    [SerializeField] public float raycastDistance = 100f;
    public GameObject objectToSpawn;
    // Start is called before the first frame update
    void Start()
    {
        PositionRaycast();
    }

    void PositionRaycast()
    {
        RaycastHit hitInfo;
        if (Physics.Raycast(transform.position, Vector3.down, out hitInfo, raycastDistance))
        {
            Quaternion spawnRot = Quaternion.FromToRotation(Vector3.up, hitInfo.normal);
            GameObject clone = Instantiate(objectToSpawn, hitInfo.point, spawnRot);
        }
    }
  

}
