﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enemy : MonoBehaviour
{
    [SerializeField] public float health = 100f;
    [SerializeField] public GameObject[] wreckage;
    [SerializeField] public int wreckageAmount = 10;
    [SerializeField] public float itemXSpread = 10f;
    [SerializeField] public float itemYSpread = 10f;
    [SerializeField] public float itemZSpread = 10f;
    public GameObject destExpo;
    

    public void TakeDamage(float amount)
    {
        health -= amount;
        
        if (health <= 0f)
        {
            Die();
        }
    }
    private void Die()
    {
        AudioManager.PlaySound("explosion");
        Instantiate(destExpo,transform.position,Quaternion.identity,transform);
        Destroy(gameObject,0.5f);

        //wreckage part of the code
        for (int i = 0; i < wreckageAmount; i++)
        {
            CreateWreckage();
        }
    }

    void CreateWreckage()
    {
        //Oluşturulacak enkazın lokasyonunun rastgeleleştirilmesi
        Vector3 pos= new Vector3(Random.Range(-itemXSpread, itemXSpread),
                                           Random.Range(-itemYSpread, itemYSpread),
                                           Random.Range(-itemZSpread, itemZSpread));
        transform.position += pos;
        Vector3 randPosition = transform.position;

        //Enkazda bulunacak parçaların rastgele seçimi
        int randomIndex = Random.Range(0, wreckage.Length);

        //Parçaların rotasyonunun rastgele seçilmesi
        Quaternion randRotation = Quaternion.Euler(Random.Range(0, 360) ,Random.Range(0, 360) ,Random.Range(0, 360));        

        //Instantiate
        GameObject clone = Instantiate(wreckage[randomIndex],randPosition,randRotation);
    }

   

}


