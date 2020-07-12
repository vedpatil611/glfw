project "GLFW"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("intermediate/" .. outputdir .. "/%{prj.name}")

	files {
		"internal.h",
		"mappings.h",
		"context.c", 
		"init.c",
		"input.c"
		"monitor.c"
		"vulkan.c"
		"window.c"
	}

	filter "system:windows" {
		systemversion "latest"
		files {
			"win32_platform.h",
			"win32_joystick.h",
			"wgl_context.h",
			"egl_context.h",
			"osmesa_context.h",
			"win32_init.c",
			"win32_joystick.c",
			"win32_monitor.c",
			"win32_time.c",
			"win32_thread.c",
			"win32_window.c",
			"wgl_context.c",
			"egl_context.c",
			"osmesa_context.c"
		}
		defines {
			"_GLFW_WIN32"
		}
	}

	filter "configurations:Debug"
		defines { "DEBUG" }
		symbols "on"

	filter "configurations:Release"
		defines { "NDEBUG" }
		optimize "on"
