%% classe baseada na classe article do LaTeX, alterada para as necessidades 
%% em elaboração de provas

%% elaborado por Vinicius de Abreu Oliveira
%% contato: viniciusoliveira@unipampa.edu.br

%%  Releases:
%%  v1.0 - 27/09/2018:
%%          Criação da classe prova.cls
%%          Modificações do Original:
%%				configurações da página (dimensões e margens)
%%          Criado novo:
%%              \curso{curso}; \data; \disciplina; \questão; \questaoU,
%%              cabeçário personalizado
%%				símbolos e formatos matemáticos
%%  v1.1 - 28/03/2019:
%%          Criado novo:
%%              \nome
%%              cabeçário personalizado com ou sem nome
%%                  se \nome{sem} -> deixa linha em branco
%%                   ou \nome{Nome da Pessoa} -> coloca o nome em negrito
%%  v1.2 - 30/05/2019:
%%          Criado novo:
%%              \questaoI
%%		    questão com itens, com os pontos nos itens
%%		\questaoG
%%		    questão para o gabarito das provas
%% 		cabeçário personalizado para gabaritos das provas

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{provas}[2019/05/30 v1.2 Modelo para elaboração de provas]

\LoadClass[12pt,a4paper]{article}

\usepackage{ifthen}

%--------------------------------------------------------------------------------------------
% definido o tamanho da página
\usepackage{anysize}
\textheight 24cm 
\textwidth 16cm 
\marginsize{2cm}{2cm}{0cm}{0cm}
\setlength\parindent{0pt}

%--------------------------------------------------------------------------------------------
% comandos matemáticos
\newcommand{\dpp}[2]{\frac{\partial #1}{\partial #2}}                 %derivada parcial
\newcommand{\dps}[2]{\frac{\partial^2 #1}{\partial #2^2}}             %derivada parcial de segunda ordem
\newcommand{\dpm}[3]{\frac{\partial^2 #1}{\partial #2 \, \partial #3}}%derivada parcial de 2 ordem mixta
\newcommand{\dsp}[2]{\frac{d #1}{d #2}}                               %derivada simples
\newcommand{\dss}[2]{\frac{d^2 #1}{d #2^2}}                           %derivada simples de segunda ordem
\newcommand{\sen}{\mbox{sen}}                                         %função seno: sen
\newcommand{\arcsen}{\mbox{arcsen}}                                   %função arco seno: arcsen
\newcommand{\dive}{\nabla \bullet}                                    %operador divergente
\newcommand{\grau}{$^{\rm o}$}	
\newcommand{\arcsec}{$^{\prime\prime}$}
\newcommand{\arcmin}{$^{\prime}$}									  %símbolo de grau
  %vetores unitários
\newcommand{\ihat}{\hat{\imath}}
\newcommand{\jhat}{\hat{\jmath}}
\newcommand{\khat}{\hat{\kappa}}
  %subescrito com acentuação
\newcommand{\mtexto}[1]{\mbox{\tiny #1}}

%--------------------------------------------------------------------------------------------
% comandos de editoração de texto
\newcommand{\texto}[1]{\begin{minipage}{\textwidth} #1 \end{minipage}}

\newcounter{q}
%questão normal
\newcommand{\questao}[2]{\begin{minipage}{\textwidth} \textit{(#1)} \textbf{Quest\~ao \addtocounter{q}{1} 0\arabic{q} --} #2 \end{minipage}} % argumento 1: valor da questão; argumento 2: enunciado

%questão com itens (os valores estão indicados nos itens)
\newcommand{\questaoI}[1]{\begin{minipage}{\textwidth} \textbf{Quest\~ao \addtocounter{q}{1} 0\arabic{q} --} #1 \end{minipage}} % argumento 1: enunciado

%questão única
\newcommand{\questaoU}[1]{\begin{minipage}{\textwidth} \textbf{Quest\~ao \'Unica --} #1 \end{minipage}} 

%questão para gabarito
\newcommand{\questaoG}[1]{\begin{minipage}{\textwidth} \textbf{Quest\~ao \addtocounter{q}{1} 0\arabic{q}} (Valor m\'aximo de \textit{#1}) \end{minipage} \\ \textbf{Resposta:}} % argumento 1: valor da questão 

%--------------------------------------------------------------------------------------------
% definições da classe
\newcommand{\curso}[1]{\gdef\@curso{#1}}        	
\newcommand{\data}[1]{\gdef\@data{#1}}        		
\newcommand{\disciplina}[1]{\gdef\@disciplina{#1}}  
\newcommand{\nome}[1]{\gdef\@nome{#1}}  

%--------------------------------------------------------------------------------------------
% montagem do cabeçário da prova
\newcommand{\cabeca}{\fbox{%      quadro com o logo, campus, curso e nome do professor
 \begin{minipage}{0.2\textwidth}
  \includegraphics[scale=0.8]{logo_unipampa.eps}
 \end{minipage}
 \begin{minipage}{0.8\textwidth}
  \begin{center}
   \hspace{-2cm} \textbf{Campus Ca\c{c}apava do Sul}\\
  \end{center}
  \begin{minipage}{0.5\textwidth}
   \begin{flushleft}
    \textbf{Curso:} \@curso
   \end{flushleft}
  \end{minipage}
  \begin{minipage}{0.5\textwidth}
   \begin{flushright}
    \textbf{Prof.} Vinicius de Abreu Oliveira
   \end{flushright}  
  \end{minipage}
 \end{minipage}
 }% 

\vspace{0.8cm}
\ifthenelse{\equal{\@nome}{branco}}{Nome: \hrulefill}{Nome: {\bf \@nome}}

\vspace{0.5cm}  %data e disciplina
  \begin{minipage}{0.5\textwidth}
   \begin{flushleft}
    \textbf{Data:} \@data
   \end{flushleft}
  \end{minipage}
  \begin{minipage}{0.5\textwidth}
   \begin{flushright}
    \textbf{Disciplina:} \@disciplina
   \end{flushright}  
  \end{minipage}
}

%--------------------------------------------------------------------------------------------
% montagem do cabeçário do gabarito
\newcommand{\cabecagab}{\fbox{%      quadro com o logo, campus, curso e nome do professor
 \begin{minipage}{0.2\textwidth}
  \includegraphics[scale=0.8]{logo_unipampa.eps}
 \end{minipage}
 \begin{minipage}{0.8\textwidth}
  \begin{center}
   \hspace{-2cm} \textbf{Campus Ca\c{c}apava do Sul}\\
  \end{center}
  \begin{minipage}{0.5\textwidth}
   \begin{flushleft}
    \textbf{Curso:} \@curso
   \end{flushleft}
  \end{minipage}
  \begin{minipage}{0.5\textwidth}
   \begin{flushright}
    \textbf{Prof.} Vinicius de Abreu Oliveira
   \end{flushright}  
  \end{minipage}
 \end{minipage}
 }% 

\vspace{0.5cm}  %data e disciplina
  \begin{minipage}{0.5\textwidth}
   \begin{flushleft}
    \textbf{Aplicada em:} \@data
   \end{flushleft}
  \end{minipage}
  \begin{minipage}{0.5\textwidth}
   \begin{flushright}
    \textbf{Disciplina:} \@disciplina
   \end{flushright}  
  \end{minipage}
}
