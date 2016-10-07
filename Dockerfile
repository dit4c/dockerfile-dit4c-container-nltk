FROM dit4c/dit4c-container-base:debian
MAINTAINER Tim Dettrick <t.dettrick@uq.edu.au>

# install
# - Python 3, PIP and dependencies
# - Xvfb for background X11 rendering
# - matplotlib
# - nltk.draw dependencies
RUN apt-get update && \
  apt-get install -y \
    python3-pip python3-all-dev \
    xvfb \
    python3-matplotlib \
    python3-tk && \
  apt-get clean

RUN pip3 install ipython jupyter nltk

COPY etc /etc
COPY var /var

RUN su - researcher -c "mkdir -p ~/.jupyter && echo \"c.NotebookApp.base_url = '/jupyter'\" > ~/.jupyter/jupyter_notebook_config.py"

RUN su - researcher -c "echo -e \"import nltk\nnltk.download('stopwords')\nnltk.download('brown')\n\" | python3"

RUN su - researcher -c "wget http://archives.unimelb.edu.au/__data/assets/text_file/0006/1717746/UMA_Fraser_Radio_Talks.zip && unzip UMA_Fraser_Radio_Talks.zip && rm UMA_Fraser_Radio_Talks.zip"
