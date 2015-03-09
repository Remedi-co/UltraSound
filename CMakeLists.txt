project(Remedi_Ultrasound)
 
cmake_minimum_required(VERSION 2.8)
 
SET ( REMEDI_TITLE "Remedi\ UltraSound" )
SET ( REMEDI_VERSION "0.0.0-cmake" )
OPTION(BUILD_REMEDI_DOCUMENTATION "Create doxygen documentation for developers" ON)

#add_subdirectory(src)
add_subdirectory(doc)

