#define UNICODE
#define _UNICODE
#include <windows.h>
#include <commctrl.h>
#include <shellapi.h>
#include <mmsystem.h>
#include <stdlib.h>

#define ID_ICON_APP        100
#define ID_MENU_MAIN       500
#define ID_ACCEL_MAIN      501

#define IDM_NEW            510
#define IDM_EXIT           512
#define IDM_BEGINNER       521
#define IDM_INTERMEDIATE   522
#define IDM_EXPERT         523
#define IDM_CUSTOM         524
#define IDM_SOUND          526
#define IDM_MARKS          527
#define IDM_BESTTIMES      528
#define IDM_COLOR          529
#define IDM_HELP_CONTENTS  590
#define IDM_HELP_SEARCH    591
#define IDM_HELP_USING     592
#define IDM_HELP_ABOUT     593

#define IDD_CUSTOM         80
#define IDD_ENTERNAME      600
#define IDD_BESTTIMES      700

#define ID_EDIT_HEIGHT     141
#define ID_EDIT_WIDTH      142
#define ID_EDIT_MINES      143

#define ID_BMP_BLOCKS      410
#define ID_BMP_LED         420
#define ID_BMP_FACES       430
#define ID_WAV_TICK        432
#define ID_WAV_WIN         433
#define ID_WAV_LOSE        434

#define ID_STR_APPNAME       1
#define ID_STR_ERRCAPTION    3
#define ID_STR_NOTIMER       4
#define ID_STR_NOMEM         5
#define ID_STR_ERRFMT        6
#define ID_STR_SECONDS       7
#define ID_STR_ANON          8
#define ID_STR_FASTEST_BASE  9
#define ID_STR_ABOUT_TITLE  12
#define ID_STR_ABOUT_OTHER  13

#define DX_BLK        16
#define DY_BLK        16
#define DX_GRID_OFF   12
#define DY_GRID_OFF   55
#define DY_TOP_LED    16
#define DX_LED        13
#define DY_LED        23
#define DX_FACE       24
#define DY_FACE       24
#define X_BOXES_MAX   30
#define Y_BOXES_MAX   25
#define MAX_STEP_QUEUE 100

#define DX_CELL_BIAS      4
#define DY_CELL_TOP       39
#define DX_BOMB_LED       17
#define DX_LED_PITCH      13
#define DX_TIME_LED_FROM_RIGHT 56
#define DX_CLIENT_PAD     24
#define DY_CLIENT_PAD     67
#define MARGIN            9

#define BORDER_SUNKEN     0
#define BORDER_RAISED     1
#define BORDER_DARK_ONLY  2

#define XYZZY_ARMED       5
#define XYZZY_TOGGLE      0x14

#define MASK_MINE     0x80
#define MASK_VISIT    0x40
#define MASK_DATA     0x1F
enum {
    iBlkBlank = 0,
    iBlk1, iBlk2, iBlk3, iBlk4, iBlk5, iBlk6, iBlk7, iBlk8,
    iBlkGuessDn = 9,
    iBlkBombDn  = 10,
    iBlkWrong   = 11,
    iBlkExplode = 12,
    iBlkGuessUp = 13,
    iBlkBombUp  = 14,
    iBlkBlankUp = 15,
    iBlkBorder  = 16
};
#define iBlkExplodeVisit  (MASK_VISIT | iBlkExplode)

#define fStatusPlay   0x01
#define fStatusPause  0x02
#define fStatusIcon   0x08
#define fStatusDemo   0x10

enum { iFaceHappy = 0, iFaceCaution = 1, iFaceLose = 2, iFaceWin = 3, iFacePressed = 4 };

#define fmenuAlwaysOn 0
#define fmenuOff      1
#define fmenuOn       2

#define fResize 0x02
#define fRedraw 0x04

enum {
    iprefDifficulty, iprefMines, iprefHeight, iprefWidth, iprefXpos, iprefYpos,
    iprefSound, iprefMark, iprefMenu, iprefTick, iprefColor,
    iprefTime1, iprefName1, iprefTime2, iprefName2, iprefTime3, iprefName3,
    iprefAlreadyPlayed
};
static const WCHAR *rgszPref[18] = {
    L"Difficulty", L"Mines", L"Height", L"Width", L"Xpos", L"Ypos",
    L"Sound", L"Mark", L"Menu", L"Tick", L"Color",
    L"Time1", L"Name1", L"Time2", L"Name2", L"Time3", L"Name3",
    L"AlreadyPlayed"
};
#define szRegKey  L"Software\\Microsoft\\winmine"
#define szIniFile L"entpack.ini"

static DWORD wGameStatus = 0x18;
static int   rgDifficulty[3][3] = {
    { 10,  9,  9 },
    { 40, 16, 16 },
    { 99, 16, 30 }
};
static WORD  rgXyzzy[5] = { 'X','Y','Z','Z','Y' };
static const DWORD rgHelpCustom[]  = { 141,1000, 142,1001, 143,1002,
                                       112,1000, 113,1001, 111,1002, 0,0 };
static const DWORD rgHelpBest[]    = { 0x2c3,0x3eb, 0x2c4,0x3ec, 0x2c5,0x3ec, 0x2c6,0x3ec,
                                       0x2bd,0x3ec, 0x2bf,0x3ec, 0x2c1,0x3ec, 0x2be,0x3ec,
                                       0x2c0,0x3ec, 0x2c2,0x3ec, 0,0 };

static int   iXyzzy;
static BOOL  fMouseDown;
static BOOL  fBoth;
static BOOL  fIgnoreClick;
static BOOL  fMenuLoop;
static HPEN  hPenGray;
static BOOL  fUpdateIni;
static int   iFace;
static BOOL  fTimer;
static BOOL  fOldTimerStatus;
static int   xCur = -2, yCur = -2;

static int   cBombLeft;
static int   rgStepX[MAX_STEP_QUEUE];
static int   iStepMac;
static int   cSec;
static int   cBoxVisitMac;
static int   cBoxVisit;
static int   rgStepY[MAX_STEP_QUEUE];

static int   cBombStart;
static int   xBoxMac, yBoxMac;
static BYTE  rgBlk[27][32];

static int   Game;
static int   cfgMines;
static int   cfgHeight;
static int   cfgWidth;
static int   xWindow, yWindow;
static int   fSound;
static int   fMark;
static int   fTick;
static int   fMenu;
static int   fColor;
static int   rgTime[3];
static WCHAR rgszName[3][32];

static HKEY  hkeyPref;
static HGLOBAL hresFace, hresBlocks, hresLed;
static LPBYTE pFace, pBlocks, pLed;
static DWORD rgFaceOff[5];
static DWORD rgBlkOff[16];
static DWORD rgLedOff[12];
static HDC     rghdcBlk[16];
static HBITMAP rghbmBlk[16];

static HMENU hMenu;
static HWND  hwndMain;
static HINSTANCE hInst;
static HICON hIconMain;
static int   dxWindow, dyWindow;
static int   dypMenu;
static int   dypCaption;
static int   dypBorder;
static int   dxpBorder;
static int   dypAdjust;
static BOOL  fStartMin;
static WCHAR szClass[32];
static WCHAR szTime[32];
static WCHAR szDefaultName[32];

static void DisplayBlk(int x, int y);
static void ChangeBlk(int x, int y, int iBlk);
static void GameOver(BOOL fWin);
static void StartGame(void);
static void AdjustWindow(int fAdjust);
static void DisplayFace(int iFaceNew);
static void ReportErr(WORD id);
static void SetMenuBar(int fNew);
static void FixMenus(void);
static BOOL FLoadBitmaps(void);
static void FreeBitmaps(void);
static void PlayTune(int i);
static void StopAllSounds(void);
static int  FInitTunes(void);
static void SavePreferences(void);

