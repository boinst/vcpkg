vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO OpenWaterAnalytics/EPANET
    REF v2.2
    SHA512 08f2cfbae2e0ee3dc6fee9dce1f96c609dacca3a4905abb3ffc45372ee94c8903ae8425015eae834747c26b85f5cccfcc729e87825fc2301a127a4f81334ac1e
    HEAD_REF master
    PATCHES
        vcpp.patch
)

# Import the "vcpkg_cmake_build" task.
include("${CMAKE_CURRENT_LIST_DIR}/../vcpkg-cmake/vcpkg_cmake_build.cmake")

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_cmake_build()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/owa-epanet2 RENAME copyright)