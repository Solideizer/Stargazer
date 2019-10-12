using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProceduralGeneration : MonoBehaviour
{
    [SerializeField] GameObject[] objects;
    [SerializeField] int numObjectsToSpawn = 200;
    [SerializeField] public float itemXSpread = 10f;
    [SerializeField] public float itemYSpread = 10f;
    [SerializeField] public float itemZSpread = 10f;
   


    // Start is called before the first frame update
    void Start()
    {
        for (int i = 0; i < numObjectsToSpawn; i++)
        {
            InstatiateObjects();
        }
    }

    void InstatiateObjects()
    {
        //Oluşturulacak enkazın lokasyonunun rastgeleleştirilmesi
        Vector3 pos = new Vector3(Random.Range(-itemXSpread, itemXSpread),
                                  Random.Range(-itemYSpread, itemYSpread),
                                  Random.Range(-itemZSpread, itemZSpread));

        transform.position += pos;
        Vector3 randPosition = transform.position;

        //Enkazda bulunacak parçaların rastgele seçimi
        int randomIndex = Random.Range(0, objects.Length);

        //Parçaların rotasyonunun rastgele seçilmesi
        Quaternion randRotation = Quaternion.Euler(0, Random.Range(0, 360),0);

        //Instantiate
        GameObject clone = Instantiate(objects[randomIndex], randPosition, randRotation);

       
    }
}
