%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  _    _ _____   _         _____   __   __  _____ _               
% | |  | /  ___| | |       |_   _|  \ \ / / /  __ \ |              
% | |  | \ `--.  | |     __ _| | ___ \ V /  | /  \/ | __ _ ___ ___ 
% | |/\| |`--. \ | |    / _` | |/ _ \/   \  | |   | |/ _` / __/ __|
% \  /\  /\__/ / | |___| (_| | |  __/ /^\ \ | \__/\ | (_| \__ \__ \
%  \/  \/\____/  \_____/\__,_\_/\___\/   \/  \____/_|\__,_|___/___/

% Classe LaTeX para documentos científicos segundo as normas ABNT

% Aviso de Direitos Autorais:

% Este template LaTeX é protegido por direitos autorais e foi 
% disponibilizado para seu uso pessoal e/ou educacional pelo autor. 
% Qualquer alteração, reprodução ou distribuição deste template, no 
% todo ou em parte, sem consentimento expresso do autor é 
% estritamente proibida e sujeita às leis de direitos autorais 
% aplicáveis.

% O autor deste template investiu tempo e esforço significativos na 
% sua criação, visando fornecer uma ferramenta útil e de qualidade 
% para a comunidade acadêmica. Portanto, para garantir o respeito ao 
% seu trabalho e direitos autorais, solicita-se que qualquer 
% modificação, adaptação ou compartilhamento deste template seja 
% feito somente após obtenção do consentimento por escrito do autor.
%
% O não cumprimento destas condições pode resultar em consequências 
% legais, incluindo, mas não se limitando a ações judiciais por 
% violação de direitos autorais.
%
% Agradeço pela compreensão e cooperação no respeito aos direitos 
% autorais e à propriedade intelectual.

% Autor: Wladimir Seixas
% email: seixas@ufscar.br
% Versão: 15/05/2025
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wstex}[2025 WSTeX]

% Permite controle condicional do código LaTeX, similar ao "if" de 
% linguagens de programação.
\RequirePackage{ifthen}

\newif\if@relatorio
\newif\if@tcc
\newif\if@mestre
\newif\if@doutor

% Define a variável curso de graduação
\def\curso#1{\gdef\@curso{#1}}
\curso{Licenciatura/Bacharelado}

% Opções de documentos
\DeclareOption{relatorio}{\@relatoriotrue}
\DeclareOption{tcc}{\@tcctrue}
\DeclareOption{licenciatura}{\curso{Licenciatura}}
\DeclareOption{bacharelado}{\curso{Bacharelado}}
\DeclareOption{mestre}{\@mestretrue}
\DeclareOption{doutor}{\@doutortrue}

% Opção para a impressão Frente-Verso. Não usar na versão digital
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{report}}

\ProcessOptions

% ABNT: Formato
% Papel​: A4 - se impresso, utilizar papel branco ou reciclado 
%             e pode-se utilizar verso e anverso.
% Elementos pré-textuais ​ devem iniciar sempre no anverso.

\LoadClass[12pt,a4paper,openright,fleqn]{report}

% ABNT: Fonte​ :
% Para todo texto: tamanho 12 e recomenda-se escolher um tipo de 
% fonte legível como a Times New Roman ou Arial.

% Define a codificação de caracteres do documento, permitindo o 
% uso de acentos e caracteres especiais.
\RequirePackage[T1]{fontenc}

% Carrega a fonte mathptmx, popular para símbolos matemáticos.
\RequirePackage{mathptmx} % Selecao de codigos de fonte Times.

% Fornece comandos para alterar a caixa (maiúsculas/minúsculas) 
% do texto. Não permitir caixa-alta nos títulos matemáticos.
% \MakeTextUppercase -> textcase
\RequirePackage[overload]{textcase}

% Codificacao do documento (conversão automática dos acentos)	
\RequirePackage[utf8]{inputenc}

% Permite a adaptação do LaTeX para diferentes idiomas, incluindo 
% hifenização e formatação.
\RequirePackage[brazil]{babel}

% Ajusta espaçamentos mínimos entre letras para melhorar a aparência 
% tipográfica.
\RequirePackage[babel=true]{microtype}

