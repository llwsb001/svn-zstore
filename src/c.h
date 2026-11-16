/* C surface consumed by the Zig zstore backend. */
#include <apr.h>
#include <apr_pools.h>
#include <apr_hash.h>
#include <apr_tables.h>
#include <apr_strings.h>
#include <apr_file_io.h>
#include "svn_error.h"
#include "svn_types.h"
#include "svn_string.h"
#include "svn_pools.h"
#include "svn_delta.h"
#include "svn_checksum.h"
#include "svn_fs.h"
#include "svn_utf.h"
#include "private/svn_fs_util.h"
#include "fs-loader.h"
