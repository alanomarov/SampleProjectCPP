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
file(GLOB_RECURSE HEADERS sources/*.h)
file(GLOB_RECURSE SOURCES sources/*.cpp sources/*.c)
add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS})

# verbose output
#set(CMAKE_VERBOSE_MAKEFILE ON)
