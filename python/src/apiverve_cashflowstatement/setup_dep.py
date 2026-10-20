from setuptools import setup, find_packages

setup(
    name='apiverve_cashflowstatement',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Cash Flow Statement returns operating, investing and financing cash flows for a US public company by ticker - straight from SEC filings, with free cash flow, FCF margin and cash-conversion metrics calculated for you.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/cashflow?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
