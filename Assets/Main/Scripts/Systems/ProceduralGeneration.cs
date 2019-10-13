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
    [Tooltip("Random min/max scale to apply.")]
    public Vector2 scaleRange = new Vector2(1.0f, 3.0f);

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
        //Oluşturulacak objelerin  lokasyonunun rastgeleleştirilmesi
        Vector3 pos = new Vector3(Random.Range(-itemXSpread, itemXSpread),
                                  Random.Range(-itemYSpread, itemYSpread),
                                  Random.Range(-itemZSpread, itemZSpread));

        transform.position += pos;
        Vector3 randPosition = transform.position;

        //Oluşacak objelerin rastgele seçimi
        int randomIndex = Random.Range(0, objects.Length);

        //objelerin  rotasyonunun rastgele seçilmesi
        Quaternion randRotation = Quaternion.Euler(0, Random.Range(0, 360),0);

        //Instantiate
        GameObject clone; //= Instantiate(objects[randomIndex], randPosition, randRotation);

        clone = Instantiate(objects[randomIndex], randPosition, randRotation) as GameObject;
        //clone.transform.SetParent(transform);

        // Apply scaling.
        float scale = Random.Range(scaleRange.x, scaleRange.y);
        clone.transform.localScale += Vector3.one * scale;

    }
}
