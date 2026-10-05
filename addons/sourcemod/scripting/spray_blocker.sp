#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "Spray Blocker",
	author = "Bradasparky",
	description = "Blocks sprays",
	version = "1.0.0",
	url = "https://github.com/Bradasparky/spray-blocker"
};

public void OnPluginStart()
{
    // Clear all existing sprays
    for (int i = MaxClients; i; i--)
    {
        TE_Start("Player Decal");
        TE_WriteVector("m_vecOrigin", { 99999.0, 99999.0, 99999.0 });
        TE_WriteNum("m_nEntity", 0);
        TE_WriteNum("m_nPlayer", i);
        TE_SendToAll();
    }

    AddTempEntHook("Player Decal", Hook_OnPlayerSpray);
}

Action Hook_OnPlayerSpray(const char[] sName, const int[] iClients, int iCount, float flDelay) 
{
    return Plugin_Handled;
}