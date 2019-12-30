cmake_minimum_required(VERSION 3.9)
project(sample_project_cpp)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED on)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

# detect the current platform
if(WIN32)
	if("${CMAKE_SIZEOF_VOID_P}" STREQUAL "8")
		set(PLATFORM "x64")
	else()
		set(PLATFORM "Win32")
	endif()
elseif(APPLE)
	set(PLATFORM "mac")
else()
	set(PLATFORM "linux")
endif()
message(STATUS "Platfom: ${PLATFORM}")

# set output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/${PLATFORM}/${CMAKE_BUILD_TYPE})
message(STATUS "Output directory: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")

# application
set(SOURCES 
	Sources/Controllers/ControllerOne.cpp
	Sources/Controllers/ControllerOne.h
	Sources/Controllers/ControllerTwo.cpp
	Sources/Controllers/ControllerTwo.h

	Sources/Models/ModelOne.cpp
	Sources/Models/ModelOne.h
	Sources/Models/ModelTwo.cpp
	Sources/Models/ModelTwo.h

	Sources/Views/ViewOne.cpp
	Sources/Views/ViewOne.h
	Sources/Views/ViewTwo.cpp
	Sources/Views/ViewTwo.h
	
	Sources/main.cpp
)

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${SOURCES})

add_executable(${PROJECT_NAME} ${SOURCES})

include_directories (Sources)

# set project as startup project in VS
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})

# verbose output
#set(CMAKE_VERBOSE_MAKEFILE ON)
