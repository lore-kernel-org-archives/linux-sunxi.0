Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6D457EDA4
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 20:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196473; cv=none; b=Wy/UYbOQvM1nqpcJpMA8rXd0GAfFgwN+AUXh3uOWfJ2KcnGfLQik9UegYae68RSYNS/F3iRf4pCLGiOOk0Kz17RnohfmttnMScs6TX7H7l5iE9+RVlgfCD33acSdyo0TrMMuEeaXe/bGRcbRzAXBByp18PMagBneTmToyo0GKSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196473; c=relaxed/simple;
	bh=B+n/07rbShxe+UCgpvoXo+3mb6MPP+M9H3khzu3hpGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krFnVtRTdNebmJPVH2xiew3E/8x4etG+0dnhAFyN3801376omBi73gWmrFJOOl52BL5GcGfAz936+t59CFUheZyilYzSVJcZRK0RbKs3CcVjtjH7Jy3LsjFrvEroFPx+9YGnXI9qZ4Hm0+zS7HaadcjBeleKadYS07o/9vIUYIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=parpDmj1; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="parpDmj1"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so1001979f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790196468; x=1790801268; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uae9hpUYrYglCWSSadpE9LyEi0ppwlaugCpZRYr3ziI=;
        b=parpDmj1mZUy0BxCelyl2EWrFLIPVyI1OMXqTQ/fPIpLb15ZXtaiGlSLZ/dgphK9IP
         /HSbYHKj8IjKmNrkpEXZ4D8GpHdr+Kul3xsy70wutEdgVhcvJOW0mhRo7Q9WTckScxz5
         gLEXRdlF6KwVOnEi930Umcp3AeL/6f4NsUv5UGe78ay3f81c+g92T2T+ZQrX4ESJYYNI
         kTReEQ8ZVr2BhB3IFLssmimwN3UK3yx12WtCc38IEtApT/BNA76uArJTH4iCfH9FhpB5
         x3/FZsQiKEP0ObJPq/btgCV/NPSonI8YzgpQKEiiuKN7rOv/H9bw5h/59Xyt5J5Y1BV/
         qMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196468; x=1790801268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uae9hpUYrYglCWSSadpE9LyEi0ppwlaugCpZRYr3ziI=;
        b=NXOWT6Hfvn/6nFHdwynhRWORG0W3cOVYtzRpBuKUvlJ3Q4XYyc/3yx1FouqXQ2fEmf
         CwiBercIC/9ltLDHk4WNHMBxPR6ZiZGOzPlX/eHpQOB67TEK4Cy4dUOUnYWGBKLKDSFb
         8Hay8/yIE3GUuXihwf9AaBkwejFC4GaLBZjKi3ZnYJMyd0FxW7/9+9CRbZlYbEgkWVJ9
         22zJ0cEGdhAXOmpXXRMrfjqJhrFCCm8dffhx20xQ+Rjb5RPnH+dGBcF01xxC0pXDDxVX
         CKzIh3RzEcAIKOf8pdSHFX4DFdJ6hAaJDvvrKrb4m9hjItYskgPzO2y7Wtv6KgGW2MBV
         gnIg==
X-Forwarded-Encrypted: i=1; AKwUvByG91nAtyebytNPgap8a+yVYlabfgIXuN886yBqVSFAyvpAgSBPUb7Z68SS2XUaOeUYTii+uMdcCL/x/Q==@lists.linux.dev
X-Gm-Message-State: AFuF++lK7tlTRCHmQj60/Mb6S7xu6Cnh1XB/lV7aKwDS/R/STb6bbdB7
	Q51uMIYlxdbe4IXAxMGem8kRxyodwHI9atrZnNeyUa77zSc9/+kQlZABoPGIXp87xnI=
