Received: from out28-43.mail.aliyun.com (out28-43.mail.aliyun.com [115.124.28.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F241DFF6
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=cyg.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sjterm.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.5008219|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0923395-0.0384342-0.869226;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047204;MF=fuyao@sjterm.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.VopdEQt_1703063305;
Received: from localhost(mailfrom:fuyao@sjterm.com fp:SMTPD_---.VopdEQt_1703063305)
          by smtp.aliyun-inc.com;
          Wed, 20 Dec 2023 17:08:26 +0800
Date: Wed, 20 Dec 2023 17:08:25 +0800
From: fuyao <fuyao1697@cyg.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Cc: =?utf-8?B?6bqm5YGl5bu6?= <maijianzhang@allwinnertech.com>
Subject: [PATCH] gmac: sun8i: r40: add gmac tx_delay support
Message-ID: <ZYKvCQBD-SY9uVLF@debian.cyg>
Mail-Followup-To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?6bqm5YGl5bu6?= <maijianzhang@allwinnertech.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: work_work_work

r40 can support tx_delay, so we add it.

Signed-off-by: fuyao <fuyao1697@cyg.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 137741b94122..fd07573afc9b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -127,6 +127,7 @@ static const struct emac_variant emac_variant_r40 = {
 	.support_mii = true,
 	.support_rgmii = true,
 	.rx_delay_max = 7,
+	.tx_delay_max = 7,
 };
 
 static const struct emac_variant emac_variant_a64 = {
-- 
2.39.2


-- 
CYG Technology.