static int Rnd(int rndMax) { return rand() % rndMax; }

static int GetScreenMetric(int i)
{
    int m;
    if (i == 0) { m = GetSystemMetrics(SM_CXVIRTUALSCREEN); return m ? m : GetSystemMetrics(SM_CXSCREEN); }
    if (i == 1) { m = GetSystemMetrics(SM_CYVIRTUALSCREEN); return m ? m : GetSystemMetrics(SM_CYSCREEN); }
    return GetSystemMetrics(i);
}

static void ReportErr(WORD id)
{
    WCHAR szMsg[256], szCap[128];
    if (id < 999) {
        LoadString(hInst, id, szMsg, 128);
    } else {
        WCHAR szFmt[128];
        LoadString(hInst, ID_STR_ERRFMT, szFmt, 128);
        wsprintf(szMsg, szFmt, (int)id);
    }
    LoadString(hInst, ID_STR_ERRCAPTION, szCap, 128);
    MessageBox(NULL, szMsg, szCap, MB_ICONHAND);
}

static void LoadSz(WORD id, WCHAR *sz, int cch)
{
    if (LoadString(hInst, id, sz, cch) == 0)
        ReportErr(1001);
}

static int FInitTunes(void)
{
    return PlaySound(NULL, NULL, SND_PURGE) ? 3 : 2;
}

static void StopAllSounds(void)
{
    if (fSound == 3) PlaySound(NULL, NULL, SND_PURGE);
}

static void PlayTune(int i)
{
    if (fSound != 3) return;
    switch (i) {
    case 1: PlaySound(MAKEINTRESOURCE(ID_WAV_TICK), hInst, SND_RESOURCE | SND_ASYNC); break;
    case 2: PlaySound(MAKEINTRESOURCE(ID_WAV_WIN),  hInst, SND_RESOURCE | SND_ASYNC); break;
    case 3: PlaySound(MAKEINTRESOURCE(ID_WAV_LOSE), hInst, SND_RESOURCE | SND_ASYNC); break;
    }
}

static int Clamp(int v, int lo, int hi) { return v > hi ? hi : (v < lo ? lo : v); }

static int ReadRegInt(int ipref, int dflt, int vMin, int vMax)
{
    DWORD val, cb = 4;
    if (RegQueryValueEx(hkeyPref, rgszPref[ipref], NULL, NULL, (LPBYTE)&val, &cb) != ERROR_SUCCESS)
        return dflt;
    return Clamp((int)val, vMin, vMax);
}

static void ReadRegSz(int ipref, WCHAR *sz)
{
    DWORD cb = 0x40;
    if (RegQueryValueEx(hkeyPref, rgszPref[ipref], NULL, NULL, (LPBYTE)sz, &cb) != ERROR_SUCCESS)
        lstrcpy(sz, szDefaultName);
}

static int ReadIniInt(int ipref, int dflt, int vMin, int vMax)
{
    int v = GetPrivateProfileInt(szClass, rgszPref[ipref], dflt, szIniFile);
    return Clamp(v, vMin, vMax);
}

static void ReadIniSz(int ipref, WCHAR *sz)
{
    GetPrivateProfileString(szClass, rgszPref[ipref], szDefaultName, sz, 32, szIniFile);
}

static void ReadPreferences(void)
{
    DWORD disp; HDC hdc;
    RegCreateKeyEx(HKEY_CURRENT_USER, szRegKey, 0, NULL, 0, KEY_READ, NULL, &hkeyPref, &disp);

    yBoxMac = cfgHeight = ReadRegInt(iprefHeight, 9, 9, 25);
    xBoxMac = cfgWidth  = ReadRegInt(iprefWidth,  9, 9, 30);
    Game                = (WORD)ReadRegInt(iprefDifficulty, 0, 0, 3);
    cfgMines            = ReadRegInt(iprefMines, 10, 10, 999);
    xWindow             = ReadRegInt(iprefXpos, 80, 0, 1024);
    yWindow             = ReadRegInt(iprefYpos, 80, 0, 1024);
    fSound              = ReadRegInt(iprefSound, 0, 0, 3);
    fMark               = ReadRegInt(iprefMark,  1, 0, 1);
    fTick               = ReadRegInt(iprefTick,  0, 0, 1);
    fMenu               = ReadRegInt(iprefMenu,  0, 0, 2);
    rgTime[0]           = ReadRegInt(iprefTime1, 999, 0, 999);
    rgTime[1]           = ReadRegInt(iprefTime2, 999, 0, 999);
    rgTime[2]           = ReadRegInt(iprefTime3, 999, 0, 999);
    ReadRegSz(iprefName1, rgszName[0]);
    ReadRegSz(iprefName2, rgszName[1]);
    ReadRegSz(iprefName3, rgszName[2]);

    hdc = GetDC(GetDesktopWindow());
    fColor = ReadRegInt(iprefColor, GetDeviceCaps(hdc, NUMCOLORS) != 2, 0, 1);
    ReleaseDC(GetDesktopWindow(), hdc);

    if (fSound == 3) fSound = FInitTunes();
    RegCloseKey(hkeyPref);
}

static void WriteRegInt(int ipref, DWORD v)
{ RegSetValueEx(hkeyPref, rgszPref[ipref], 0, REG_DWORD, (LPBYTE)&v, 4); }
static void WriteRegSz(int ipref, const WCHAR *sz)
{ RegSetValueEx(hkeyPref, rgszPref[ipref], 0, REG_SZ, (const BYTE *)sz, 2 * lstrlen(sz) + 2); }

static void SavePreferences(void)
{
    DWORD disp;
    RegCreateKeyEx(HKEY_CURRENT_USER, szRegKey, 0, NULL, 0, KEY_SET_VALUE | KEY_CREATE_SUB_KEY,
                   NULL, &hkeyPref, &disp);
    WriteRegInt(iprefDifficulty, (WORD)Game);
    WriteRegInt(iprefHeight, cfgHeight);
    WriteRegInt(iprefWidth,  cfgWidth);
    WriteRegInt(iprefMines,  cfgMines);
    WriteRegInt(iprefMark,   fMark);
    WriteRegInt(iprefAlreadyPlayed, 1);
    WriteRegInt(iprefColor,  fColor);
    WriteRegInt(iprefSound,  fSound);
    WriteRegInt(iprefXpos,   xWindow);
    WriteRegInt(iprefYpos,   yWindow);
    WriteRegInt(iprefTime1,  rgTime[0]);
    WriteRegInt(iprefTime2,  rgTime[1]);
    WriteRegInt(iprefTime3,  rgTime[2]);
    WriteRegSz(iprefName1, rgszName[0]);
    WriteRegSz(iprefName2, rgszName[1]);
    WriteRegSz(iprefName3, rgszName[2]);
    RegCloseKey(hkeyPref);
}

