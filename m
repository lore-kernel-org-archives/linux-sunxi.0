Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C7F23817D
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Apr 2025 11:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594207; cv=none; b=C09yWK9av64J/ztDxAJw6S3yI0aJVgaA+uftFymh6vHAf12AA3UFEn/YjmM6TJ7UQVNNQfyy1PsvIPzG7uEc/gbjsYfi4ctt3NyzJtZnfg4+VSXFBXDFLuqlWsFEuIA6SDwmyFb9yJONjImg1BugSoqZAz0jnDwswCHGY9fzzsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594207; c=relaxed/simple;
	bh=Wgqp5CEb0vSe5kauJHqhAOn3abMfSbPpqSVemJyahHk=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=mxZc6Qmuxfz6oScHek36BUYQ5gbpm0j5bGRzuEm8AsRwuecPxQ6cfr0xho9YAU1EqGyDr05lZiE/9sAfzBXCxvXFuir99g6Vq7umZtw2KJxd9vbLRClDSvommgsQqjufnFCVthgeA/eUh/bE8N3HKgG095aYM5HVYPlH6cb38IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZSNKh4Gvnz8R044;
	Wed,  2 Apr 2025 19:43:20 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 532Bh1AM068443;
	Wed, 2 Apr 2025 19:43:01 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 2 Apr 2025 19:43:03 +0800 (CST)
Date: Wed, 2 Apr 2025 19:43:03 +0800 (CST)
X-Zmail-TransId: 2afb67ed22c75b0-20ea5
X-Mailer: Zmail v1.0
Message-ID: <20250402194303339EE86jtSNtWFpLPkS6WiQh@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgMi81XSBwaHk6IGJyb2FkY29tOiBwaHktYmNtNjN4eC11c2JoOiBVc2XCoGRldl9lcnJfcHJvYmUoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 532Bh1AM068443
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED22D8.003/4ZSNKh4Gvnz8R044

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/phy/broadcom/phy-bcm63xx-usbh.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/broadcom/phy-bcm63xx-usbh.c b/drivers/phy/broadcom/phy-bcm63xx-usbh.c
index 647644de041b..b9e7f750567c 100644
--- a/drivers/phy/broadcom/phy-bcm63xx-usbh.c
+++ b/drivers/phy/broadcom/phy-bcm63xx-usbh.c
@@ -397,11 +397,9 @@ static int __init bcm63xx_usbh_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(usbh->base);

 	usbh->reset = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(usbh->reset)) {
-		if (PTR_ERR(usbh->reset) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get reset\n");
-		return PTR_ERR(usbh->reset);
-	}
+	if (IS_ERR(usbh->reset))
+		return dev_err_probe(dev, PTR_ERR(usbh->reset),
+				     "failed to get reset\n");

 	usbh->usbh_clk = devm_clk_get_optional(dev, "usbh");
 	if (IS_ERR(usbh->usbh_clk))
-- 
2.25.1
