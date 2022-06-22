from pygments.lexers import get_lexer_by_name  # refer LEXERS
from pygments.lexers._mapping import LEXERS
from pygments.lexers.python import PythonLexer


def setup(app):
    # choose one, both ok
    app.add_lexer('my_lang', get_lexer_by_name('matlab'))
    # app.add_lexer('my_lang', PythonLexer)
