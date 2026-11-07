Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038906;
	b=oAV+0NL/V0zO1k4N39D1ExbigT919Kpt6ws3CUDGWa03lE0UliEyzVHQRwhwPdplObFv
	 5SFAAfUeC+PlhW2yuEOKr2EkMpkamK4ERfa6Q8US5ISZxY7s7FqFQbfUjIxZKQZemt2OU
	 2e9CAOel4zOzhIB9CoKngO6Iv32OsryxPs7zVnmo7jwAfXdXo+QFmHEC1+ovIRLe+Mub1
	 JJkbEKQgPhDcumVShCQAvxhCf8i9E7VFFb8kBLrtrwoqlxJdG0ReLC2GgwK2wU+jzKX1y
	 8biN2QO8oLxzMZzxdvdYWnz5M1kfMJ+J/1WOfT4R2l+TMJr+Y1V9V7kRPRDJl5NXXGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038906;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=zrJYAF9LebqD+H/242H7Pwb7Q/5emLnbPPmBS+xTCHg=;
	b=RgkjAiOJWRfV4dZD48U7QzCIvYk4UCcrwAeBvhA2C8PtM3YudXHDNhve98rpdyatleev
	 mewdTpQ/aTAXiDNGkovWRz264f0j6L1qu5EGp387WxUARnYJp1b3hdthHXzOphiOUIT9S
	 02PjKcOTCcNKGSaTHl73A0ZB0y+dERg0nezMp8R8Ilr7i/CBNa1kwraZ8qMwpLTW1FvjG
	 1tNLVharCApX4ll0VOP8P5kc2UDeppwumnQPYGJPfrcXEXdazmYcfdlOtA/yC/xek2eX+
	 al0SK+sKem6h1NI8rO176xIlkEAUh8VSNVlH8UDKJHHZ84IcKQX/clrf5+xylbjNUHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CF0606A334
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 08:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53CF0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM7w8641rz5B12h;
	Sat, 07 Nov 2026 16:08:24 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6A788Kub096651;
	Sat, 7 Nov 2026 16:08:20 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:08:22 +0800 (CST)
X-Zmail-TransId: 2af96aeedc76952-81502
X-Mailer: Zmail v1.0
Message-ID: <20261107160822723MQsHLesOdU6-MJoFTSUkb@zte.com.cn>
In-Reply-To: <20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn>
References: 20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn
Date: Sat, 7 Nov 2026 16:08:22 +0800 (CST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
Cc: <lgirdwood@gmail.com>, <heiko@sntech.de>,
        <linux-rockchip@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <wens@kernel.org>,
        <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
        <linux-sunxi@lists.linux.dev>, <kuninori.morimoto.gx@renesas.com>,
        <linux-renesas-soc@vger.kernel.org>, <srini@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDIvNV0gQVNvQzogd2NkOTMzNTogZml4IFNMSU0gaW50ZXJmYWNlIGRldmljZSBkb3VibGUtcHV0IG9uIGVycm9yIHBhdGhz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A788Kub096651
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 07 Nov 2026 16:08:24 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDC78.000/4jM7w8641rz5B12h

From: Shao Mingyin <shao.mingyin@zte.com.cn>

wcd9335_slim_status() takes a reference on the SLIM interface device
with of_slim_get_device() and hands it to a devm action
(wcd9335_put_device_action), which releases it when the device is torn
down.  Four error paths also call put_device() directly, so the devm
action drops the same reference a second time at teardown and underflows
the refcount.

Drop the manual puts and let the devm action own the reference on both
the success and the failure paths.

Fixes: 082723fee626 ("ASoC: codecs: wcd9335: Fix SLIM interface device leak in wcd9335_slim_status()")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index a98d1fd78925..0f8c9ccd8500 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5136,7 +5136,6 @@ static int wcd9335_slim_status(struct slim_device *sdev,
 
 	wcd->regmap = regmap_init_slimbus(sdev, &wcd9335_regmap_config);
 	if (IS_ERR(wcd->regmap)) {
-		put_device(&wcd->slim_ifc_dev->dev);
 		return dev_err_probe(dev, PTR_ERR(wcd->regmap),
 				     "Failed to allocate slim register map\n");
 	}
@@ -5144,7 +5143,6 @@ static int wcd9335_slim_status(struct slim_device *sdev,
 	wcd->if_regmap = regmap_init_slimbus(wcd->slim_ifc_dev,
 						  &wcd9335_ifc_regmap_config);
 	if (IS_ERR(wcd->if_regmap)) {
-		put_device(&wcd->slim_ifc_dev->dev);
 		return dev_err_probe(dev, PTR_ERR(wcd->if_regmap),
 				     "Failed to allocate ifc register map\n");
 	}
@@ -5152,13 +5150,11 @@ static int wcd9335_slim_status(struct slim_device *sdev,
 	ret = wcd9335_bring_up(wcd);
 	if (ret) {
 		dev_err(dev, "Failed to bringup WCD9335\n");
-		put_device(&wcd->slim_ifc_dev->dev);
 		return ret;
 	}
 
 	ret = wcd9335_irq_init(wcd);
 	if (ret) {
-		put_device(&wcd->slim_ifc_dev->dev);
 		return ret;
 	}
