Glossary
========

.. glossary::

    baremetal
        A system without a (full-fledged) operating system, for example an
        :term:`MCU`-based system. When running on a baremetal system,
        MicroPython effectively functions like a small operating system,
        running user programs and providing a command interpreter
        (:term:`REPL`).

    buffer protocol
        Any Python object that can be automatically converted into bytes, such
        as ``bytes``, ``bytearray``, ``memoryview`` and ``str`` objects, which
        all implement the "buffer protocol".

    board
        Typically this refers to a printed circuit board (PCB) containing a
        :term:`microcontroller <MCU>` and supporting components.
        MicroPython firmware is typically provided per-board, as the firmware
        contains both MCU-specific functionality but also board-level
        functionality such as drivers or pin names.

    bytecode
        A compact representation of a Python program that generated by
        compiling the Python source code. This is what the VM actually
        executes. Bytecode is typically generated automatically at runtime and
        is invisible to the user. Note that while :term:`CPython` and
        MicroPython both use bytecode, the format is different. You can also
        pre-compile source code offline using the :term:`cross-compiler`.

    callee-owned tuple
        This is a MicroPython-specific construct where, for efficiency
        reasons, some built-in functions or methods may reuse the same
        underlying tuple object to return data. This avoids having to allocate
        a new tuple for every call, and reduces heap fragmentation. Programs
        should not hold references to callee-owned tuples and instead only
        extract data from them (or make a copy).

    CircuitPython
        A variant of MicroPython developed by `Adafruit Industries
        <https://circuitpython.org>`_.

    CPython
        CPython is the reference implementation of the Python programming
        language, and the most well-known one. It is, however, one of many
        implementations (including Jython, IronPython, PyPy, and MicroPython).
        While MicroPython's implementation differs substantially from CPython,
        it aims to maintain as much compatibility as possible.

    cross-compiler
        Also known as ``mpy-cross``. This tool runs on your PC and converts a
        :term:`.py file` containing MicroPython code into a :term:`.mpy file`
        containing MicroPython :term:`bytecode`. This means it loads faster (the board
        doesn't have to compile the code), and uses less space on flash (the
        bytecode is more space efficient).

    driver
        A MicroPython library that implements support for a particular
        component, such as a sensor or display.

    FFI
        Acronym for Foreign Function Interface. A mechanism used by the
        :term:`MicroPython Unix port` to access operating system functionality.
        This is not available on :term:`baremetal` ports.

    filesystem
        Most MicroPython ports and boards provide a filesystem stored in flash
        that is available to user code via the standard Python file APIs such
        as ``open()``. Some boards also make this internal filesystem
        accessible to the host via USB mass-storage.

    frozen module
        A Python module that has been cross compiled and bundled into the
        firmware image. This reduces RAM requirements as the code is executed
        directly from flash.

    Garbage Collector
        A background process that runs in Python (and MicroPython) to reclaim
        unused memory in the :term:`heap`.

    GPIO
        General-purpose input/output. The simplest means to control electrical
        signals (commonly referred to as "pins") on a microcontroller. GPIO
        typically allows pins to be either input or output, and to set or get
        their digital value (logical "0" or "1"). MicroPython abstracts GPIO
        access using the :class:`machine.Pin` and :class:`machine.Signal`
        classes.

    GPIO port
        A group of :term:`GPIO` pins, usually based on hardware properties of
        these pins (e.g. controllable by the same register).

    heap
        A region of RAM where MicroPython stores dynamic data. It is managed
        automatically by the :term:`Garbage Collector`. Different MCUs and
        boards have vastly different amounts of RAM available for the heap, so
        this will affect how complex your program can be.

    interned string
        An optimisation used by MicroPython to improve the efficiency of
        working with strings. An interned string is referenced by its (unique)
        identity rather than its address and can therefore be quickly compared
        just by its identifier. It also means that identical strings can be
        de-duplicated in memory. String interning is almost always invisible to
        the user.

    MCU
        Microcontroller. Microcontrollers usually have much less resources
        than a desktop, laptop, or phone, but are smaller, cheaper and
        require much less power. MicroPython is designed to be small and
        optimized enough to run on an average modern microcontroller.

    micropython-lib
        MicroPython is (usually) distributed as a single executable/binary
        file with just few builtin modules. There is no extensive standard
        library comparable with :term:`CPython`'s. Instead, there is a related,
        but separate project `micropython-lib
        <https://github.com/micropython/micropython-lib>`_ which provides
        implementations for many modules from CPython's standard library.

        Some of the modules are implemented in pure Python, and are able to
        be used on all ports. However, the majority of these modules use
        :term:`FFI` to access operating system functionality, and as such can
        only be used on the :term:`MicroPython Unix port` (with limited support
        for Windows).

        Unlike the :term:`CPython` stdlib, micropython-lib modules are
        intended to be installed individually - either using manual copying or
        using :term:`mip`.

    MicroPython port
        MicroPython supports different :term:`boards <board>`, RTOSes, and
        OSes, and can be relatively easily adapted to new systems. MicroPython
        with support for a particular system is called a "port" to that
        system. Different ports may have widely different functionality. This
        documentation is intended to be a reference of the generic APIs
        available across different ports ("MicroPython core"). Note that some
        ports may still omit some APIs described here (e.g. due to resource
        constraints). Any such differences, and port-specific extensions
        beyond the MicroPython core functionality, would be described in the
        separate port-specific documentation.

    MicroPython Unix port
        The unix port is one of the major :term:`MicroPython ports
        <MicroPython port>`. It is intended to run on POSIX-compatible
        operating systems, like Linux, MacOS, FreeBSD, Solaris, etc. It also
        serves as the basis of Windows port. The Unix port is very useful for
        quick development and testing of the MicroPython language and
        machine-independent features. It can also function in a similar way to
        :term:`CPython`'s ``python`` executable.

    mip
        A package installer for MicroPython (mip - "mip installs packages"). It
        installs MicroPython packages either from :term:`micropython-lib`,
        GitHub, or arbitrary URLs.  mip can be used on-device on
        network-capable boards, and internally by tools such
        as :term:`mpremote`.

        See :ref:`packages` for more information on using ``mip``.

    mpremote
        A tool for interacting with a MicroPython device. See :ref:`mpremote`.

    .mpy file
        The output of the :term:`cross-compiler`. A compiled form of a
        :term:`.py file` that contains MicroPython :term:`bytecode` instead of
        Python source code.

    native
        Usually refers to "native code", i.e. machine code for the target
        microcontroller (such as ARM Thumb, Xtensa, x86/x64). The ``@native``
        decorator can be applied to a MicroPython function to generate native
        code instead of :term:`bytecode` for that function, which will likely be
        faster but use more RAM.

    port
        Usually short for :term:`MicroPython port`, but could also refer to
        :term:`GPIO port`.

    .py file
        A file containing Python source code.

    REPL
        An acronym for "Read, Eval, Print, Loop". This is the interactive
        Python prompt, useful for debugging or testing short snippets of code.
        Most MicroPython boards make a REPL available over a UART, and this is
        typically accessible on a host PC via USB.

    small integer
        MicroPython optimises the internal representation of integers such that
        "small" values do not take up space on the heap, and calculations with
        them do not require heap allocation. On most 32-bit ports, this
        corresponds to values in the interval ``-2**30 <= x < 2**30``, but this
        should be considered an implementation detail and not relied upon.

    stream
        Also known as a "file-like object". A Python object which provides
        sequential read-write access to the underlying data. A stream object
        implements a corresponding interface, which consists of methods like
        ``read()``, ``write()``, ``readinto()``, ``seek()``, ``flush()``,
        ``close()``, etc. A stream is an important concept in MicroPython;
        many I/O objects implement the stream interface, and thus can be used
        consistently and interchangeably in different contexts. For more
        information on streams in MicroPython, see the `io` module.

    UART
        Acronym for "Universal Asynchronous Receiver/Transmitter". This is a
        peripheral that sends data over a pair of pins (TX & RX). Many boards
        include a way to make at least one of the UARTs available to a host PC
        as a serial port over USB.

    upip
        A now-obsolete package manager for MicroPython, inspired
        by :term:`CPython`'s pip, but much smaller and with reduced
        functionality. See its replacement, :term:`mip`.

    webrepl
        A way of connecting to the REPL (and transferring files) on a device
        over the internet from a browser. See https://micropython.org/webrepl
