import vapoursynth as vs
core = vs.core
core.std.LoadAllPlugins("/usr/src/app/lib")
import havsfunc
clip = core.lsmas.LWLibavSource(source="/usr/src/app/pj.mkv", cache=0)
clip = havsfunc.QTGMC(Input=clip, Preset="Faster", InputType=0, TFF=True, TR2=2, SourceMatch=3)
clip.set_output()