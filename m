Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5940330CD81
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 21:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546394; cv=none; b=KQUTUr04KrYY9Bx5v4dTXD7J/oZ1nTJu44odjBPHFEuPpJHyOL672as8ubuUysk2DzX4q2t+rJrzMo4CvRJblf2DtWj0ITVDBLvbh2XKVbmu99Jk908ScATeYo8tqBqATHS+FEU05rAPsnJMUuH6XM+99yQi5NhdyxLgH4t7l7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546394; c=relaxed/simple;
	bh=kRWe3zJ18nPwnbV8Vp/GoUZKSkrJS4rO4y9k1SLXFfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6kmiD169WcOurSykYRD0Q1COsTTyzs4nwCFbkk78S0Q+Lyvh4pOm//1x+17f9Ht6I8kHkLkM6QOVceSu/Igk05cfC4d0LbkS83HNW2AKmepP72dBae8B1eC+3EoG5iw/KqK5i9NM9AZU5refJXFvZrfHSUcNNaiZ4ZPCzjIa7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pO0chnUF; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pO0chnUF"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b15bca7dfso665541a34.0
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546388; x=1791151188; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMTK91isCtW7K3W3fSl1Ctwz86tx7+iRah3Eev0qMBA=;
        b=pO0chnUFcmMjpQGL8javWoLRSyUWcLP72WhiMpsKUbXrTTqZUDewogu8LiGyMHkqXb
         j1RaPb2jSVUgcIvdTVYJHrruPjo23WN7MM80uNkxS6tmCvjhAnWK/rIqs5fQ+FCnvwDX
         8dt3J67NJvDZ/PHIsexUjb0AJvxcswcyVCSRd5mu8b3DFTJYDTe3n99sabid1Q/WeI0s
         lQCimL6a4lhxdiPvyqigrIoOrk9D176HT33sQn0BdPTsIuGA3uhFq/OypLZ+AYSoyGYd
         KWfh+bN/3xGozbNu0wm2LGgtQPAD8je4Q6IQkmNwxM/qSekYmBDRZoSmCtP4wPEgXzJh
         KhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546388; x=1791151188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMTK91isCtW7K3W3fSl1Ctwz86tx7+iRah3Eev0qMBA=;
        b=BMaZELZ2W9V8zJ2AqBTjPBNLflGjN8UrzGr5oyR6B+XOOYWmKnK5TqBUV4S8MOB/IH
         ThO5dnipBC3bIxPPsyH/xMblB6Xpdhpt3NBNIJjkaR+P96EKEAFK9Zh4jn18EhEctULB
         /NaUkTrdUdcvRKUAvTrvM3MKY9gTWGLj4I4JtJTMO+G8ZMPY40nwwiMCi0MYFWXeIYys
         G7v5pB9judBNvj43/cgIHKVvHdSLNeNzZOnwrZCwULAxAI3sEUx9K2JFmhPo0DbyM0Cy
         XsjVQm9nqBRfcaOmQ0oCJuyCF3ksdcFDGYBXg+gd91eeICCdNQw9AwV3IQwtCJzoCKiR
         H27w==
X-Forwarded-Encrypted: i=1; AKwUvBz5ujCUruMbecnK5MUFrP6mzhsbQBtPxwMQHLyVD6xwovnR+mqy+MzFoaMnHvre8Ka7Xo/pOVPSwFO81Q==@lists.linux.dev
X-Gm-Message-State: AFuF++kmvHTQ/0iGzzPetICZvm1BDw8xpdWFm+oYTjhBECAjXKy+pxL7
	xUsJubeMZsp56EkHqQYMEHXCpJHOSgX5y9f8FIjqi0MUW0DBsa8f1n0I
