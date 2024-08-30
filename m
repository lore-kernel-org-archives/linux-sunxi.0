Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7325D12AAE2
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Aug 2024 03:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724987149; cv=none; b=IwINcNyp7/CbGqelGzduwObxqbXT8kHzSJoKDjbuFXk1onHgr3Vq2nHEMntMN7epdy2BmdjqtvRFyUvQzraEGPSUEJZKCQp/acTd/E2j6rdR1AixDAycRcmOTcsxs8UOWprLziG3vuGtyc/e02Exr1IS9Wd/xpVnM/CFeh8vLCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724987149; c=relaxed/simple;
	bh=MabFgNN46zH9A89A9+a67TjDIONM9U4ea7XTPwJ0QYA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tx6J0+zRquf7EjmxstRbpvxWRvcKxzQ8tSCJdgBOo2QjxLB/r19spO3+CqnCrKRc5CQqWQccuWxsM6O3Z1aJlr61zShvlPCbGDZ+vFi9uu9qCnWYYRdVLqO0EQCer73v2fSLRnNSsJnSvQgKYYv3v5QyT90C9HTdkHDumGK415k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Ww2w50PLkzQqx2;
	Fri, 30 Aug 2024 11:00:53 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id A950618010A;
	Fri, 30 Aug 2024 11:05:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 11:05:43 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <woojung.huh@microchip.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
	<olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
	<alsi@bang-olufsen.dk>, <justin.chen@broadcom.com>,
	<sebastian.hesselbarth@gmail.com>, <alexandre.torgue@foss.st.com>,
	<joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>, <UNGLinuxDriver@microchip.com>,
	<netdev@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
	<jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH net-next v4 6/8] net: mv643xx_eth: Simplify with scoped for each OF child loop
Date: Fri, 30 Aug 2024 11:13:23 +0800
Message-ID: <20240830031325.2406672-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830031325.2406672-1-ruanjinjie@huawei.com>
References: <20240830031325.2406672-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use scoped for_each_available_child_of_node_scoped() when iterating
over device nodes to make code a bit simpler.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v4:
- Add Reviewed-by.
v3:
- Add Reviewed-by.
---
 drivers/net/ethernet/marvell/mv643xx_eth.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index f35ae2c88091..9e80899546d9 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2802,7 +2802,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
 static int mv643xx_eth_shared_of_probe(struct platform_device *pdev)
 {
 	struct mv643xx_eth_shared_platform_data *pd;
-	struct device_node *pnp, *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
 	/* bail out if not registered from DT */
@@ -2816,10 +2816,9 @@ static int mv643xx_eth_shared_of_probe(struct platform_device *pdev)
 
 	mv643xx_eth_property(np, "tx-checksum-limit", pd->tx_csum_limit);
 
-	for_each_available_child_of_node(np, pnp) {
+	for_each_available_child_of_node_scoped(np, pnp) {
 		ret = mv643xx_eth_shared_of_add_port(pdev, pnp);
 		if (ret) {
-			of_node_put(pnp);
 			mv643xx_eth_shared_of_remove();
 			return ret;
 		}
-- 
2.34.1

