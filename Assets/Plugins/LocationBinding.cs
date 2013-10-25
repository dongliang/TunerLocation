using UnityEngine;
using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;


public class LocationBinding
{

	[DllImport("__Internal")]
	private static extern void _Start ();
	
	// Finishes any and all pending transactions
	public static void Start ()
	{
		if (Application.platform == RuntimePlatform.IPhonePlayer)
			_Start ();
    }

	[DllImport("__Internal")]
	private static extern void _Stop ();
	public static void Stop ()
	{
		if (Application.platform == RuntimePlatform.IPhonePlayer)
			_Stop ();
    }
}

