project "Box2D"
  kind "StaticLib"
  language "C++"
  cppdialect "C++11"
  staticruntime "off"

  location "%{wks.location}/Hazel/vendor/box2d"

  targetdir ("%{prj.location}/Binary/" .. outputdir .. "/%{prj.name}")
  objdir    ("%{prj.location}/Intermediate/" .. outputdir .. "/%{prj.name}")

  files {
    "%{prj.location}/src/**.c",
    "%{prj.location}/src/**.cpp",
    "%{prj.location}/include/**.h"
  }

  includedirs {
    "%{prj.location}/include",
    "%{prj.location}/src",
  }

  filter "system:macosx"
    systemversion "15.0"
    toolset "clang"

  filter "configurations:Debug"
    runtime "Debug"
    symbols "on"

  filter "configurations:Release"
    runtime "Release"
    optimize "on"

  filter "configurations:Dist"
    runtime "Release"
    optimize "on"
    symbols "off"