static void InitConst(void)
{
    DWORD disp; HDC hdc; BOOL fAlreadyPlayed = FALSE;

    srand((WORD)GetTickCount());
    LoadSz(ID_STR_APPNAME, szClass, 32);
    LoadSz(ID_STR_SECONDS, szTime, 32);
    LoadSz(ID_STR_ANON,    szDefaultName, 32);

    dypCaption = GetSystemMetrics(SM_CYCAPTION) + 1;
    dypMenu    = GetSystemMetrics(SM_CYMENU)    + 1;
    dypBorder  = GetSystemMetrics(SM_CYBORDER)  + 1;
    dxpBorder  = GetSystemMetrics(SM_CXBORDER)  + 1;

    if (RegCreateKeyEx(HKEY_CURRENT_USER, szRegKey, 0, NULL, 0, KEY_READ, NULL, &hkeyPref, &disp) == ERROR_SUCCESS) {
        fAlreadyPlayed = ReadRegInt(iprefAlreadyPlayed, 0, 0, 1);
        RegCloseKey(hkeyPref);
        if (fAlreadyPlayed) return;
    }

    cfgHeight = ReadIniInt(iprefHeight, 9, 9, 25);
    cfgWidth  = ReadIniInt(iprefWidth,  9, 9, 30);
    Game      = (WORD)ReadIniInt(iprefDifficulty, 0, 0, 3);
    cfgMines  = ReadIniInt(iprefMines, 10, 10, 999);
    xWindow   = ReadIniInt(iprefXpos, 80, 0, 1024);
    yWindow   = ReadIniInt(iprefYpos, 80, 0, 1024);
    fSound    = ReadIniInt(iprefSound, 0, 0, 3);
    fMark     = ReadIniInt(iprefMark,  1, 0, 1);
    fTick     = ReadIniInt(iprefTick,  0, 0, 1);
    fMenu     = ReadIniInt(iprefMenu,  0, 0, 2);
    rgTime[0] = ReadIniInt(iprefTime1, 999, 0, 999);
    rgTime[1] = ReadIniInt(iprefTime2, 999, 0, 999);
    rgTime[2] = ReadIniInt(iprefTime3, 999, 0, 999);
    ReadIniSz(iprefName1, rgszName[0]);
    ReadIniSz(iprefName2, rgszName[1]);
    ReadIniSz(iprefName3, rgszName[2]);
    hdc = GetDC(GetDesktopWindow());
    fColor = ReadIniInt(iprefColor, GetDeviceCaps(hdc, NUMCOLORS) != 2, 0, 1);
    ReleaseDC(GetDesktopWindow(), hdc);
    if (fSound == 3) fSound = FInitTunes();
    SavePreferences();
}

static HRSRC FindBitmapRes(int id) { return FindResource(hInst, MAKEINTRESOURCE(id + (fColor == 0)), RT_BITMAP); }

static DWORD CbBitmap(int dx, int dy)
{
    int bpp = fColor ? 4 : 1;
    return (DWORD)(((bpp * dx + 31) >> 3) & ~3) * dy;
}

static BOOL FLoadBitmaps(void)
{
    HRSRC hr; HDC hdc; DWORD off, i;

    hresBlocks = hresLed = hresFace = NULL;
    if ((hr = FindBitmapRes(ID_BMP_BLOCKS)) != NULL) hresBlocks = LoadResource(hInst, hr);
    if ((hr = FindBitmapRes(ID_BMP_LED))    != NULL) hresLed    = LoadResource(hInst, hr);
    if ((hr = FindBitmapRes(ID_BMP_FACES))  != NULL) hresFace   = LoadResource(hInst, hr);
    if (!hresBlocks || !hresLed || !hresFace) return FALSE;

    pBlocks = LockResource(hresBlocks);
    pLed    = LockResource(hresLed);
    pFace   = LockResource(hresFace);

    hPenGray = fColor ? CreatePen(PS_SOLID, 1, RGB(128,128,128)) : GetStockObject(BLACK_PEN);

    off = fColor ? 0x68 : 0x30;
    for (i = 0; i < 16; i++) { rgBlkOff[i] = off; off += CbBitmap(16, 16); }
    off = fColor ? 0x68 : 0x30;
    for (i = 0; i < 12; i++) { rgLedOff[i] = off; off += CbBitmap(13, 23); }
    off = fColor ? 0x68 : 0x30;
    for (i = 0; i < 5;  i++) { rgFaceOff[i] = off; off += CbBitmap(24, 24); }

    hdc = GetDC(hwndMain);
    for (i = 0; i < 16; i++) {
        rghdcBlk[i] = CreateCompatibleDC(hdc);
        if (!rghdcBlk[i]) OutputDebugStringA("FLoad failed to create compatible dc\n");
        rghbmBlk[i] = CreateCompatibleBitmap(hdc, 16, 16);
        if (!rghbmBlk[i]) OutputDebugStringA("Failed to create Bitmap\n");
        SelectObject(rghdcBlk[i], rghbmBlk[i]);
        SetDIBitsToDevice(rghdcBlk[i], 0, 0, 16, 16, 0, 0, 0, 16,
                          pBlocks + rgBlkOff[i], (BITMAPINFO *)pBlocks, DIB_RGB_COLORS);
    }
    ReleaseDC(hwndMain, hdc);
    return TRUE;
}

static void FreeBitmaps(void)
{
    int i;
    if (hPenGray) DeleteObject(hPenGray);
    for (i = 0; i < 16; i++) { DeleteDC(rghdcBlk[i]); DeleteObject(rghbmBlk[i]); }
}

static int XFromLParam(LPARAM lp) { return (LOWORD(lp) + DX_CELL_BIAS) >> 4; }
static int YFromLParam(LPARAM lp) { return ((int)HIWORD(lp) - DY_CELL_TOP) >> 4; }

static void DisplayBlk(int x, int y)
{
    HDC hdc = GetDC(hwndMain);
    BitBlt(hdc, (x << 4) - DX_CELL_BIAS, (y << 4) + DY_CELL_TOP, 16, 16, rghdcBlk[rgBlk[y][x] & MASK_DATA], 0, 0, SRCCOPY);
    ReleaseDC(hwndMain, hdc);
}

static void DrawGrid(HDC hdc)
{
    int x, y, xPos, yPos = DY_GRID_OFF;
    for (y = 1; y <= yBoxMac; y++, yPos += 16) {
        xPos = DX_GRID_OFF;
        for (x = 1; x <= xBoxMac; x++, xPos += 16)
            BitBlt(hdc, xPos, yPos, 16, 16, rghdcBlk[rgBlk[y][x] & MASK_DATA], 0, 0, SRCCOPY);
    }
}

static void DisplayGrid(void) { HDC hdc = GetDC(hwndMain); DrawGrid(hdc); ReleaseDC(hwndMain, hdc); }

static void DrawLed(HDC hdc, int x, int iLed)
{
    SetDIBitsToDevice(hdc, x, DY_TOP_LED, DX_LED, DY_LED, 0, 0, 0, DY_LED,
                      pLed + rgLedOff[iLed], (BITMAPINFO *)pLed, DIB_RGB_COLORS);
}

static void DrawBombCount(HDC hdc)
{
    int v = cBombLeft, i100, rest;
    DWORD lay = GetLayout(hdc);
    if (lay & LAYOUT_RTL) SetLayout(hdc, 0);
    if (v < 0) { i100 = 11; rest = (-v) % 100; }
    else       { i100 = v / 100; rest = v % 100; }
    DrawLed(hdc, DX_BOMB_LED,                    i100);
    DrawLed(hdc, DX_BOMB_LED + DX_LED_PITCH,     rest / 10);
    DrawLed(hdc, DX_BOMB_LED + 2 * DX_LED_PITCH, rest % 10);
    if (lay & LAYOUT_RTL) SetLayout(hdc, lay);
}
static void DisplayBombCount(void) { HDC hdc = GetDC(hwndMain); DrawBombCount(hdc); ReleaseDC(hwndMain, hdc); }

