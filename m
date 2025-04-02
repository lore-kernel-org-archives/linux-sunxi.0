Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C4723645F
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Apr 2025 11:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594350; cv=none; b=XcYLmfaLdpOFcDyb/nK6f421o14V8rWpXeUs+jrUmaImSCl7B3K6cmL6cv1q+/Mre7slvwaqvs1PZR7U4ne+v4Zt30gpvaM4/jUywjXpzdIa7HbTgI3W3EV4U8qj/6PvaDGP7KrfWJsNwwCYCbeq42IIO9fUeePqqhr3I4z2wwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594350; c=relaxed/simple;
	bh=1FEXNb+3sgwnhrzy3P2QhZYbooTBMvl6WNcpdOtLPqc=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=QwyaF68Cxy+phEvuKSuPjXHSietBluCEI/gnPwNxDcT3FrZCyUv3E8AhwQqf3vQUsTEyIvhvyNamS9AxLQeAma2UZkhkuXdPWTR0XAYHiM5+qGAudFrhstqw43tYDbZY3E23AXw54jTYYs1sKbVEtK8FXy3m1KqKhQ/6EfBAoEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZSNNR0FSrz8QrkZ;
	Wed,  2 Apr 2025 19:45:43 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 532Bjd3j070014;
	Wed, 2 Apr 2025 19:45:39 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 2 Apr 2025 19:45:42 +0800 (CST)
Date: Wed, 2 Apr 2025 19:45:42 +0800 (CST)
X-Zmail-TransId: 2afb67ed2366ffffffffef7-237ea
X-Mailer: Zmail v1.0
Message-ID: <20250402194542026OH8jAzuv0uq-J-D9AVPqJ@zte.com.cn>
In-Reply-To: <20250402194100610qY6KQ4JPISk-4v214Qs36@zte.com.cn>
References: 20250402194100610qY6KQ4JPISk-4v214Qs36@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <vkoul@kernel.org>, <robert.marko@sartura.hr>
Cc: <kishon@kernel.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <samuel@sholland.org>, <zhang.enpei@zte.com.cn>,
        <linux-phy@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <luka.perkov@sartura.hr>,
        <linux-arm-msm@vger.kernel.org>, <heiko@sntech.de>,
        <linux-rockchip@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgNS81XSBwaHk6IHJvY2tjaGlwOiBwaHktcm9ja2NoaXAtdHlwZWM6IFVzZcKgZGV2X2Vycl9wcm9iZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 532Bjd3j070014
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED2367.000/4ZSNNR0FSrz8QrkZ

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/phy/rockchip/phy-rockchip-typec.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index d9701b6106d5..94d1e6ead1a7 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -1151,11 +1151,9 @@ static int rockchip_typec_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(tcphy->extcon)) {
 		if (PTR_ERR(tcphy->extcon) == -ENODEV) {
 			tcphy->extcon = NULL;
-		} else {
-			if (PTR_ERR(tcphy->extcon) != -EPROBE_DEFER)
-				dev_err(dev, "Invalid or missing extcon\n");
-			return PTR_ERR(tcphy->extcon);
-		}
+		} else
+			return dev_err_probe(dev, PTR_ERR(tcphy->extcon),
+					     "Invalid or missing extcon\n");
 	}

 	pm_runtime_enable(dev);
-- 
2.25.1
