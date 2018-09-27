\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{provas}[2018/09/27 v1.0 Modelo para elaboração de provas]

\LoadClass[12pt,a4paper]{article}

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
\newcommand{\grau}{$^{\rm o}$}										  %símbolo de grau
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
\newcommand{\questao}[2]{\begin{minipage}{\textwidth} \textit{(#1)} \textbf{Quest\~ao \addtocounter{q}{1} 0\arabic{q} --} #2 \end{minipage}} % argumento 1: valor da questão; argumento 2: enunciado

\newcommand{\questaoU}[1]{\begin{minipage}{\textwidth} \textbf{Quest\~ao \'Unica --} #1 \end{minipage}} 

%--------------------------------------------------------------------------------------------
% definições da classe
\newcommand{\curso}[1]{\gdef\@curso{#1}}        	
\newcommand{\data}[1]{\gdef\@data{#1}}        		
\newcommand{\disciplina}[1]{\gdef\@disciplina{#1}}  

%--------------------------------------------------------------------------------------------
% montagem do cabeçário
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
Nome: \hrulefill

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