# Origin:

-[https://github.com/NesHacker/DevEnvironmentDemo](https://github.com/NesHacker/DevEnvironmentDemo)


# Assemble:

```
../../common/utilities/cc65/ca65 src/hello_world.s -o hello_world.o
```

# Link:

```
../../common/utilities/cc65/ld65 -C cfg/nes.cfg -o hello_world.nes hello_world.o lib/nes.lib

```

