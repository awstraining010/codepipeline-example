import requests
from bs4 import BeautifulSoup as bs
import re


def main():
    """
        The main program entry-point.
        """
    res = requests.get('https://tomcat.apache.org/download-80.cgi')
    html = bs(res.content, 'lxml')
    pk_link = html.select('.subsection')[0].select('a')[3]['href']
    check_ver = re.compile(r'v[0-9]+\.[0-9]+\.[0-9]+')
    tomcat_ver = check_ver.search(pk_link).group().strip('v')

    print('export TOMCAT_VERSION="{}"'.format(tomcat_ver))
    print('export TOMCAT_CORE_DOWNLOAD_URL="{}"'.format(pk_link))


if __name__ == '__main__':
    main()




