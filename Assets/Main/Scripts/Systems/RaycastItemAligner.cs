using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RaycastItemAligner : MonoBehaviour{

    [SerializeField] public float raycastDistance = 100f;
    public GameObject objectToSpawn;

    public float overlapTestBoxSize = 1f;
    public LayerMask spawnedObjectLayer;

    private PickItem _pi;

    private void Awake()
    {
        _pi = GameObject.Find("ItemSpawner").GetComponent<PickItem>();        
    }

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

            Vector3 overlapTestBoxScale = new Vector3(overlapTestBoxSize, overlapTestBoxSize, overlapTestBoxSize);
            Collider[] collidersInsideOverlapBox = new Collider[1];
            int numberOfCollidersFound = Physics.OverlapBoxNonAlloc(hitInfo.point, overlapTestBoxScale, collidersInsideOverlapBox,
                                         spawnRot, spawnedObjectLayer);
                      

            if (numberOfCollidersFound == 0)
            {                
                _pi.Pick(hitInfo.point, spawnRot);
            }           

        }
    }   

}
