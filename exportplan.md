# Feature: Create a modal with export options

We need to provide these options:
- export triggers to MIDI
- Export audio
- export stem

Whatever resources we need to generate audio should be copied, and calculated offline - do not block main thread
Exporting MIDI should generate a MIDI file with the triggers as notes in the MIDI file
User should be able to copy audio or MIDI to their clipboard
Modal should probably block UI interaction when generating audio or MIDI
