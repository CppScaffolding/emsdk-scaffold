-- scaffold geniefile for emsdk

emsdk_script = path.getabsolute(path.getdirectory(_SCRIPT))
emsdk_root = path.join(emsdk_script, "emsdk")

emsdk_includedirs = {
	path.join(emsdk_script, "config"),
	emsdk_root,
}

emsdk_libdirs = {}
emsdk_links = {}
emsdk_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { emsdk_includedirs }
	end,

	_add_defines = function()
		defines { emsdk_defines }
	end,

	_add_libdirs = function()
		libdirs { emsdk_libdirs }
	end,

	_add_external_links = function()
		links { emsdk_links }
	end,

	_add_self_links = function()
		links { "emsdk" }
	end,

	_create_projects = function()

project "emsdk"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		emsdk_includedirs,
	}

	defines {}

	files {
		path.join(emsdk_script, "config", "**.h"),
		path.join(emsdk_root, "**.h"),
		path.join(emsdk_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