static void DrawTime(HDC hdc)
{
    int v = cSec;
    DWORD lay = GetLayout(hdc);
    int xr = dxWindow - dxpBorder;
    if (lay & LAYOUT_RTL) SetLayout(hdc, 0);
    DrawLed(hdc, xr - DX_TIME_LED_FROM_RIGHT,                     v / 100);
    DrawLed(hdc, xr - DX_TIME_LED_FROM_RIGHT + DX_LED_PITCH,      (v % 100) / 10);
    DrawLed(hdc, xr - DX_TIME_LED_FROM_RIGHT + 2 * DX_LED_PITCH,  v % 10);
    if (lay & LAYOUT_RTL) SetLayout(hdc, lay);
}
static void DisplayTime(void) { HDC hdc = GetDC(hwndMain); DrawTime(hdc); ReleaseDC(hwndMain, hdc); }

static void DrawFace(HDC hdc, int iFaceDraw)
{
    SetDIBitsToDevice(hdc, (dxWindow - DX_FACE) / 2, DY_TOP_LED, DX_FACE, DY_FACE, 0, 0, 0, DY_FACE,
                      pFace + rgFaceOff[iFaceDraw], (BITMAPINFO *)pFace, DIB_RGB_COLORS);
}

static void DisplayFace(int iFaceDraw) { HDC hdc = GetDC(hwndMain); DrawFace(hdc, iFaceDraw); ReleaseDC(hwndMain, hdc); }

static void SetBorderPen(HDC hdc, int fMode)
{
    if (fMode & 1) SetROP2(hdc, R2_WHITE);
    else { SetROP2(hdc, R2_COPYPEN); SelectObject(hdc, hPenGray); }
}

static void DrawBorder(HDC hdc, int left, int top, int right, int bottom, int thickness, int mode)
{
    int i;
    SetBorderPen(hdc, mode);
    for (i = 0; i < thickness; i++) {
        bottom--;
        MoveToEx(hdc, left, bottom, NULL);
        LineTo(hdc, left, top);
        left++;
        LineTo(hdc, right, top);
        right--;
        top++;
    }
    if (mode < BORDER_DARK_ONLY) SetBorderPen(hdc, mode ^ 1);
    for (i = 0; i < thickness; i++) {
        bottom++;
        MoveToEx(hdc, left, bottom, NULL);
        left--;
        right++;
        LineTo(hdc, right, bottom);
        top--;
        LineTo(hdc, right, top);
    }
}

static void DrawBorders(HDC hdc)
{
    int right  = dxWindow - 1,  bottom  = dyWindow - 1;
    int iright = right - MARGIN, ibottom = bottom - MARGIN;
    int xTime  = dxWindow - dxpBorder - 57;
    int xFace  = (dxWindow - DX_FACE) / 2 - 1;

    DrawBorder(hdc, 0, 0, right, bottom, 3, BORDER_RAISED);
    DrawBorder(hdc, MARGIN, 52, iright, ibottom, 3, BORDER_SUNKEN);
    DrawBorder(hdc, MARGIN, MARGIN, iright, 45, 2, BORDER_SUNKEN);
    DrawBorder(hdc, 16, 15, 56, 39, 1, BORDER_SUNKEN);
    DrawBorder(hdc, xTime, 15, xTime + 40, 39, 1, BORDER_SUNKEN);
    DrawBorder(hdc, xFace, 15, xFace + 25, 40, 1, BORDER_DARK_ONLY);
}

static void DrawWindow(HDC hdc)
{
    DrawBorders(hdc);
    DrawBombCount(hdc);
    DrawFace(hdc, iFace);
    DrawTime(hdc);
    DrawGrid(hdc);
}

static void DisplayAll(void) { HDC hdc = GetDC(hwndMain); DrawWindow(hdc); ReleaseDC(hwndMain, hdc); }

static void InitBoard(void)
{
    int i;
    memset(rgBlk, iBlkBlankUp, sizeof(rgBlk));
    for (i = 0; i <= xBoxMac + 1; i++) { rgBlk[0][i] = iBlkBorder; rgBlk[yBoxMac + 1][i] = iBlkBorder; }
    for (i = 0; i <= yBoxMac + 1; i++) { rgBlk[i][0] = iBlkBorder; rgBlk[i][xBoxMac + 1] = iBlkBorder; }
}

static int CountBombs(int xc, int yc)
{
    int x, y, c = 0;
    for (y = yc - 1; y <= yc + 1; y++)
        for (x = xc - 1; x <= xc + 1; x++)
            if (rgBlk[y][x] & MASK_MINE) c++;
    return c;
}

static int CountFlags(int xc, int yc)
{
    int x, y, c = 0;
    for (y = yc - 1; y <= yc + 1; y++)
        for (x = xc - 1; x <= xc + 1; x++)
            if ((rgBlk[y][x] & MASK_DATA) == iBlkBombUp) c++;
    return c;
}

static void ChangeBlk(int x, int y, int iBlk)
{
    rgBlk[y][x] = (rgBlk[y][x] & 0xE0) | iBlk;
    DisplayBlk(x, y);
}

static void ShowBombs(int iBlkMine)
{
    int x, y;
    for (y = 1; y <= yBoxMac; y++)
        for (x = 1; x <= xBoxMac; x++) {
            BYTE b = rgBlk[y][x];
            if (b & MASK_VISIT) continue;
            if (b & MASK_MINE) {
                if ((b & MASK_DATA) != iBlkBombUp)
                    rgBlk[y][x] = (b & 0xE0) | iBlkMine;
            } else if ((b & MASK_DATA) == iBlkBombUp) {
                rgBlk[y][x] = (b & 0xEB) | iBlkWrong;
            }
        }
    DisplayGrid();
}

static void StepBlock(int x, int y)
{
    BYTE b = rgBlk[y][x];
    int n;
    if (b & MASK_VISIT) return;
    if ((b & MASK_DATA) == iBlkBorder || (b & MASK_DATA) == iBlkBombUp) return;
    cBoxVisit++;
    n = CountBombs(x, y);
    rgBlk[y][x] = (BYTE)(n | MASK_VISIT);
    DisplayBlk(x, y);
    if (n == 0) {
        rgStepX[iStepMac] = x;
        rgStepY[iStepMac] = y;
        if (++iStepMac == MAX_STEP_QUEUE) iStepMac = 0;
    }
}

static void StepXY(int x, int y)
{
    int i;
    iStepMac = 1;
    StepBlock(x, y);
    if (iStepMac == 1) return;
    i = 1;
    do {
        int xs = rgStepX[i], ys = rgStepY[i];
        StepBlock(xs - 1, ys - 1); StepBlock(xs,     ys - 1); StepBlock(xs + 1, ys - 1);
        StepBlock(xs - 1, ys    ); StepBlock(xs + 1, ys    );
        StepBlock(xs - 1, ys + 1); StepBlock(xs,     ys + 1); StepBlock(xs + 1, ys + 1);
        if (++i == MAX_STEP_QUEUE) i = 0;
    } while (i != iStepMac);
}

static void PressBlk(int x, int y)
{
    int d = rgBlk[y][x] & MASK_DATA;
    if (d == iBlkGuessUp) d = iBlkGuessDn;
    else if (d == iBlkBlankUp) d = iBlkBlank;
    rgBlk[y][x] = (rgBlk[y][x] & 0xE0) | d;
}

static void UnpressBlk(int x, int y)
{
    int d = rgBlk[y][x] & MASK_DATA;
    if (d == iBlkGuessDn) d = iBlkGuessUp;
    else if (d == iBlkBlank) d = iBlkBlankUp;
    rgBlk[y][x] = (rgBlk[y][x] & 0xE0) | d;
}
static BOOL FValid(int x, int y) { return x > 0 && y > 0 && x <= xBoxMac && y <= yBoxMac; }

