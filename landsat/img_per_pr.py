#!/usr/bin/env python

import numpy as np
import pandas as pd
import click
import matplotlib.pyplot as plt


@click.command()
@click.argument('fname', metavar='<text_file>', nargs=1,
                type=click.Path(exists=True, resolve_path=True))
@click.argument('out_plot', metavar='<output plot name with extension>',
                nargs=1)
def plot_pr_ts(fname, out_plot):
    """Plot dummy observations per scene to see if there are temporal gaps
  
    fname(text file): Text file with a standard Landsat Collection 1
    identifier in each line
    """
    # Read data and extract date, satellite, pathrow
    # Indices hardcoded for Landsat Collection 1 scene ID's
    df = pd.read_fwf(fname, header=None, names=['id'])
    df['time'] = pd.to_datetime(df.id.str.slice(17, 25), format='%Y%m%d')
    df['satellite'] = df.id.str.slice(0, 4)
    df['pr'] = df.id.str.slice(10, 16)
    df['count'] = 1
    
    # Group by path-row, calculate count and plot
    n_sub = int(np.ceil((len(df.pr.unique()))**(0.5)))
    pr_count = df.groupby([pd.Grouper(key='time', freq='A'),
                           pd.Grouper(key='pr')]).sum()
    pr_count.unstack().plot(subplots=True, layout=(n_sub, n_sub), figsize=(10, 10),
                            sharex=True, sharey=True)
    plt.savefig(out_plot)


if __name__ == '__main__':
    plot_pr_ts()
