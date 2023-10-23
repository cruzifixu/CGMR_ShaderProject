using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpinMyHead : MonoBehaviour
{
    private int speed = 15;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        // Slowly rotate the object arond its Y axis at 1 degree/second.
        transform.Rotate(0, Time.deltaTime * speed, 0);
    }
}
