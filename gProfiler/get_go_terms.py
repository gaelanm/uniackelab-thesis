
def get_go_terms(in_path, field, name, out_path):
    """
    Return rrvgo-compatible GO terms from g:Profiler csv.

    :param str in_path: Input excel file path
    :param str field: GO:BP, GO:CC, or GO:MF
    :param str name: Desired output file name
    :param str out_path: Output path
    """

    go_terms = pd.read_csv(f'{in_path}', usecols=['term_id', 'negative_log10_of_adjusted_p_value', 'source'])

    output = go_terms.loc[go_terms['source'] == field, ['term_id', 'negative_log10_of_adjusted_p_value']]
    date = datetime.today().strftime('%d-%m-%Y')
    field = field.replace(':', '')

    return output.to_csv(f'{out_path}/{name}_{field}_{date}.txt', header=['ID', 'score'], index=False)

