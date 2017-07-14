def FlagsForFile(filename, **kwargs):
    flags = [
        '-x',
        'c++',
        '-std=c++11'
    ]

    return {
        'flags': flags,
        'do_cache': True
    }
