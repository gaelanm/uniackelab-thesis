
import pandas as pd
from datetime import datetime


def get_gene_list(in_path, name, out_path):
    """
    Return g:Profiler-compatible gene list from excel file.

    :param str in_path: Input excel file path
    :param str name: Desired output file name
    :param str out_path: Output path
    """

    df = pd.read_excel(f'{in_path}', header=None, index_col=None)
    date = datetime.today().strftime('%d-%m-%Y')

    return df.to_csv(f'{out_path}/{name}_{date}.txt', sep='\n', header=False, index=False)

