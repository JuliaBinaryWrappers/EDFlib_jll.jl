# Autogenerated wrapper script for EDFlib_jll for x86_64-w64-mingw32
export libedflib

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"

# Relative path to `libedflib`
const libedflib_splitpath = ["bin", "libedflib.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libedflib_path = ""

# libedflib-specific global declaration
# This will be filled out by __init__()
libedflib_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libedflib = "libedflib.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"EDFlib")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libedflib_path = normpath(joinpath(artifact_dir, libedflib_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libedflib_handle = dlopen(libedflib_path)
    push!(LIBPATH_list, dirname(libedflib_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

