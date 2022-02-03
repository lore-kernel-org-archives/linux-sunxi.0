Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6CD2C80
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Feb 2022 20:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D32C340E8;
	Thu,  3 Feb 2022 20:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643920591;
	bh=lP/9XNjr06Zs66IlC10yUo62yXsw8hTcr3FXGl4Gv0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iQZqN49UBdxGrEJVsrKmsCtTExZdhgmSm8ya8bwq8F0MA66O9d3D89H4QlAen/viM
	 RcXp8JOpqFzSOEL4vkPbI5+WUJshI2/Ne12ah6YDsLRAv+qg3k/rNYAjqDrMT8Z2NL
	 xWL3+05+ZrSxCoRnaIhO52JvImm1buJaSQnFPBudV0HpdaUHqikhQIBIQbgyHbsaKj
	 sczaRQCXIr6In/1rFtXrG/PXNLvGsGAgHCKcVjePpCORXy+U07Ziquus+ts+XbVvQZ
	 rDmkFhdL103fVUe3ZaNR13quIWagFVJYK+vT1//yt76dxqxrtnCcCiX65DumadlZC+
	 4pPqcGP05JJww==
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
	mripard@kernel.org,
	wens@csie.org,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH AUTOSEL 4.19 10/10] net: stmmac: dwmac-sun8i: use return val of readl_poll_timeout()
Date: Thu,  3 Feb 2022 15:36:13 -0500
Message-Id: <20220203203613.4165-10-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203203613.4165-1-sashal@kernel.org>
References: <20220203203613.4165-1-sashal@kernel.org>
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
index 4382deaeb570d..0137cba2cb54b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -712,7 +712,7 @@ static int sun8i_dwmac_reset(struct stmmac_priv *priv)
 
 	if (err) {
 		dev_err(priv->device, "EMAC reset timeout\n");
-		return -EFAULT;
+		return err;
 	}
 	return 0;
 }
-- 
2.34.1

