using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyAnimator : MonoBehaviour {

    private Animator anim;

	void Awake () {
        anim = GetComponent<Animator>();	
	}
	
    public void Walk(bool walk) {
        anim.SetBool("walk", walk);
    }

    public void Run(bool run) {
        anim.SetBool("run", run);
    }

    public void Attack() {
        anim.SetTrigger("attack");
    }

    public void Dead() {
        anim.SetTrigger("dead");
    }

} // class































