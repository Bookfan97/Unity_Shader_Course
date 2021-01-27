using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class DecalToggle : MonoBehaviour
{
    Material _material;
    public bool showDecal = false;

    private void OnMouseDown()
    {
        showDecal = !showDecal;
        if (showDecal)
        {
            _material.SetFloat("_ShowDecal", 1);
        }
        else
        {
            _material.SetFloat("_ShowDecal", 0);
        }
    }

    // Start is called before the first frame update
    void Start()
    {
        _material = this.GetComponent<Renderer>().sharedMaterial;
        Debug.Log(_material.shader.name.ToString());
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