static void TrackMouse(int xNew, int yNew)
{
    int xOld = xCur, yOld = yCur;
    int xo0, xo1, yo0, yo1, xn0, xn1, yn0, yn1, x, y;
    BOOL fOldOk, fNewOk;

    if (xNew == xCur && yNew == yCur) return;
    xCur = xNew; yCur = yNew;

    if (fBoth) {
        fNewOk = FValid(xNew, yNew);
        fOldOk = FValid(xOld, yOld);
        yo0 = max(yOld - 1, 1); yo1 = min(yOld + 1, yBoxMac);
        yn0 = max(yNew - 1, 1); yn1 = min(yNew + 1, yBoxMac);
        xo0 = max(xOld - 1, 1); xo1 = min(xOld + 1, xBoxMac);
        xn0 = max(xNew - 1, 1); xn1 = min(xNew + 1, xBoxMac);
        if (fOldOk) for (y = yo0; y <= yo1; y++) for (x = xo0; x <= xo1; x++) if (!(rgBlk[y][x] & MASK_VISIT)) UnpressBlk(x, y);
        if (fNewOk) for (y = yn0; y <= yn1; y++) for (x = xn0; x <= xn1; x++) if (!(rgBlk[y][x] & MASK_VISIT)) PressBlk(x, y);
        if (fOldOk) for (y = yo0; y <= yo1; y++) for (x = xo0; x <= xo1; x++) DisplayBlk(x, y);
        if (fNewOk) for (y = yn0; y <= yn1; y++) for (x = xn0; x <= xn1; x++) DisplayBlk(x, y);
    } else {
        if (FValid(xOld, yOld) && !(rgBlk[yOld][xOld] & MASK_VISIT)) { UnpressBlk(xOld, yOld); DisplayBlk(xOld, yOld); }
        if (FValid(xNew, yNew) && !(rgBlk[yNew][xNew] & MASK_VISIT) &&
            (rgBlk[yNew][xNew] & MASK_DATA) != iBlkBombUp) { PressBlk(xNew, yNew); DisplayBlk(xNew, yNew); }
    }
}

static void AddBombCount(int d) { cBombLeft += d; DisplayBombCount(); }

static void PauseGame(void)
{
    StopAllSounds();
    if (!(wGameStatus & fStatusPause)) fOldTimerStatus = fTimer;
    if (wGameStatus & fStatusPlay) fTimer = FALSE;
    wGameStatus |= fStatusPause;
}

static void ResumeGame(void)
{
    if (wGameStatus & fStatusPlay) fTimer = fOldTimerStatus;
    wGameStatus &= ~fStatusPause;
}

static void DoTimer(void)
{
    if (fTimer && cSec < 999) {
        cSec++;
        DisplayTime();
        PlayTune(1);
    }
}

static INT_PTR CALLBACK CustomDlgProc(HWND, UINT, WPARAM, LPARAM);
static INT_PTR CALLBACK EnterNameDlgProc(HWND, UINT, WPARAM, LPARAM);
static INT_PTR CALLBACK BestTimesDlgProc(HWND, UINT, WPARAM, LPARAM);

static void DoEnterName(void) { DialogBoxParam(hInst, MAKEINTRESOURCE(IDD_ENTERNAME), hwndMain, EnterNameDlgProc, 0); fUpdateIni = TRUE; }

static void DoDisplayBestTimes(void) { DialogBoxParam(hInst, MAKEINTRESOURCE(IDD_BESTTIMES), hwndMain, BestTimesDlgProc, 0); }

static void GameOver(BOOL fWin)
{
    fTimer = FALSE;
    iFace = fWin ? iFaceWin : iFaceLose;
    DisplayFace(iFace);
    ShowBombs(fWin ? iBlkBombUp : iBlkBombDn);
    if (fWin && cBombLeft != 0) AddBombCount(-cBombLeft);
    PlayTune(fWin ? 2 : 3);
    wGameStatus = fStatusDemo;
    if (fWin && (WORD)Game != 3 && cSec < rgTime[(WORD)Game]) {
        rgTime[(WORD)Game] = cSec;
        DoEnterName();
        DoDisplayBestTimes();
    }
}

static void StepSquare(int x, int y)
{
    if (rgBlk[y][x] & MASK_MINE) {
        if (cBoxVisit == 0) {

            int r, c;
            for (r = 1; r < yBoxMac; r++)
                for (c = 1; c < xBoxMac; c++)
                    if (!(rgBlk[r][c] & MASK_MINE)) {
                        rgBlk[y][x] = iBlkBlankUp;
                        rgBlk[r][c] |= MASK_MINE;
                        StepXY(x, y);
                        return;
                    }
        } else {
            ChangeBlk(x, y, iBlkExplodeVisit);
            GameOver(FALSE);
        }
    } else {
        StepXY(x, y);
        if (cBoxVisit == cBoxVisitMac) GameOver(TRUE);
    }
}

static void StepBox(int xc, int yc)
{
    BYTE b = rgBlk[yc][xc];
    if ((b & MASK_VISIT) && (b & MASK_DATA) == CountFlags(xc, yc)) {
        BOOL fLose = FALSE;
        int x, y;
        for (y = yc - 1; y <= yc + 1; y++)
            for (x = xc - 1; x <= xc + 1; x++) {
                BYTE c = rgBlk[y][x];
                if ((c & MASK_DATA) != iBlkBombUp && (c & MASK_MINE)) {
                    fLose = TRUE;
                    ChangeBlk(x, y, iBlkExplodeVisit);
                } else {
                    StepXY(x, y);
                }
            }
        if (fLose) GameOver(FALSE);
        else if (cBoxVisit == cBoxVisitMac) GameOver(TRUE);
    } else {
        TrackMouse(-2, -2);
    }
}

static void MakeGuess(int x, int y)
{
    int iNew;
    if (!FValid(x, y) || (rgBlk[y][x] & MASK_VISIT)) return;
    {
        int d = rgBlk[y][x] & MASK_DATA;
        if (d == iBlkBombUp) {
            iNew = fMark ? iBlkGuessUp : iBlkBlankUp;
            AddBombCount(1);
        } else if (d == iBlkGuessUp) {
            iNew = iBlkBlankUp;
        } else {
            iNew = iBlkBombUp;
            AddBombCount(-1);
        }
    }
    ChangeBlk(x, y, iNew);
    if ((rgBlk[y][x] & MASK_DATA) == iBlkBombUp && cBoxVisit == cBoxVisitMac)
        GameOver(TRUE);
}

static void DoButton1Up(void)
{
    int x = xCur, y = yCur;
    if (!FValid(x, y)) { DisplayFace(iFace); return; }

    if (cBoxVisit == 0 && cSec == 0) {
        PlayTune(1);
        cSec++;
        DisplayTime();
        fTimer = TRUE;
        if (!SetTimer(hwndMain, 1, 1000, NULL)) ReportErr(ID_STR_NOTIMER);
        x = xCur; y = yCur;
    }
    if (!(wGameStatus & fStatusPlay)) { xCur = yCur = x = y = -2; }

    if (fBoth) {
        StepBox(x, y);
    } else if (!(rgBlk[y][x] & MASK_VISIT) && (rgBlk[y][x] & MASK_DATA) != iBlkBombUp) {
        StepSquare(x, y);
    }
    DisplayFace(iFace);
}

