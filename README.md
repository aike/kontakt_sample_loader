KONTAKT sample loader
==

A sample batch loader for KONTAKT.  
It is designed to be used with the [CREATOR TOOLS](https://www.native-instruments.com/ni-tech-manuals/creator-tools-manual/en/welcome-to-creator-tools)

## MAPPING EXAMPLE

| filename keyword       |    mapping     |  default value |
|------------------------|----------------|----------------|
| _G + (string)          | Group name     |  Group 1       |
| _V + (int) + _ + (int) | Velocity range |  1 .. 127      |
| _K + (int) + _ + (int) | Key range      |  0 .. 127      |

example:  
+ Mysample_Gguitar_V64_96_K36_48.wav  
  + Group: 'guitar'  
  + Velocity: 64..96
  + Keyrange: 36..48  

## LICENSE

KONTAKT sampling loader is licensed under MIT License.  
Copyright 2023, aike (@aike1000)
