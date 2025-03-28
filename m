Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7D721147C
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Mar 2025 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152572; cv=none; b=cHEYkQ4EodKog0BXNQLOQKSdp0EanU61enzM3ayZ8w3jGWiDQTqax0f2O10mDBdwoo1v+oJIF/40JWls2y5yVw3ZWB3vFEkR4o8aR7nQS5hgSSBVcajNNBdnF39OTquDWeRC9wNof9+1cXlfVtmR7lWo/GB9fmgxNRdb1AeryFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152572; c=relaxed/simple;
	bh=Zv5dbReFel/EO6cMf8sg7s7FyaAfk1JbfOgKVejN9G0=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=jNj1TTdTbW+CSRWYrytHHTPYo7hAABff2SQEIKG1FA/xwI9EotmZmraEnkPMETDKNGEDNacPcGQ6Pl8rvug55egIw/uljadyfc++YaMWCepA6UKWXJQK+iQsa82E439zFrB7hHc8E3E4EJ8sEBqNYxVKM5iEb4q3aDE/AcyRsPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZPF0b0RnZz8RTZV;
	Fri, 28 Mar 2025 17:02:39 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 52S92TvK075798;
	Fri, 28 Mar 2025 17:02:29 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 28 Mar 2025 17:02:32 +0800 (CST)
Date: Fri, 28 Mar 2025 17:02:32 +0800 (CST)
X-Zmail-TransId: 2afb67e665a80d0-b5d3b
X-Mailer: Zmail v1.0
Message-ID: <20250328170232003DGEGnXtJuqky8ri8DWMFQ@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <vkoul@kernel.org>
Cc: <kishon@kernel.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <samuel@sholland.org>, <zhang.enpei@zte.com.cn>,
        <linux-phy@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBwaHkvYWxsd2lubmVyOiBwaHktc3VuNTBpLXVzYjM6IFVzZSBkZXZfZXJyX3Byb2JlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52S92TvK075798
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E665AF.000/4ZPF0b0RnZz8RTZV

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/phy/allwinner/phy-sun50i-usb3.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun50i-usb3.c b/drivers/phy/allwinner/phy-sun50i-usb3.c
index 363f9a0df503..b03faffc160d 100644
--- a/drivers/phy/allwinner/phy-sun50i-usb3.c
+++ b/drivers/phy/allwinner/phy-sun50i-usb3.c
@@ -141,11 +141,9 @@ static int sun50i_usb3_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;

 	phy->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(phy->clk)) {
-		if (PTR_ERR(phy->clk) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get phy clock\n");
-		return PTR_ERR(phy->clk);
-	}
+	if (IS_ERR(phy->clk))
+		return dev_err_probe(dev, PTR_ERR(phy->clk),
+				     "failed to get phy clock\n");

 	phy->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(phy->reset)) {
-- 
2.25.1