X-Gm-Gg: AYBFou2PvK02TXS5Iu86cB1pr3LOj1modBoCnd25bqJ17PA2VLcAuORppVxJeVp0hQu
	Z5hWsjp51QgGTs18wBPJIIEeO+u0ChIzqoc9mjj24f4eWryofkpd74T91bE8CiE/nmaMov7R0oe
	EfKDf/HqlL8EVlDM+vYsc18/QPdxUTdAY9IFPzRoq3nrOYxZIiVCCW3OMgbUGQwbrwvEHCIemk/
	XfWDuBFZnyv+aYyOthnsWeatHPgBL7XT5lOCAEjXz13HXAxX9W1f5woDxUSh2ipgeO2O/V244K1
	u9RnRHFhiX9zPwQf8PPqNojZSjDjr1DswRbFcsCASpFxyHNL4Wzgy5L3of5pffBg9WiDUax4Pn1
	RgT7kF/wcMnAFiErHrcfavYCtCHu5OeYdff1syIxWnUSYFVXWdZ9Glv/ecju9tjrntIyqeQ3Y0s
	sUzjnBoqqsE4g6Ox1dPIEPweDCYDwrkNK8+BLiRNrS2mwzXzeie2idie54VyfT6Kkm7mf/VbDZw
	rWyrKbzSbhLC3Q6iyUZkfCtXLsB
X-Received: by 2002:a05:6000:617:b0:486:f46d:bb02 with SMTP id ffacd0b85a97d-4887197b60emr438659f8f.57.1790196468392;
        Wed, 23 Sep 2026 13:47:48 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688893a0sm9653251f8f.32.2026.09.23.13.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:47:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 23 Sep 2026 22:47:34 +0200
Subject: [PATCH net-next v3 4/5] net: stmmac: sun55i: Support TX delay
 extension bits
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-allwinner-a733-gmac-support-v3-4-15735155a789@baylibre.com>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
In-Reply-To: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=B+n/07rbShxe+UCgpvoXo+3mb6MPP+M9H3khzu3hpGI=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbrN6aX1BpNohN+nGv6lzKq6dxK0vWL1vyT8Xpckfx5
 h8t31Imd5SyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAiUxYzMizurl7xTPXxju68
 fVyKXxfOCvqpquYo5qGe6ZfZve+E8X6Gf6r7XI+uWFA929e1/vyEne/vXV83L8NuGev7YM8Wfde
 5XSwA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On the A733 GMAC210, the TX clock delay is 5 bits wide: the 3 low bits are
in the ETXDC field and the 2 high bits in a separate field.

Add an optional mask for the high bits to the match data and set it when
necessary.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
index e759311f40fc..49abbb248b61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
@@ -42,6 +42,7 @@ struct sun55i_gmac_data {
 	int (*init_resources)(struct platform_device *pdev,
 			      struct sun55i_gmac *gmac);
 	unsigned int flags;
+	u32 etxdc_ext_mask;
 	u32 txdly_step_ps;
 	u32 rxdly_step_ps;
 	u32 offset;
@@ -86,17 +87,21 @@ static int sun55i_gmac200_setup(struct device *dev,
 				const struct sun55i_gmac *gmac)
 {
 	struct device_node *node = dev->of_node;
-	u32 val, step, max, reg = 0;
+	u32 val, step, max, low_bits, reg = 0;
 	int ret;
 
 	if (!of_property_read_u32(node, "tx-internal-delay-ps", &val)) {
+		low_bits = hweight32(SYSCON_ETXDC_MASK);
 		step = gmac->data->txdly_step_ps;
-		max = FIELD_MAX(SYSCON_ETXDC_MASK);
+		max = (1U << (low_bits + hweight32(gmac->data->etxdc_ext_mask))) - 1;
 		ret = sun55i_gmac200_validate_delay(dev, "tx", &val, step, max);
 		if (ret)
 			return ret;
 
 		reg |= FIELD_PREP(SYSCON_ETXDC_MASK, val);
+		if (gmac->data->etxdc_ext_mask)
+			reg |= field_prep(gmac->data->etxdc_ext_mask,
+					  val >> low_bits);
 	}
 
 	if (!of_property_read_u32(node, "rx-internal-delay-ps", &val)) {

-- 
2.53.0