X-Gm-Gg: AYBFou3ZoECBNmHRKCxO9z21Mfz9PujoaiiEfhh9pj3xCrL8SEM5xGgdsCqXx014qXt
	RNi1k/wka9keF2D801N8E5gSihR2bOODyf5xpWFy9sAfPAD0c4WEoC+Wyd8LVpoTOqJj963TzUT
	yhWymRZlv90byg5tahu37Vd+R0napQwIg7wUIi2HSaudJuwvUcCPCxD//rxulz1E3ojRtBP7nzB
	VVhtoy++cAH19uRvpm58wQWfctP7C5kyiJhZwMuWZHA8cIdINCT0nwlQYqEyQxFe5cqaIWuNOP7
	A7M4PwlhG4fmr9cAcYdOsLqfnq/HDisDISKxIOZm+1z3ZSbfOA9UQreSYCXMigyln0+BFTPnEA4
	pgmyb0eXZG7f4Z6DoKfLfhKGarP4fbLTncIBRRtRUN5QgvW6zeERIHKiuAvvggXGNP4BZYIEbFH
	mKsCvK0taJ3yRKIRPnVzkp3Y7wHSYDMSZcxpZygwdoEiVnzF+JcdCOadPvY36yrIVieo96yxaYg
	A8F2sqjGX+1C4ulihCVoCOH1fPpHu2dlv1i0V2H5sq79FGk7xpjzC5dilijCuxkuP+V69yx/8FY
	U9OvjFljHQZs3DUK8NU4oGsfXRSU/tC8MZz1uvkDgm/ufU1jfyf9nmJsBt+u1DIFGU0ybpqOG+D
	2B3o8eNdjxraasrwsSJGVObbd+qf9I5A=
X-Received: by 2002:a05:6820:81cf:b0:6b9:8413:89b8 with SMTP id 006d021491bc7-6d4411d2841mr11892599eaf.57.1790546388198;
        Sun, 27 Sep 2026 14:59:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81b3de6f7e1sm4874147a34.22.2026.09.27.14.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:59:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 15:59:36 -0600
Subject: [PATCH net-next v5 01/19] net: stmmac: unwind the WoL IRQ after a
 safety IRQ request failure
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-stmmac-reset-fixes-v1-v5-1-feec6c14dd06@gmail.com>
References: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
In-Reply-To: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jose Abreu <Jose.Abreu@synopsys.com>, 
 Yao Zi <me@ziyao.cc>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, Linkui Xiao <xiaolinkui@kylinos.cn>, 
 Linkui Xiao <xiaolinkui@126.com>, linux-tegra@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The IRQ setup paths request the MAC IRQ, then the optional WoL IRQ, then
the common safety IRQ. If requesting the safety IRQ fails, cleanup must
release the WoL and MAC IRQs, but not the failed safety IRQ.

The REQ_IRQ_ERR_SFTY case instead frees the safety IRQ and skips the WoL
IRQ. Allocation fault injection during live XDP reopening reproduces a
"Trying to free already-free IRQ" warning and leaves the WoL handler
registered after the datapath resources have been released. A subsequent
open can then fail to request that still-owned IRQ.

Move safety IRQ cleanup before REQ_IRQ_ERR_SFTY and WoL IRQ cleanup
after it. This restores reverse acquisition order for both shared and
MSI IRQ setup, including unwind after failures in later per-queue IRQ
requests.

Fixes: 5c2215167d12 ("net: stmmac: Add driver support for common safety IRQ")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3ad9252bf6ae..894de213b92f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3828,13 +3828,13 @@ static void stmmac_free_irq(struct net_device *dev,
 			free_irq(msi->sfty_ce_irq, dev);
 		fallthrough;
 	case REQ_IRQ_ERR_SFTY_CE:
-		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
-			free_irq(priv->wol_irq, dev);
-		fallthrough;
-	case REQ_IRQ_ERR_SFTY:
 		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
 			free_irq(priv->sfty_irq, dev);
 		fallthrough;
+	case REQ_IRQ_ERR_SFTY:
+		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
+			free_irq(priv->wol_irq, dev);
+		fallthrough;
 	case REQ_IRQ_ERR_WOL:
 		free_irq(dev->irq, dev);
 		fallthrough;

-- 
2.53.0