static void StartGame(void)
{
    int fAdjust, x, y;
    fTimer = FALSE;
    fAdjust = (cfgWidth == xBoxMac && cfgHeight == yBoxMac) ? fRedraw : (fRedraw | fResize);
    xBoxMac = cfgWidth;
    yBoxMac = cfgHeight;
    InitBoard();
    iFace = iFaceHappy;
    cBombStart = cfgMines;
    do {
        do { x = Rnd(xBoxMac) + 1; y = Rnd(yBoxMac) + 1; } while (rgBlk[y][x] & MASK_MINE);
        rgBlk[y][x] |= MASK_MINE;
    } while (--cBombStart);
    cSec = 0;
    cBombStart = cBombLeft = cfgMines;
    cBoxVisit = 0;
    cBoxVisitMac = xBoxMac * yBoxMac - cfgMines;
    wGameStatus = fStatusPlay;
    AddBombCount(0);
    AdjustWindow(fAdjust);
}

static void AdjustWindow(int fAdjust)
{
    RECT rc1, rc2, rcInv; int fWrap = 0, d;
    if (!hwndMain) return;

    dypAdjust = dypCaption;
    if (!(fMenu & 1)) {
        dypAdjust += dypMenu;
        if (hMenu && GetMenuItemRect(hwndMain, hMenu, 0, &rc1) && GetMenuItemRect(hwndMain, hMenu, 1, &rc2)
            && rc1.top != rc2.top) {
            dypAdjust += dypMenu;
            fWrap = 1;
        }
    }
    dxWindow = (xBoxMac << 4) + DX_CLIENT_PAD;
    dyWindow = (yBoxMac << 4) + DY_CLIENT_PAD;

    d = dxWindow + xWindow - GetScreenMetric(0);
    if (d > 0) { fAdjust |= fResize; xWindow -= d; }
    d = dyWindow + yWindow - GetScreenMetric(1);
    if (d > 0) { fAdjust |= fResize; yWindow -= d; }

    if (!fStartMin) {
        if (fAdjust & fResize)
            MoveWindow(hwndMain, xWindow, yWindow, dxWindow + dxpBorder, dyWindow + dypAdjust, TRUE);
        if (fWrap && hMenu && GetMenuItemRect(hwndMain, hMenu, 0, &rc1) && GetMenuItemRect(hwndMain, hMenu, 1, &rc2)
            && rc1.top == rc2.top) {
            dypAdjust -= dypMenu;
            MoveWindow(hwndMain, xWindow, yWindow, dxWindow + dxpBorder, dyWindow + dypAdjust, TRUE);
        }
        if (fAdjust & fRedraw) {
            SetRect(&rcInv, 0, 0, dxWindow, dyWindow);
            InvalidateRect(hwndMain, &rcInv, TRUE);
        }
    }
}

static void CheckEm(int idm, BOOL f) { CheckMenuItem(hMenu, idm, f ? MF_CHECKED : MF_UNCHECKED); }

static void FixMenus(void)
{
    CheckEm(IDM_BEGINNER,     (WORD)Game == 0);
    CheckEm(IDM_INTERMEDIATE, (WORD)Game == 1);
    CheckEm(IDM_EXPERT,       (WORD)Game == 2);
    CheckEm(IDM_CUSTOM,       (WORD)Game == 3);
    CheckEm(IDM_COLOR, fColor);
    CheckEm(IDM_MARKS, fMark);
    CheckEm(IDM_SOUND, fSound);
}

static void SetMenuBar(int fNew)
{
    fMenu = fNew;
    FixMenus();
    SetMenu(hwndMain, (fMenu & 1) ? NULL : hMenu);
    AdjustWindow(fResize);
}

typedef HWND (WINAPI *PFNHTMLHELP)(HWND, LPCSTR, UINT, DWORD_PTR);
static HMODULE hmodHH; static PFNHTMLHELP pfnHtmlHelp; static BOOL fHHFail;

static BOOL GetHHCtrlPath(char *szPath)
{
    HKEY hk; DWORD cb = 260; BOOL ok = FALSE;
    if (RegOpenKeyExA(HKEY_CLASSES_ROOT, "CLSID\\{ADB880A6-D8FF-11CF-9377-00AA003B7A11}\\InprocServer32",
                      0, KEY_READ, &hk) == ERROR_SUCCESS) {
        ok = RegQueryValueExA(hk, "", NULL, NULL, (LPBYTE)szPath, &cb) == ERROR_SUCCESS;
        RegCloseKey(hk);
    }
    return ok;
}

static HWND DoHtmlHelp(HWND hwnd, LPCSTR pszFile, UINT cmd, DWORD_PTR data)
{
    if (!hmodHH && !fHHFail) {
        char szPath[260];
        if (GetHHCtrlPath(szPath)) hmodHH = LoadLibraryA(szPath);
        if (!hmodHH) hmodHH = LoadLibraryA("hhctrl.ocx");
    }
    if (hmodHH && !pfnHtmlHelp) pfnHtmlHelp = (PFNHTMLHELP)GetProcAddress(hmodHH, MAKEINTRESOURCEA(14));
    if (!hmodHH || !pfnHtmlHelp) { fHHFail = TRUE; return NULL; }
    return pfnHtmlHelp(hwnd, pszFile, cmd, data);
}

static void DoHelp(WORD type, UINT cmd)
{
    char sz[250];
    if (type == 4) {
        lstrcpyA(sz, "NTHelp.chm");
    } else {
        int n = GetModuleFileNameA(hInst, sz, 250);
        char *p = sz + n - 1;
        if (p - sz > 4 && p[-3] == '.') p -= 3;
        lstrcpyA(p, ".chm");
    }
    DoHtmlHelp(GetDesktopWindow(), sz, cmd, 0);
}

static void DoAbout(void)
{
    WCHAR szTitle[128], szOther[128];
    LoadSz(ID_STR_ABOUT_TITLE, szTitle, 128);
    LoadSz(ID_STR_ABOUT_OTHER, szOther, 128);
    ShellAbout(hwndMain, szTitle, szOther, LoadIcon(hInst, MAKEINTRESOURCE(ID_ICON_APP)));
}

static int GetDlgInt(HWND hdlg, int id, int vMin, int vMax)
{
    int v = (int)GetDlgItemInt(hdlg, id, NULL, FALSE);
    return v < vMin ? vMin : (v > vMax ? vMax : v);
}

static INT_PTR CALLBACK CustomDlgProc(HWND hdlg, UINT msg, WPARAM wp, LPARAM lp)
{
    switch (msg) {
    case WM_INITDIALOG:
        SetDlgItemInt(hdlg, ID_EDIT_HEIGHT, cfgHeight, FALSE);
        SetDlgItemInt(hdlg, ID_EDIT_WIDTH,  cfgWidth,  FALSE);
        SetDlgItemInt(hdlg, ID_EDIT_MINES,  cfgMines,  FALSE);
        return TRUE;
    case WM_COMMAND:
        switch (LOWORD(wp)) {
        case IDOK: case 100: {
            int mmax;
            cfgHeight = GetDlgInt(hdlg, ID_EDIT_HEIGHT, 9, 24);
            cfgWidth  = GetDlgInt(hdlg, ID_EDIT_WIDTH,  9, 30);
            mmax = (cfgWidth - 1) * (cfgHeight - 1);
            if (mmax > 999) mmax = 999;
            cfgMines  = GetDlgInt(hdlg, ID_EDIT_MINES, 10, mmax);
        }
        case IDCANCEL: case 109:
            EndDialog(hdlg, 1);
            return TRUE;
        }
        break;
    case WM_HELP:
        WinHelp(((LPHELPINFO)lp)->hItemHandle, L"winmine.hlp", HELP_WM_HELP, (ULONG_PTR)rgHelpCustom);
        return FALSE;
    case WM_CONTEXTMENU:
        WinHelp((HWND)wp, L"winmine.hlp", HELP_CONTEXTMENU, (ULONG_PTR)rgHelpCustom);
        return FALSE;
    }
    return FALSE;
}