% Modo frente-verso: inicia capítulo sempre em página de número ímpar
% Caso o capítulo termine em página em branco elimina o cabeçalho
\def\cleardoublepage{%
	\clearpage
	\if@twoside \ifodd \c@page
		\else \hbox{} \vspace*{\fill}
			\thispagestyle{empty}
			\newpage
		\fi
	\fi
}

% ABNT: Margens​ :
% Anverso​ : esquerda e superior 3 cm / direita e inferior 2 cm;
% Verso ​  : direita e inferior 3 cm / esquerda e superior 2 cm.*
% O verso da folha somente será utilizado para os trabalhos impressos.

% Define o layout da página, incluindo margens, tamanho do papel e 
% cabeçalho/rodapé.
\RequirePackage{geometry}
\geometry{right=2cm,left=3cm,top=3cm,bottom=2cm}

% ABNT: Espaçamento
% Texto: 1,5 entrelinhas

% Controla o espaçamento entre linhas do texto.
\RequirePackage{setspace}
\onehalfspacing

% Não centraliza a página verticalmente
\raggedbottom

% Inclui imagens de diversos formatos (JPG, PNG etc.) no documento.
\RequirePackage{graphicx}

% Auxilia no posicionamento de elementos flutuantes como figuras e 
% tabelas.
\RequirePackage{float}

% Parágrafo após um capítulo/seção
% ABNT: Início do parágrafo = 1.2cm

% Indenta o primeiro parágrafo de cada seção.
\RequirePackage{indentfirst}
\setlength{\parindent}{1.2cm}

% Personaliza o cabeçalho e rodapé do documento.
\RequirePackage{fancyhdr}

% Oferece diversas ferramentas para manipulação de variáveis e 
% condicionais dentro do LaTeX.
\RequirePackage{etoolbox}

\pagestyle{fancy}
\fancyhead{}
\if@twoside \fancyhead[LE,RO]{\footnotesize\thepage} % Frente-verso
\else \fancyhead[R]{\footnotesize\thepage}     % Versão digital
\fi
\fancyfoot{}
\renewcommand{\headrule}{}

% ABNT: Fontes das Ilustrações e das Tabelas recomenda-se utilizar uma 
% fonte menor, por exemplo 10 e espaçamento simples.
% Citações com mais de três linhas, Notas de Rodapé, Referências, 
% Legendas das % ilustrações e das tabelas: espaçamento simples.

\renewenvironment{quote}
{\list{}{\setlength{\leftmargin}{4cm}}%
	\item \singlespace\footnotesize \relax}
{\endlist}

% ABNT: Legendas para figuras e tabelas

% Define legendas para figuras e tabelas.
\RequirePackage{caption}
\captionsetup{font={footnotesize,stretch=1},
	format=hang,
	labelsep=endash,
	belowskip=12pt,
	aboveskip=12pt
}%

% ABNT: Nota de rodapé 

% Modifica a aparência das notas de rodapé.
\RequirePackage[hang]{footmisc}
\interfootnotelinepenalty=\@M
\renewcommand{\footnoterule}{%
	\kern -3pt
	\hrule width 3cm height 1pt
	\kern 2pt
}

% ABNT: Numeração sequencial para a nota de rodapé
\counterwithout{footnote}{chapter}

% ABNT: Formatação para itemize, enumerate e description

% Controla a formatação de listas enumeradas e itemizada
\RequirePackage{enumitem}
\setlist[itemize]{leftmargin=1.7cm}
\setlist[enumerate]{leftmargin=1.7cm,label=\alph*)}
\renewcommand\labelitemi{--}

