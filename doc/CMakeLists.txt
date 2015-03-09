IF (BUILD_REMEDI_DOCUMENTATION)

    FIND_PACKAGE(Doxygen)

    IF(DOXYGEN_FOUND)
        SET(DOXYGEN_LANGUAGE "English" CACHE STRING "Language used by doxygen")
        MARK_AS_ADVANCED(DOXYGEN_LANGUAGE)

        # Images
        SET( CMAKE_DOXYGEN_IMAGE_PATH   "${CMAKE_CURRENT_SOURCE_DIR}/img"  )
        SET( CMAKE_DOXYGEN_PROJECT_LOGO ""  )

        # Inputs
        SET( DOXYGEN_SOURCE_DIR         "${CMAKE_SOURCE_DIR}/src
                                         ${CMAKE_SOURCE_DIR}/tst
                                         ${CMAKE_SOURCE_DIR}/doc/pages
                                         ${PROJECT_SOURCE_DIR}/README.md"  )
        STRING(REGEX REPLACE "[\n ]+" " " CMAKE_DOXYGEN_INPUT_LIST "${DOXYGEN_SOURCE_DIR}")

        # Latex settings
        SET( CMAKE_DOXYGEN_LATEX_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/conf/header.tex"  )
        SET( CMAKE_DOXYGEN_LATEX_FOOTER "${CMAKE_CURRENT_SOURCE_DIR}/conf/footer.tex"  )

        CONFIGURE_FILE(Doxyfile.in ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

        # Use 'make doc' to build the documentation
        SET( DOC_TARGET "doc" )

        ADD_CUSTOM_TARGET(${DOC_TARGET} ALL
                ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
                DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

    ELSE(DOXYGEN_FOUND)
        MESSAGE (FATAL_ERROR "To build documentation Doxygen is needed, could not find doxygen binary")
    ENDIF(DOXYGEN_FOUND)

ENDIF (BUILD_REMEDI_DOCUMENTATION)

