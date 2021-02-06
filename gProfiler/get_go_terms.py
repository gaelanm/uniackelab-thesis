

DATA_PATH = "../gProfiler/data"    #   raw and restructured GO terms are saved in the same folder

def get_go_terms(field, in_name, out_name):
    """
    Return rrvgo-compatible GO terms from g:Profiler csv.

    :param str field: GO:BP, GO:CC, or GO:MF
    :param str in_name: gProfiler csv to be prepared for rrvgo
    :param str out_name: Desired output file name
    """

    go_terms = pd.read_csv(f'{DATA_PATH}/{in_name}', usecols=['term_id', 'negative_log10_of_adjusted_p_value', 'source'])

    output = go_terms.loc[go_terms['source'] == field, ['term_id', 'negative_log10_of_adjusted_p_value']]
    date = datetime.today().strftime('%d-%m-%Y')
    field = field.replace(':', '')

    return output.to_csv(f'{DATA_PATH}/{out_name}_{field}_{date}.txt', header=['ID', 'score'], index=False)

