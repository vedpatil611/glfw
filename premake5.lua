project "GLFW"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("intermediate/" .. outputdir .. "/%{prj.name}")

	files {
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/internal.h",
		"src/mappings.h",
		"src/context.c", 
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c"
	}

	filter "system:windows" {
		systemversion "latest"
		files {
			"src/win32_platform.h",
			"src/win32_joystick.h",
			"src/wgl_context.h",
			"src/egl_context.h",
			"src/osmesa_context.h",
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
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
