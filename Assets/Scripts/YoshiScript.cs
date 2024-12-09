using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class YoshiScript : MonoBehaviour
{
    public Renderer mat;

    public float value = 0.3f;
    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            if (value > 0)
            {
                value -= 0.1f;
            }
            else
            {
                value = 0.3f;
            }
            if (value < 0.1)
            {
                value = 0f;
            }
            mat.material.SetFloat("_Outline", value);

        }
    }
}