static void SetBestLine(HWND hdlg, int idTime, int sec, const WCHAR *szName)
{
    WCHAR sz[32];
    wsprintf(sz, szTime, sec);
    SetDlgItemText(hdlg, idTime, sz);
    SetDlgItemText(hdlg, idTime + 1, szName);
}

static INT_PTR CALLBACK BestTimesDlgProc(HWND hdlg, UINT msg, WPARAM wp, LPARAM lp)
{
    switch (msg) {
    case WM_INITDIALOG:
        goto fill;
    case WM_COMMAND: {
        int id = LOWORD(wp);
        if (id <= 0) return FALSE;
        if (id <= 2 || id == 100 || id == 109) { EndDialog(hdlg, 1); return TRUE; }
        if (id == 707) {
            int i;
            for (i = 0; i < 3; i++) { rgTime[i] = 999; lstrcpy(rgszName[i], szDefaultName); }
            fUpdateIni = TRUE;
        } else return FALSE;
    fill:
        SetBestLine(hdlg, 701, rgTime[0], rgszName[0]);
        SetBestLine(hdlg, 703, rgTime[1], rgszName[1]);
        SetBestLine(hdlg, 705, rgTime[2], rgszName[2]);
        return TRUE;
    }
    case WM_HELP:
        WinHelp(((LPHELPINFO)lp)->hItemHandle, L"winmine.hlp", HELP_WM_HELP, (ULONG_PTR)rgHelpBest);
        return FALSE;
    case WM_CONTEXTMENU:
        WinHelp((HWND)wp, L"winmine.hlp", HELP_CONTEXTMENU, (ULONG_PTR)rgHelpBest);
        return FALSE;
    }
    return FALSE;
}

static INT_PTR CALLBACK EnterNameDlgProc(HWND hdlg, UINT msg, WPARAM wp, LPARAM lp)
{
    WCHAR szMsg[128];
    switch (msg) {
    case WM_INITDIALOG:
        LoadSz((WORD)(ID_STR_FASTEST_BASE + (WORD)Game), szMsg, 128);
        SetDlgItemText(hdlg, 601, szMsg);
        SendMessage(GetDlgItem(hdlg, 602), EM_LIMITTEXT, 32, 0);
        SetDlgItemText(hdlg, 602, rgszName[(WORD)Game]);
        return TRUE;
    case WM_COMMAND: {
        int id = LOWORD(wp);
        if (id > 0 && (id <= 2 || id == 100 || id == 109)) {
            GetDlgItemText(hdlg, 602, rgszName[(WORD)Game], 32);
            EndDialog(hdlg, 1);
            return TRUE;
        }
        break;
    }
    }
    return FALSE;
}

static BOOL FLocalButton(LPARAM lp)
{
    RECT rc; MSG msg; BOOL fPressed = TRUE;
    POINT pt = { LOWORD(lp), HIWORD(lp) };
    rc.left = (dxWindow - 24) / 2; rc.top = 16; rc.right = rc.left + 24; rc.bottom = 40;
    if (!PtInRect(&rc, pt)) return FALSE;

    SetCapture(hwndMain);
    DisplayFace(iFacePressed);
    MapWindowPoints(hwndMain, NULL, (POINT *)&rc, 2);
    for (;;) {
        if (!PeekMessage(&msg, hwndMain, WM_MOUSEMOVE, 0x020D, PM_REMOVE)) continue;
        if (msg.message == WM_MOUSEMOVE) {
            if (PtInRect(&rc, msg.pt)) { if (!fPressed) { fPressed = TRUE; DisplayFace(iFacePressed); } }
            else                        { if (fPressed)  { fPressed = FALSE; DisplayFace(iFace); } }
        } else if (msg.message == WM_LBUTTONUP) {
            if (fPressed && PtInRect(&rc, msg.pt)) { iFace = iFaceHappy; DisplayFace(iFaceHappy); StartGame(); }
            ReleaseCapture();
            return TRUE;
        }
    }
}

static void OnWindowPosChanged(LPARAM lp)
{
    if (!(wGameStatus & fStatusIcon)) {
        xWindow = ((WINDOWPOS *)lp)->x;
        yWindow = ((WINDOWPOS *)lp)->y;
    }
}

static void OnKeyDown(WPARAM vk)
{
    switch (vk) {
    case VK_SHIFT:
        if (iXyzzy >= XYZZY_ARMED) iXyzzy ^= XYZZY_TOGGLE;
        break;
    case VK_F4:
        if (fSound > 1) {
            if (fSound == 3) { StopAllSounds(); fSound = 2; }
            else fSound = FInitTunes();
        }
        break;
    case VK_F5: if (fMenu) SetMenuBar(fmenuOff); break;
    case VK_F6: if (fMenu) SetMenuBar(fmenuOn);  break;
    default:
        if (iXyzzy < XYZZY_ARMED) {
            int i = iXyzzy;
            iXyzzy = (rgXyzzy[i] == vk) ? i + 1 : 0;
        }
        break;
    }
}

static void OnSysCommand(WPARAM wp)
{
    switch (wp & 0xFFF0) {
    case SC_MINIMIZE:
        PauseGame();
        wGameStatus |= (fStatusIcon | fStatusPause);
        break;
    case SC_RESTORE:
        wGameStatus &= ~(fStatusIcon | fStatusPause);
        ResumeGame();
        fIgnoreClick = FALSE;
        break;
    }
}

static void ClosePostMenu(HWND hwnd)
{
    SendMessage(hwnd, WM_SYSCOMMAND, SC_CLOSE, 0);
}

static void ApplyPrefChange(void)
{
    fUpdateIni = TRUE;
    SetMenuBar(fMenu);
}

static void SelectDifficulty(int idm)
{
    Game = (WORD)(idm - IDM_BEGINNER);
    cfgMines  = rgDifficulty[Game][0];
    cfgHeight = rgDifficulty[Game][1];
    cfgWidth  = rgDifficulty[Game][2];
    StartGame();
    ApplyPrefChange();
}

static void DoCustomGame(void)
{
    DialogBoxParam(hInst, MAKEINTRESOURCE(IDD_CUSTOM), hwndMain, CustomDlgProc, 0);
    Game = 3;
    FixMenus();
    fUpdateIni = TRUE;
    StartGame();
}

static BOOL ToggleColor(HWND hwnd)
{
    fColor = !fColor;
    FreeBitmaps();
    if (!FLoadBitmaps()) {
        ReportErr(ID_STR_NOMEM);
        ClosePostMenu(hwnd);
        return FALSE;
    }
    DisplayAll();
    ApplyPrefChange();
    return TRUE;
}

static BOOL OnCommand(HWND hwnd, int id)
{
    switch (id) {
    case IDM_NEW:        StartGame(); break;
    case IDM_EXIT:
        ShowWindow(hwnd, SW_HIDE);
        ClosePostMenu(hwnd);
        return TRUE;
    case IDM_BEGINNER: case IDM_INTERMEDIATE: case IDM_EXPERT:
        SelectDifficulty(id);
        break;
    case IDM_CUSTOM:     DoCustomGame(); break;
    case IDM_SOUND:
        if (fSound) { StopAllSounds(); fSound = 0; }
        else fSound = FInitTunes();
        ApplyPrefChange();
        break;
    case IDM_MARKS:
        fMark = !fMark;
        ApplyPrefChange();
        break;
    case IDM_BESTTIMES:  DoDisplayBestTimes(); break;
    case IDM_COLOR:
        if (!ToggleColor(hwnd)) return TRUE;
        break;
    case IDM_HELP_CONTENTS: DoHelp(3, 0); break;
    case IDM_HELP_SEARCH:   DoHelp(1, 2); break;
    case IDM_HELP_USING:    DoHelp(4, 0); break;
    case IDM_HELP_ABOUT:    DoAbout(); return TRUE;
    }
    return FALSE;
}

