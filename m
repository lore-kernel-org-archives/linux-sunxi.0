Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128C918BC2D
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Aug 2024 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724744678; cv=none; b=uZo2SBp520c2npK/rlGtOzWWGpOR72qUGEWmFiM06qVkgZ+8lBJG1rWNR5Y01+H10WhJ/rULRj85e0GKFeRcBBseexuKdBXxu+xHOwXdyZOSIZpdA1Vu8kX3m6RJ8QYtXRUDksT3+1SCeI5WUaO1EmWd5JpdXCrh+ttIl2nRKS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724744678; c=relaxed/simple;
	bh=8c4Tr1gcsgc3ABStWkW8rdW8bVsFRjz1eLq2j5zUSeI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gV8ElzFZI3Q0uhoVouQH2y5JhmZ2Iy4TDqKEcraVMpb9LolqAjo5twZE1ngI75q8oSaE33CCTdSTGijZu/pR3dG8r9B7/1Tw7GzCvijoQgkowAziWPqR+DWrK+PWpu4oy0QlEqhG/ZiNdeuzgc0xxa8mf0pQrHuYKADL2jJXpeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WtKJt6h77zpTpP;
	Tue, 27 Aug 2024 15:42:54 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 3AD83140202;
	Tue, 27 Aug 2024 15:44:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 15:44:34 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <woojung.huh@microchip.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
	<olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
	<alsi@bang-olufsen.dk>, <justin.chen@broadcom.com>,
	<sebastian.hesselbarth@gmail.com>, <alexandre.torgue@foss.st.com>,
	<joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>, <ansuelsmth@gmail.com>,
	<UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
	<jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 6/7] net: dsa: microchip: Use scoped function and __free() to simplfy code
Date: Tue, 27 Aug 2024 15:52:18 +0800
Message-ID: <20240827075219.3793198-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827075219.3793198-1-ruanjinjie@huawei.com>
References: <20240827075219.3793198-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Avoids the need for manual cleanup of_node_put() in early exits
from the loop by using for_each_available_child_of_node_scoped()
and __free().

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/net/dsa/microchip/ksz_common.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
index cd3991792b69..8058a0b7c161 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -4595,7 +4595,6 @@ static int ksz_parse_drive_strength(struct ksz_device *dev)
 int ksz_switch_register(struct ksz_device *dev)
 {
 	const struct ksz_chip_data *info;
-	struct device_node *port, *ports;
 	phy_interface_t interface;
 	unsigned int port_num;
 	int ret;
@@ -4677,25 +4676,22 @@ int ksz_switch_register(struct ksz_device *dev)
 		ret = of_get_phy_mode(dev->dev->of_node, &interface);
 		if (ret == 0)
 			dev->compat_interface = interface;
-		ports = of_get_child_by_name(dev->dev->of_node, "ethernet-ports");
+		struct device_node *ports __free(device_node) =
+			of_get_child_by_name(dev->dev->of_node, "ethernet-ports");
 		if (!ports)
 			ports = of_get_child_by_name(dev->dev->of_node, "ports");
 		if (ports) {
-			for_each_available_child_of_node(ports, port) {
+			for_each_available_child_of_node_scoped(ports, port) {
 				if (of_property_read_u32(port, "reg",
 							 &port_num))
 					continue;
-				if (!(dev->port_mask & BIT(port_num))) {
-					of_node_put(port);
-					of_node_put(ports);
+				if (!(dev->port_mask & BIT(port_num)))
 					return -EINVAL;
-				}
 				of_get_phy_mode(port,
 						&dev->ports[port_num].interface);
 
 				ksz_parse_rgmii_delay(dev, port_num, port);
 			}
-			of_node_put(ports);
 		}
 		dev->synclko_125 = of_property_read_bool(dev->dev->of_node,
 							 "microchip,synclko-125");
-- 
2.34.1

