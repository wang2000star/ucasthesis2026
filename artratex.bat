@rem ------------------------------------------------
@rem            LaTeX Automated Compiler
@rem                <By Huangrui Mo>
@rem Copyright (C) Huangrui Mo <huangrui.mo@gmail.com>
@rem Copyright (C) 2026 Kaqiu Pi <wwwdream521@163.com>
@rem
@rem This is free software: you can redistribute it
@rem and/or modify it under the terms of the GNU General
@rem Public License as published by the Free Software
@rem Foundation, either version 3 of the License, or
@rem (at your option) any later version.
@rem
@rem This software is distributed in the hope that it
@rem will be useful, but WITHOUT ANY WARRANTY; without
@rem even the implied warranty of MERCHANTABILITY or
@rem FITNESS FOR A PARTICULAR PURPOSE. See the GNU
@rem General Public License for more details.
@rem
@rem You should have received a copy of the GNU General
@rem Public License along with this software. If not,
@rem see <https://www.gnu.org/licenses/>.
@rem ------------------------------------------------
@echo off
@rem ------------------------------------------------
@rem ->> Set tex compiler
@rem ------------------------------------------------
set CompilerOrder="2"
@rem ------------------------------------------------
if %CompilerOrder% == "1" (
set CompileName="pdflatex"
) else (
set CompileName="xelatex"
)
@rem ------------------------------------------------
@rem ->> Get source filename
@rem ------------------------------------------------
for %%F in (*.tex) do (
set FileName=%%~nF
)
@rem ------------------------------------------------
@rem ->> Set directory
@rem ------------------------------------------------
if not exist "./Tmp" (
 md Tmp
 )
@rem ------------------------------------------------
@rem ->> Set environmental variables
@rem ------------------------------------------------
set TEXINPUTS=.//;%TEXINPUTS%
set BIBINPUTS=.//;%BIBINPUTS%
set BSTINPUTS=.//;%BSTINPUTS%
@rem ------------------------------------------------
@rem ->> Build textual content
@rem ------------------------------------------------
%CompileName% -output-directory=Tmp %FileName%
@rem ------------------------------------------------
@rem ->> Build references and links
@rem ------------------------------------------------
bibtex ./Tmp/%FileName%
%CompileName% -output-directory=Tmp %FileName%
%CompileName% -output-directory=Tmp %FileName%
@rem ------------------------------------------------
@rem ->> View compiled file
@rem ------------------------------------------------
@rem start  " " /max "./Tmp/%FileName%.pdf"
echo ------------------------------------------------
echo %CompileName% %FileName%.tex finished...
echo ------------------------------------------------
