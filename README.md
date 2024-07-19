# crowdstrike-bsod-fix

CrowdStrike güncellemesi sonrasında Windows'ta mavi ekran (Blue Screen of Death - BSOD) sorununun temel sebepleri arasında şunlar yer alabilir:

  1-Sürücü Çakışmaları: Yeni güncellenen CrowdStrike sürücülerinin mevcut Windows sürücüleriyle uyumsuzluk veya çakışma yaşaması.

  2-Yanlış Yapılandırma: Güncelleme sırasında veya sonrasında CrowdStrike ayarlarının Windows ile uyumsuz bir şekilde yapılandırılması.

  3-Kernel Modifikasyonları: CrowdStrike'ın düşük seviyeli sistem bileşenleriyle (kernel) etkileşime girmesi ve bu etkileşimde sorunlar yaşanması.

  4-Uyumsuz Yazılım veya Donanım: Diğer yüklü yazılımlar veya donanımların CrowdStrike güncellemesiyle uyumsuz olması.

  5-Eksik veya Hatalı Güncellemeler: Güncelleme dosyalarının eksik veya hatalı indirilmiş veya yüklenmiş olması.

Bu tür sorunları önlemek için, güncellemelerden önce sistem yedeklemeleri yapmak, tüm sürücü ve yazılımların güncel olduğundan emin olmak ve gerekirse bence en önemlisi test ortamlarında bu sürecin denenip servis edilmesidir. Genelde krtiik sistemlerde butip güncellemeler için prosedür ve talimatlar vardır. her şirketin kendi için uygun gördüğü süre zarfında belki bir kaç patch geriden takip ederek en stabil sürümde kalmak tercih sebebi olabilir tartışmalı bir konu olsada en önmeli ve en kritik olan konu bu patchlerin ilgili kurum, şirket yada platformların test ortamında denenmesi kesinlikle zaman ve kriz yönetimi için fayda sağlayacaktır. 

O zaman fazla söze gerek yok nasıl çözeceğimize bakalım 

# Onprime Sistemlerde Çözüm:

  1-Windows'u Güvenli Modda Başlatma:
        Bilgisayarınızı yeniden başlatın.
        Bilgisayar açılırken, "F8" tuşuna sürekli olarak basın (veya yeni Windows sürümlerinde Shift tuşuna basılı tutarak "Yeniden Başlat" seçeneğini seçin ve ardından Gelişmiş Başlangıç Seçeneklerinden Güvenli Mod'u seçin).
        Karşınıza gelen ekranda "Güvenli Mod" seçeneğini seçin ve Enter tuşuna basın.

  2-CrowdStrike Dizinine Gitme:
        Güvenli Modda oturum açtıktan sonra, Windows Gezgini'ni (Dosya Gezgini) açın.
        Adres çubuğuna C:\Windows\System32\drivers\CrowdStrike yazın ve Enter tuşuna basın.

  3-“C-00000291-00000000-00000032.sys” Dosyasını Yeniden Adlandırma:
        Bu dizinde, "C-00000291-00000000-00000032.sys" adlı dosyayı bulun.
        Dosyayı bulduktan sonra, dosyaya sağ tıklayın ve "Yeniden Adlandır" seçeneğini seçin.
        Dosya adını "C-00000291-00000000-00000032.renamed" olarak değiştirin ve Enter tuşuna basın.

  4-Bilgisayarı Normal Modda Yeniden Başlatma:
        Tüm işlemleri tamamladıktan sonra bilgisayarınızı yeniden başlatın.
        Bilgisayar normal modda açılacaktır.

Bu adımları takip ederek CrowdStrike güncellemesi nedeniyle oluşan mavi ekran sorununu çözebilirsiniz. Eğer sorun devam ederse, CrowdStrike destek ekibi ile iletişime geçmeyi düşünebilirsiniz.

# Azure Üzerinde Çözüm:

Azure'da bulunan bir VM'nin Windows'u normal şekilde açılmıyorsa ve doğrudan güvenli modda başlatmanız gerekiyorsa, aşağıdaki adımları takip edebilirsiniz:

  1-VM'yi Durdurun ve Diskini Ayırın:
        Azure portalında sanal makinenizin sayfasına gidin.
        "Durdur" seçeneğini tıklayarak VM'yi durdurun.
        VM durduktan sonra, sol menüden "Diskler" seçeneğine gidin ve OS diskinizi ayırın.

  2-Farklı Bir VM'ye Disk Ekleyin:
        Yeni bir VM oluşturun veya mevcut bir VM'yi kullanın.
        Bu VM'nin yönetici hesabına sahip olduğunuzdan emin olun.
        Yeni VM'ye gidin ve "Diskler" bölümünden "Disk ekle" seçeneğini kullanarak sorunlu VM'nin OS diskini ekleyin.

  3-Yeni VM'ye Bağlanın ve Disk Yapılandırması:
        Eklediğiniz diski yeni VM'de tanıyın ve bağlayın.
        Yeni VM'ye RDP ile bağlanın.
        Disk Yönetimi'ni açın (Windows tuşu + X tuşuna basın ve "Disk Yönetimi"ni seçin).
        Eklediğiniz diski tanıyın ve bir sürücü harfi atayın.

  4-Bcdedit Kullanarak Güvenli Önyükleme Ayarını Yapın:

  Komut İstemi'ni (cmd) yönetici olarak açın.

  Eklediğiniz diskin Windows dizinine gidin. Örneğin, disk D: olarak bağlandıysa:

  `cd /d D:\Windows\System32`

  Aşağıdaki komutu çalıştırarak güvenli önyükleme modunu ayarlayın:

  `bcdedit /store D:\boot\bcd /set {default} safeboot minimal`

  Diski Geri Ekleyin ve VM'yi Başlatın:
  Disk yönetiminden eklediğiniz diski güvenli şekilde çıkarın.
  Azure portalına geri dönün ve diskleri ayırdığınız VM'ye geri ekleyin.
  VM'yi başlatın.

  5-Bu adımlar, VM'nizin güvenli modda başlamasına yardımcı olacaktır. Güvenli moddayken gerekli düzeltmeleri yaptıktan sonra tekrar normal moda geçmek için aynı adımları izleyebilir ve bcdedit komutunu kullanarak güvenli önyüklemeyi devre dışı bırakabilirsiniz:

  `bcdedit /deletevalue {default} safeboot`

 Yada bu kadar uğraşmayıp 3. adımdan sonra ilgili dizine gidip dosyanın adını değiştirebilirsiniz. 

 Ben bu makaleyi yayınladıktan sonra bir patch yayınladığı ve durumun düzeltildiği bilgisi resmi olmayan bir kanaldan aldığım bilgi yani sisteminiz düzelmiş olabilir lütfen kontrol ediniz

 Dosyanın adını hızlıca değiştireibleceğiniz PowerShell Scriptini code bölümünde bulabilirsiniz basit ama kütüphanenizde dursun :) 

 
