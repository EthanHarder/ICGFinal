using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class YoshiScript : MonoBehaviour
{
    public Renderer mat;

    public int value = 3;
    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            if (value > 0)
            {
                value -= 1;

            }
            else
            {
                value = 3;
            }
          
            mat.material.SetFloat("_Outline", 0.1f * (float)value);
         


        }
    }
}
