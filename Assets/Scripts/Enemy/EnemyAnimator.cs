using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyAnimator : MonoBehaviour {

    private Animator _anim;

	void Awake () {
        _anim = GetComponent<Animator>();	
	}
	
    public void Walk(bool walk) {
        _anim.SetBool("walk", walk);
    }

    public void Run(bool run) {
        _anim.SetBool("run", run);
    }

    public void Attack() {
        _anim.SetTrigger("attack");
    }

    public void Dead() {
        _anim.SetTrigger("dead");
    }

} // class































