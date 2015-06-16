import os, re

regex = re.compile('^(?P<name>.+\..+\.)(?P<version>\d+$)')

def remover(path):
    os.chdir(path)
    print(path)
    for root, dlst, flst in os.walk(path):
#        print('正在處理文件夾<{}>。'.format(root))
        maxversion = {}
        for f in flst:
            m = regex.match(f)
            if m:
                name, version = m.group('name').lower(), int(m.group('version'))
                if name in maxversion:
                    if maxversion[name] < version:
                        maxversion[name], version = version, maxversion[name]
                    old = os.path.join(root, name + str(version))
                    print('刪除舊版文件<{}>。'.format(old))
                    os.remove(old)
                else:
                    maxversion[name] = version
        
        maxversion = {k:v for k,v in maxversion.items() if v != 1}
        for k,v in maxversion.items():
            old = os.path.join(root, k + str(v))
            print('將文件<{}>的版本改為 1'.format(old))
            os.rename(old, os.path.join(root, k + '1'))
            
def confirm():
    print('''確定刪除文件夾<{}>嗎?
繼續執行將會刪除文件夾(以及子文件夾中)的舊版文件, 一旦執行後無法回復!!!'''.format(os.getcwd()))
    return input("確定操作請輸入'yes', 輸入其它字符可以取消:").lower() == 'yes'


if __name__ == '__main__' and confirm():
    try:
        remover(os.getcwd())
    except:
        pass
    os.system('pause')