static BOOL ConsumeIgnoredClick(void)
{
    if (!fIgnoreClick) return FALSE;
    fIgnoreClick = FALSE;
    return TRUE;
}

static void CheatShowMine(WPARAM wp, LPARAM lp)
{
    int x, y;
    if (iXyzzy == 0) return;
    if (iXyzzy == XYZZY_ARMED ? !(wp & MK_CONTROL) : iXyzzy < XYZZY_ARMED) return;
    x = XFromLParam(lp);
    y = YFromLParam(lp);
    xCur = x; yCur = y;
    if (FValid(x, y)) {
        HDC hdc = GetDC(NULL);
        SetPixel(hdc, 0, 0, (rgBlk[y][x] & MASK_MINE) ? RGB(0, 0, 0) : RGB(255, 255, 255));
        ReleaseDC(NULL, hdc);
    }
}

static void EndTrack(void)
{
    fMouseDown = FALSE;
    ReleaseCapture();
    if (wGameStatus & fStatusPlay) DoButton1Up();
    else TrackMouse(-2, -2);
}

static void OnMouseMove(WPARAM wp, LPARAM lp)
{
    if (fMouseDown) {
        if (wGameStatus & fStatusPlay) TrackMouse(XFromLParam(lp), YFromLParam(lp));
        else EndTrack();
    } else {
        CheatShowMine(wp, lp);
    }
}

static void BeginTrack(HWND hwnd, WPARAM wp, LPARAM lp)
{
    SetCapture(hwnd);
    xCur = yCur = -1;
    fMouseDown = TRUE;
    DisplayFace(iFaceCaution);
    OnMouseMove(wp, lp);
}

static BOOL OnLButtonDown(HWND hwnd, WPARAM wp, LPARAM lp)
{
    if (ConsumeIgnoredClick()) return TRUE;
    if (FLocalButton(lp)) return TRUE;
    if (!(wGameStatus & fStatusPlay)) return FALSE;
    fBoth = (wp & (MK_RBUTTON | MK_SHIFT)) != 0;
    BeginTrack(hwnd, wp, lp);
    return FALSE;
}

static BOOL OnMButtonDown(HWND hwnd, WPARAM wp, LPARAM lp)
{
    if (ConsumeIgnoredClick()) return TRUE;
    if (!(wGameStatus & fStatusPlay)) return FALSE;
    fBoth = TRUE;
    BeginTrack(hwnd, wp, lp);
    return FALSE;
}

static BOOL OnRButtonDown(HWND hwnd, WPARAM wp, LPARAM lp)
{
    if (ConsumeIgnoredClick()) return TRUE;
    if (!(wGameStatus & fStatusPlay)) return FALSE;
    if (fMouseDown) {
        TrackMouse(-3, -3);
        fBoth = TRUE;
        PostMessage(hwndMain, WM_MOUSEMOVE, wp, lp);
        return TRUE;
    }
    if (wp & MK_LBUTTON) { BeginTrack(hwnd, wp, lp); return FALSE; }
    if (!fMenuLoop) MakeGuess(XFromLParam(lp), YFromLParam(lp));
    return TRUE;
}

LRESULT CALLBACK MainWndProc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp)
{
    switch (msg) {
    case WM_WINDOWPOSCHANGED: OnWindowPosChanged(lp); break;

    case WM_PAINT: {
        PAINTSTRUCT ps;
        HDC hdc = BeginPaint(hwnd, &ps);
        DrawWindow(hdc);
        EndPaint(hwnd, &ps);
        return 0;
    }
    case WM_ACTIVATE:
        if (LOWORD(wp) == WA_CLICKACTIVE) fIgnoreClick = TRUE;
        break;
    case WM_DESTROY:
        KillTimer(hwnd, 1);
        PostQuitMessage(0);
        break;

    case WM_KEYDOWN:    OnKeyDown(wp);    break;
    case WM_SYSCOMMAND: OnSysCommand(wp); break;
    case WM_TIMER:      DoTimer(); return 0;
    case WM_COMMAND:    if (OnCommand(hwnd, LOWORD(wp))) return 0; break;

    case WM_LBUTTONDOWN: if (OnLButtonDown(hwnd, wp, lp)) return 0; break;
    case WM_MBUTTONDOWN: if (OnMButtonDown(hwnd, wp, lp)) return 0; break;
    case WM_RBUTTONDOWN: if (OnRButtonDown(hwnd, wp, lp)) return 0; break;
    case WM_MOUSEMOVE:   OnMouseMove(wp, lp); break;
    case WM_LBUTTONUP: case WM_RBUTTONUP: case WM_MBUTTONUP:
        if (fMouseDown) EndTrack();
        break;

    case WM_ENTERMENULOOP: fMenuLoop = TRUE;  break;
    case WM_EXITMENULOOP:  fMenuLoop = FALSE; break;
    }
    return DefWindowProc(hwnd, msg, wp, lp);
}

static BOOL FInitLocal(void)
{
    if (!FLoadBitmaps()) return FALSE;
    InitBoard();
    return TRUE;
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrev, LPSTR lpCmd, int nCmdShow)
{
    WNDCLASS wc; MSG msg; HACCEL hAccel; INITCOMMONCONTROLSEX icc;

    hInst = hInstance;
    InitConst();
    fStartMin = (nCmdShow == SW_SHOWMINNOACTIVE || nCmdShow == SW_SHOWMINIMIZED);

    icc.dwSize = sizeof(icc); icc.dwICC = 0x16FD;
    InitCommonControlsEx(&icc);

    hIconMain = LoadIcon(hInst, MAKEINTRESOURCE(ID_ICON_APP));
    wc.style = 0;
    wc.lpfnWndProc = MainWndProc;
    wc.cbClsExtra = wc.cbWndExtra = 0;
    wc.hInstance = hInst;
    wc.hIcon = hIconMain;
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = GetStockObject(LTGRAY_BRUSH);
    wc.lpszMenuName = NULL;
    wc.lpszClassName = szClass;
    if (!RegisterClass(&wc)) return 0;

    hMenu  = LoadMenu(hInst, MAKEINTRESOURCE(ID_MENU_MAIN));
    hAccel = LoadAccelerators(hInst, MAKEINTRESOURCE(ID_ACCEL_MAIN));
    ReadPreferences();

    hwndMain = CreateWindowEx(0, szClass, szClass,
                              WS_CAPTION | WS_SYSMENU | WS_MINIMIZEBOX,
                              xWindow - dxpBorder, yWindow - dypAdjust,
                              dxWindow + dxpBorder, dyWindow + dypAdjust,
                              NULL, NULL, hInst, NULL);
    if (!hwndMain) { ReportErr(1000); return 0; }

    AdjustWindow(1);
    if (!FInitLocal()) { ReportErr(ID_STR_NOMEM); return 0; }

    SetMenuBar(fMenu);
    StartGame();
    ShowWindow(hwndMain, SW_SHOW);
    UpdateWindow(hwndMain);
    fStartMin = FALSE;

    while (GetMessage(&msg, NULL, 0, 0)) {
        if (!TranslateAccelerator(hwndMain, hAccel, &msg)) {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
    }
    FreeBitmaps();
    StopAllSounds();
    if (fUpdateIni) SavePreferences();
    return (int)msg.wParam;
}
