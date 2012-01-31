// stdafx.h : 标准系统包含文件的包含文件，
// 或是常用但不常更改的项目特定的包含文件
//

#pragma once


#define WIN32_LEAN_AND_MEAN		// 从 Windows 头中排除极少使用的资料

//#define _WIN32_WINNT 0x0400

// Windows 头文件:
#include <windows.h>
// C 运行时头文件
#include <stdlib.h>
#include <malloc.h>
#include <memory.h>
#include <tchar.h>

#include <iostream>
using namespace std;

#include <atlbase.h>
#include <atlstr.h>
#include <shellapi.h>

#include <list>

#pragma comment(lib,"User32.lib")