% ABNT: Informações na folha de rosto (natureza, tipo de trabalho,
% objetivo, nome da instituição, área de concentração: ​ espaçamento 
% simples. Na folha de rosto as informações referentes ao tipo de 
% trabalho, objetivo, nome da instituição e área de concentração, 
% devem ser alinhados do meio da folha para a margem direita

% Variável autor
\def\autor#1{\gdef\@autor{#1}}
\global\let\@autor\@empty

% Variável autora
\def\autora#1{\gdef\@autora{#1}}
\global\let\@autora\@empty

% Área - Mestrado/Doutorado
\def\area#1{\gdef\@area{#1}}
\global\let\@area\@empty

% Variável instituição
\def\instituicao#1{\gdef\@instituicao{#1}}
\global\let\@instituicao\@empty

% Variável centro
\def\centro#1{\gdef\@centro{#1}}
\global\let\@centro\@empty

% Variável programa/depto responsável
\def\progresp#1{\gdef\@progresp{#1}}
\global\let\@progresp\@empty

% Variável objetivo
\def\objetivo#1{\gdef\@objetivo{#1}}
\global\let\@objetivo\@empty

\if@tcc \def\@objetivo{%
		Monografia apresentada ao Curso de {\@curso}
		da {\@instituicao}.}
\else
	\if@mestre
		\def\@objetivo{%
			Dissertação apresentada ao {\@progresp} como requisito parcial
			para a obtenção do grau de
			\ifx\@area\@empty
				\ifx\@autora\@empty Mestre. \else Mestra. \fi
			\else
				\ifx\@autora\@empty Mestre \@area. \else Mestra \@area. \fi
			\fi
		}
	\else
		\if@doutor
			\def\@objetivo{%
			Tese apresentada ao {\@progresp} como requisito parcial
			para a obten\c{c}\~{a}o do grau de
			\ifx\@area\@empty
				\ifx\@autora\@empty Doutor. \else Doutora. \fi
			\else
				\ifx\@autora\@empty Doutor \@area. \else Doutora \@area. \fi
			\fi
			}
		\fi \fi \fi

% Variável título do trabalho
\def\titulo#1{\gdef\@titulo{#1}}
\global\let\@titulo\@empty

% Variável orientador
\def\orientador#1{\gdef\@orientador{#1}}
\global\let\@orientador\@empty

% Variável orientadora
\def\orientadora#1{\gdef\@orientadora{#1}}
\global\let\@orientadora\@empty

% Variável co-orientador
\def\coorientador#1{\gdef\@coorientador{#1}}
\global\let\@coorientador\@empty

% Variável co-orientadora
\def\coorientadora#1{\gdef\@coorientadora{#1}}
\global\let\@coorientadora\@empty

% Variável ano da apresentação do trabalho
\def\ano#1{\gdef\@ano{#1}}
\ano{\year}

% Variável local da apresentação do trabalho
\def\local#1{\gdef\@local{#1}}
\global\let\@local\@empty

% Define orientação do trabalho
\def\orientacao#1{\gdef\@orientacao{#1}}
\global\let\@orientacao\@empty

\def\@orientacao{%
	\vspace{\baselineskip}
	\begin{minipage}[t]{0.5\textwidth}
		\ifx \@orientador\@empty\relax \else \noindent \newline Orientador: Prof. Dr. \@orientador\fi
		\ifx \@orientadora\@empty\relax \else \noindent \newline Orientadora: Profa. Dra. \@orientadora\fi
		\ifx \@coorientador\@empty\relax \else \noindent \newline Coorientador: Prof. Dr. \@coorientador\fi
		\ifx \@coorientadora\@empty\relax \else \noindent \newline Coorientadora: Profa. Dra. \@coorientadora\fi
	\end{minipage}
}

% Define a variável logo com o arquivo
\def\logotipo#1{\gdef\@logotipo{#1}}
\global\let\@logotipo\@empty

% Capa
\newcommand\capa{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\ps@empty
	\begin{singlespace}
		\parindent \z@ \centering
		\includegraphics[width=3cm,height=3cm,keepaspectratio]{\@logotipo} \par \vskip 1em
		\begin{minipage}[c]{\textwidth}
			\begin{center}
				{\MakeUppercase{\@instituicao}} \\
				{\MakeUppercase{\@centro}} \\
				{\MakeUppercase{\@progresp}}
			\end{center}
		\end{minipage}
		\par
		\vskip 0.2\textheight
		\ifx \@autora\@empty \relax \else \autor{\@autora} \fi
		{\MakeUppercase{\@autor} \par}
		\vfill
		{\MakeTextUppercase{\@titulo} \par}
		\vfill
		{\MakeUppercase{\@local} \par}
		\@ano
		\null
	\end{singlespace} \null\newpage
}

% Folha de rosto
\newcommand\folhaderosto{%
	\setcounter{page}{1}
	\if@openright\cleardoublepage\else\clearpage\fi
	\ps@empty
	\begin{singlespace}
		\parindent \z@ \centering
		\ifx \@autora\@empty \relax \else \autor{\@autora} \fi
		{\MakeUppercase{\@autor} \par}
		\vfill
		{\MakeTextUppercase{\@titulo} \par}
		\vfill
		{\parindent \z@ \flushright%
			\begin{minipage}[t]{0.5\textwidth}
				\@objetivo
			\end{minipage} \par}
		\if@relatorio \relax \else {\parindent \z@ \flushright \@orientacao \par} \fi
		\vfill
		{\parindent \z@ \centering \MakeUppercase{\@local} \par}
		\@ano
		\null
	\end{singlespace} \null\newpage
}

% Incluir PDF: Ficha catalográfica e Folha de Aprovação

% Insere páginas inteiras de outros documentos PDF.
\RequirePackage{pdfpages}
\newif\ifficha

% ABNT: Ficha catalográfica
% Esta página não deve ser contada
%\newcommand{\fichacatalografica}[2][]{
%      \ps@empty
%      \if@twoside \relax \else \addtocounter{page}{-1} \fi       
%      \includepdf[width=#1\textwidth]{#2}
%      \fichatrue
%}
\newcommand{\fichacatalografica}[2][]{
	\ps@empty
	\if@twoside \relax \else \addtocounter{page}{-1} \fi
	\includepdf[width=#1\textwidth]{#2}
	\fichatrue
}

% ABNT: Folha de aprovação
\newcommand{\folhaaprovacao}[2][]{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\ps@empty
	\includepdf[width=#1\textwidth]{#2}
	\if@twoside \ifficha \null\newpage \fi \fi
}

% ABNT: Abertura do capítulo
\def\@chapapp{}
\def\@alinhar{\raggedright}
\def\@espaco{\space}
\def\@makechapterhead#1{%
	{\parindent \z@ \@alinhar
			{\normalfont\large\bfseries\MakeTextUppercase{\@chapapp}\space\thechapter\@espaco\space
				\interlinepenalty\@M
				\MakeTextUppercase{#1}}\par\nobreak
			\vskip \baselineskip}
}

\def\@makeschapterhead#1{% 
	{\parindent \z@
			{\hfill\normalfont\large\bfseries\MakeTextUppercase{#1}\hfill\null}\par\nobreak
			\vskip \baselineskip}
}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
  \pagestyle{fancy}%
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter}

\renewcommand{\section}{\@startsection{section}{1}{\z@}%
	{\baselineskip}%
	{\baselineskip}%
	{\normalfont\large\MakeTextUppercase}}

\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
	{\baselineskip}%
	{\baselineskip}%
	{\normalfont\bfseries}}

\renewcommand{\subsubsection}{\@startsection{subsubsection}{2}{\z@}%
	{\baselineskip}%
	{\baselineskip}%
	{\normalfont}}

% ABNT: Numera as subsubseções
\setcounter{secnumdepth}{3}

% ABNT: Sumário/Lista de Figuras/Lista de Tabelas

% Adiciona as subsubseções no Sumário
\setcounter{tocdepth}{3}

% Permite personalizar a aparência do Sumário.
\RequirePackage{tocloft}

% Sumário
\renewcommand{\cfttoctitlefont}{\hfill\large\bfseries\MakeUppercase}
\renewcommand{\cftaftertoctitle}{\hfill\null}
\setlength{\cftbeforetoctitleskip}{-\baselineskip}
\setlength{\cftaftertoctitleskip}{\baselineskip}
\setlength{\cftbeforechapskip}{0.25\baselineskip}
\setlength{\cftbeforesecskip}{0.25\baselineskip}

% Lista de figuras
\renewcommand{\cftloftitlefont}{\hfill\large\bfseries\MakeUppercase}
\renewcommand{\cftafterloftitle}{\hfill\null}
\setlength{\cftbeforeloftitleskip}{-\baselineskip}
\setlength{\cftafterloftitleskip}{\baselineskip}
\setlength{\cftfigindent}{0pt}
\renewcommand{\cftfigpresnum}{Figura }
\renewcommand{\cftfigaftersnum}{\enspace -- \enspace}
\addtolength{\cftfignumwidth}{3em}
% Numeração sequencial para as figuras 
\counterwithout{figure}{chapter}

% Lista de tabelas
\renewcommand{\cftlottitlefont}{\hfill\large\bfseries\MakeUppercase}
\renewcommand{\cftafterlottitle}{\hfill\null}
\setlength{\cftbeforelottitleskip}{-\baselineskip}
\setlength{\cftafterlottitleskip}{\baselineskip}
\setlength{\cfttabindent}{0pt}
\renewcommand{\cfttabpresnum}{Tabela }
\renewcommand{\cfttabaftersnum}{\enspace -- \enspace}
\addtolength{\cfttabnumwidth}{3em}
% Numeração sequencial para as tabelas
\counterwithout{table}{chapter}

% Lista de quadros (já com numeração sequencial)
\DeclareCaptionType[within=none]{quadro}[Quadro][Lista de Quadros]
\PrepareListOf{quadro}{\renewcommand{\cftfigpresnum}{Quadro }}

\tocloftpagestyle{empty}

% Formatação de capítulos e seções
\renewcommand{\cftchapfont}{\large\bfseries}
\patchcmd{\l@chapter}{#1}{\MakeTextUppercase #1}{}{}
\renewcommand\cftchappagefont{\large}

\renewcommand{\cftsecfont}{\large}
\patchcmd{\l@section}{#1}{\MakeTextUppercase #1}{}{}
\renewcommand\cftsecpagefont{\large}

\setlength{\cftsecindent}{0pt}

\renewcommand{\cftsubsecfont}{\normalsize\bfseries}
\setlength{\cftsubsecindent}{0pt}

\renewcommand{\cftsubsubsecfont}{\normalsize}
\setlength{\cftsubsubsecindent}{0pt}

\newlength{\sizenumber}
\settowidth{\sizenumber}{MMM}

\setlength{\cftchapnumwidth}{\sizenumber}
\setlength{\cftsecnumwidth}{\sizenumber}
\setlength{\cftsubsecnumwidth}{\sizenumber}
\setlength{\cftsubsubsecnumwidth}{\sizenumber}

% Pontos no Sumário/Lista
%\renewcommand{\cftdot}{} % remove os pontos 
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftdotsep}{1}

% Texto matemático

% Pacote essencial para símbolos e equações matemáticas avançadas.
% Equações alinhamento à esquerda
\RequirePackage[fleqn]{amsmath}
\setlength{\mathindent}{1.2cm}

% Complementa amsmath com fontes adicionais para símbolos matemáticos.
\RequirePackage{amsfonts}
% Oferece símbolos matemáticos científicos comuns.
\RequirePackage{amssymb}

% Inserir em todos os ambientes matemáticos o comando \displaystyle
\everymath{\displaystyle}

% Melhora a aparência das referências cruzadas no texto.
\RequirePackage{varioref}
% Equações são enumeradas continuamente.
\counterwithout{equation}{chapter}
% Referência numérica de uma equação estará entre parêntesis.
\labelformat{equation}{(#1)}

% Redefine funções matemáticas em português
\def\sin{\mathop{\operator@font sen}\nolimits}
\def\sinh{\mathop{\operator@font senh}\nolimits}
\def\arcsinh{\mathop{\operator@font arcsenh}\nolimits}
\def\card{\mathop{\operator@font card}\nolimits}
\def\gcd{\mathop{\operator@font mdc}\nolimits}

% Cria ambientes para teoremas, definições etc. com numeração 
% automática.
\RequirePackage{amsthm}
\def\proofname{Demonstraç\~{a}o}
\theoremstyle{plain}% default
\newtheorem{teorema}{Teorema}
\newtheorem{lema}{Lema}
\newtheorem{proposicao}{Proposi\c{c}\~{a}o}
\newtheorem{corolario}{Corol\'{a}rio}
\theoremstyle{definition}
\newtheorem{definicao}{Defini\c{c}\~{a}o}
\newtheorem{conjectura}{Conjectura}
\newtheorem{axioma}{Axioma}
\newtheorem{exemplo}{Exemplo}

% ABNT: Elementos pré-textuais

% Ambiente para a dedicatória - opcional
\newenvironment{dedicatoria}{\dedinicio}{\null\newpage}
\def\dedinicio{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\ps@empty
	\null\vfill
	\@beginparpenalty\@lowpenalty
	\raggedleft\normalfont\sl\@endparpenalty\@M}

% Ambiente para os agradecimentos - opcional
\newenvironment{agradecimentos}{\agradinicio}{\newpage}
\def\agradinicio{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\ps@empty
	{\parindent \z@ \centering
		\normalfont\large\bfseries AGRADECIMENTOS \par}
	\vskip \baselineskip
	\normalfont}

% Ambiente para a epígrafe - opcional
\newenvironment{epigrafe}{\epinicio}{\newpage}
\def\epinicio{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\ps@empty
	\null\vfill
	\raggedleft\normalfont\sl}

% Ambiente para o Resumo/Abstract - obrigatório
\def\palavrachaveI#1#2{\pcI{#1} \ecI{#2}}
\def\pcI#1{\gdef\@pcI{#1}}
\global\let\@pcI\@empty
\def\ecI#1{\gdef\@ecI{#1}}
\global\let\@ecI\@empty

\def\palavrachaveII#1#2{\pcII{#1} \ecII{#2}}
\def\pcII#1{\gdef\@pcII{#1}}
\global\let\@pcII\@empty
\def\ecII#1{\gdef\@ecII{#1}}
\global\let\@ecII\@empty

\def\palavrachaveIII#1#2{\pcIII{#1} \ecIII{#2}}
\def\pcIII#1{\gdef\@pcIII{#1}}
\global\let\@pcIII\@empty
\def\ecIII#1{\gdef\@ecIII{#1}}
\global\let\@ecIII\@empty

\def\palavrachaveIV#1#2{\pcIV{#1} \ecIV{#2}}
\def\pcIV#1{\gdef\@pcIV{#1}}
\global\let\@pcIV\@empty
\def\ecIV#1{\gdef\@ecIV{#1}}
\global\let\@ecIV\@empty

\def\palavrachaveV#1#2{\pcV{#1} \ecV{#2}}
\def\pcV#1{\gdef\@pcV{#1}}
\global\let\@pcV\@empty
\def\ecV#1{\gdef\@ecV{#1}}
\global\let\@ecV\@empty

% Página do resumo/palavras-chave - obrigatório
\newenvironment{resumo}{\resumoinicio}{\resumofim}
\def\resumoinicio{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\ps@empty
	{\parindent \z@ \centering
		\normalfont\large\bfseries RESUMO \par}
	\vskip \baselineskip
	\normalfont
}

\def\resumofim{\null\vskip \baselineskip \par\noindent
	\ifx \@pcI\@empty \null
	\else
		\ifx \@pcII\@empty {\bf Palavra-chave:} \@pcI.
		\else
			\ifx \@pcIII\@empty {\bf Palavras-chave:} \@pcI. \@pcII.
			\else
				\ifx \@pcIV\@empty {\bf Palavras-chave:} \@pcI. \@pcII. \@pcIII.
				\else
					\ifx \@pcV\@empty {\bf Palavras-chave:} \@pcI. \@pcII. \@pcIII. \@pcIV.
					\else {\bf Palavras-chave:} \@pcI. \@pcII. \@pcIII. \@pcIV. \@pcV.
					\fi
				\fi
			\fi
		\fi
	\fi \newpage
}

% Comando para o abstract/key-words - obrigatório
\renewenvironment{abstract}{\absinicio}{\absfim}
\def\absinicio{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\ps@empty
	{\parindent \z@ \centering
		\normalfont\large\bfseries ABSTRACT \par}
	\vskip \baselineskip
	\normalfont
}

\def\absfim{\null\vskip \baselineskip \par\noindent
	\ifx \@ecI\@empty \null
	\else
		\ifx \@ecII\@empty {\bf Keyword:} \@ecI.
		\else
			\ifx \@ecIII\@empty {\bf Keywords:} \@ecI. \@ecII.
			\else
				\ifx \@ecIV\@empty {\bf Keywords:} \@ecI. \@ecII. \@ecIII.
				\else
					\ifx \@ecV\@empty {\bf Keywords:} \@ecI. \@ecII. \@ecIII. \@ecIV.
					\else {\bf Keywords:} \@ecI. \@ecII. \@ecIII. \@ecIV. \@ecV.
					\fi
				\fi
			\fi
		\fi
	\fi \newpage
}

% ABNT: Formatação do Índice remissivo - opcional
% Gera índices remissivos automáticos.
% imakeidx deve ser carregado antes de hyperref
\RequirePackage{imakeidx}
\makeindex[columns=1,intoc=true,title=\'{I}NDICE REMISSIVO]
\indexsetup{firstpagestyle=fancy}

% Cria links clicáveis para URLs, referências cruzadas e outras 
% funcionalidades.
\RequirePackage[linktocpage=true]{hyperref}

% Permite o uso de cores no texto.
\RequirePackage{color}
% Atribui a cor azul escuro para o hyperlink
\definecolor{corlink}{rgb}{0.2, 0.2, 0.6}
% Altera a cor do hyperlink para preto
%\newcommand{\nocolorlink}{\definecolor{Blue}{rgb}{0,0,0}}

% Informações do PDF
\hypersetup{%
	colorlinks=true,       	   % true: links são coloridos
	linkcolor=corlink,          % cores para links internos
	citecolor=corlink,          % cores para links da bibliografia
	filecolor=magenta,          % cores para links de arquivos
	urlcolor=corlink,           % cores para links de URL
	bookmarksdepth=4,
}

% ABNT: Referências - obrigatório

% Recursos avançados para formatação de citações no LaTeX.
\RequirePackage{csquotes}
% Gerencia bibliografias e citações com mais flexibilidade que o BibTeX padrão.
% style = citações norma ABNT
% backref = páginas com as citações
\RequirePackage[backend=biber,style=abnt,backref=true]{biblatex}
\setlength\bibitemsep{\baselineskip}
\renewcommand*{\UpperOrSCCite}[1]{#1}

% Define o arquivo de referencias
\addbibresource{referencias.bib}

% ABNT: Formatação do Apêndice - opcional

% Define o formato de apêndices no documento.
\RequirePackage[titletoc]{appendix}
\let\oriAlph\Alph
\let\orialph\alph
\renewcommand{\@resets@pp}{\par
	\@ppsavesec
	\stepcounter{@pps}
	\setcounter{section}{0}%
	\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
	\if@chapter@pp
		\setcounter{chapter}{0}%
		\renewcommand\@chapapp{\appendixname}%
		\def\@alinhar{\centering}
		\def\@espaco{\space -- \space}
		\renewcommand\thechapter{\@Alph\c@chapter}%
	\else
		\setcounter{subsection}{0}%
		\renewcommand\thesection{\@Alph\c@section}%
	\fi
	\if@pphyper
		\if@chapter@pp
			\renewcommand{\theHchapter}{\theH@pps.\oriAlph{chapter}}%
		\else
			\renewcommand{\theHsection}{\theH@pps.\oriAlph{section}}%
		\fi
		\def\Hy@chapapp{appendix}%
	\fi
	\restoreapp
}

% Cria caixas destacadas com bordas e personalizações.
\RequirePackage[framemethod=tikz]{mdframed}

% Licença Creative Commons - Repositório UFSCar
\definecolor{cccolor}{rgb}{.67,.7,.67}
\newcommand{\licenca}{
	\ps@empty
	\if@twoside
		\ifodd\c@page
			\hbox{}\newpage
			\if@twocolumn
				\hbox{}\newpage
			\fi
		\fi
	\fi
	\parindent \z@
	\null \vfill \par
	\begin{mdframed}[outerlinecolor=black,
			outerlinewidth=2pt,
			linecolor=cccolor,
			middlelinewidth=3pt,
			roundcorner=10pt]
		\centering Exceto quando indicado o contrário, a licença deste item é descrito como \\ Attribution-NonCommercial-NoDerivs 3.0 Brazil
		\begin{center}
			\includegraphics[scale=1.3]{./logos/by-nc-nd}
		\end{center}
	\end{mdframed}
	\null
	\centering Classe \LaTeX\/ para documentos científicos segundo as normas ABNT \\ desenvolvido por Wladimir Seixas.
}

% ABNT: Elaboração de Lista de Siglas - opcional

% Define e gerencia acrônimos e siglas no texto.
\RequirePackage{acronym}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EOF: WSTEX.CLS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
