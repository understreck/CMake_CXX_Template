file(GLOB SRC 
    "*.cpp")

list(FILTER SRC EXCLUDE REGEX "main.cpp")

add_library(${APP_NAME}::INTERFACE INTERFACE IMPORTED GLOBAL)

target_sources(${APP_NAME}::INTERFACE
    INTERFACE ${SRC})

target_include_directories(${APP_NAME}::INTERFACE
    INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(${APP_NAME}::INTERFACE)

add_executable(${APP_NAME})

target_sources(${APP_NAME}
    PRIVATE main.cpp)

target_link_libraries(${APP_NAME}
    PRIVATE ${APP_NAME}::INTERFACE)

set_target_properties(${APP_NAME}
    PROPERTIES
        CXX_STANDARD 17
        CXX_STANDARD_REQUIRED TRUE)

if(CMAKE_BUILD_TYPE STREQUAL Release)
    set_target_properties(${APP_NAME}
        PROPERTIES
            INTERPROCEDURAL_OPTIMIZATION TRUE)
endif()

if(CLANG_TIDY)
    set_target_properties(${APP_NAME} PROPERTIES
        CXX_CLANG_TIDY "clang-tidy;-header-filter=./src")
endif()

if(MSVC)
    target_compile_options(${APP_NAME}
        PRIVATE /W4)
else()
    target_compile_options(${APP_NAME}
        PRIVATE -Wall
        PRIVATE -Werror
        PRIVATE -Wextra)
endif()
