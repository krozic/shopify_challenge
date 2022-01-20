import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
sns.set_theme(style='darkgrid')

if __name__ == '__main__':
    orders = pd.read_excel('./data/2019 Winter Data Science Intern Challenge Data Set.xlsx')

    # Reproducing the value provided:
    orders.order_amount.mean()
    # $3145.13

    orders.sort_values('order_amount', ascending=False)

    # boxplot to visualize outliers
    fig, axes = plt.subplots(1, 2)
    fig.suptitle('Visualizing Outliers')
    sns.boxplot(ax=axes[0], y=orders.order_amount)
    sns.boxplot(ax=axes[1], y=orders.order_amount, showfliers=False)
    plt.tight_layout()
    plt.savefig('./plots/order_data.png', bbox_inches='tight')
    plt.show()

    # How many outliers?
    q1, q3 = np.percentile(orders.order_amount, [25, 75])
    orders[(orders.order_amount > ((q3-q1)*1.5 + q3))].shape[0]
    # There are 141 outliers in this boxplot (out of 5000 orders)

    # The more appropriate metric to use would be the median since it is not affected by outliers.
    orders.order_amount.median()
    # The median is $284.00 which is a more appropriate metric to report.








# Scraps not used

# There are single orders that are outliers
# Using matplotlib
# fig = plt.figure(figsize = (9, 7))
# plt.boxplot(orders.order_amount)
# plt.show()

# Using seaborn
# ax = sns.boxplot(data=orders.order_amount)
# plt.title('Distribution of Order Amount')
# plt.show()

# Removing outliers to see the bulk of the data
# ax = sns.boxplot(data=orders.order_amount, showfliers=False)
# ax.set(ylim=(0, 800))
# plt.title('Distribution of Order Amount (Outliers Removed)')
# plt.show()
