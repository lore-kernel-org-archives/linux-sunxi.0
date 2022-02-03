Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204062F28
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Feb 2022 20:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBF3C36AE2;
	Thu,  3 Feb 2022 20:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643920544;
	bh=oOQiocX8iG93SVM0rrMHhdY+iPpvsf6Slo6TpR7wMsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kKitEMQlPbiiY1wExG3vmS9qsbk+j83xcxRJywaIT1j3CKskH+dO26zGXA5VypDYe
	 hySUogpsO08qWO8ofVIU3hmkbD8K/mlgn9uBpNhLY7qlKRY0Yhyxa2664QHbJMmVur
	 70HQOg8B3tNa/r5Rs2FP7kVFxtJtFe4ju+B3jAnCq8oS3YxtUzxvBiLZy2jNCaTE7j
	 57itRk7liiuhOM+FavdpPlpnq792xDpkUnRghi3MoQgxdTgX3JafOjOjqTYHC8Sqfl
	 F5sX/o7G/f4DqO8Sr5Rfl5FvOYowErBCGCsz4bjhyhbPaTdYKv5E04d4ZgiAwspb5b
	 ns8Yrbkl5yfEw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Sasha Levin <sashal@kernel.org>,
	peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	kuba@kernel.org,
	mcoquelin.stm32@gmail.com,
	mripard@kernel.org,
	wens@csie.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 25/25] net: stmmac: dwmac-sun8i: use return val of readl_poll_timeout()
Date: Thu,  3 Feb 2022 15:34:46 -0500
Message-Id: <20220203203447.3570-25-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203203447.3570-1-sashal@kernel.org>
References: <20220203203447.3570-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Jisheng Zhang <jszhang@kernel.org>

[ Upstream commit 9e0db41e7a0b6f1271cbcfb16dbf5b8641b4e440 ]

When readl_poll_timeout() timeout, we'd better directly use its return
value.

Before this patch:
[    2.145528] dwmac-sun8i: probe of 4500000.ethernet failed with error -14

After this patch:
[    2.138520] dwmac-sun8i: probe of 4500000.ethernet failed with error -110

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 9f5ccf1a0a540..cad6588840d8b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -734,7 +734,7 @@ static int sun8i_dwmac_reset(struct stmmac_priv *priv)
 
 	if (err) {
 		dev_err(priv->device, "EMAC reset timeout\n");
-		return -EFAULT;
+		return err;
 	}
 	return 0;
 }
-- 
2.34.1

