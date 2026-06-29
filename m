Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1A8407CDB
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736959; cv=none; b=Qs3YppwOFnvH9YePnGrDFnFlyIggEsPhX6TnUwbG1GTl5Bs3r5JKnynu75FQ+Xiym3/nFH8EPCVcLi18ymvO0hxOE2/3hfBYxi5elaxfdud5pn8k44s6Gu8rjR6BEE8S3qKwfJU9LRKk3X488RcRJpJF1pDtueCocz0OCKxpEdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736959; c=relaxed/simple;
	bh=FoMUBVpR32MtJZer6V8lgBnEQWSbZvsirk0xN6alb7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Go7bQQL9BeUKVkxAaTc1kNAGiYG2NnpNl+T1l/S6waBiXVM3DAYT+cjGSn8fTKSV0W50LLc4sj8FxP/EwTQjamYcu6CepooHOq8aBPA51lwqSCsLsrK8OC2mwsBtPe6bL7Dj5PNlK/iXrREplt2c1aPQM7vlFi97km9WG0aSxVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PMgJv9Uq; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PMgJv9Uq"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-474303f3c72so470476f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 05:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736957; x=1783341757; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pw83rsiBFZIUZWx5sliCML1fBJ0c8WhT+nfZEUBGdLM=;
        b=PMgJv9Uqj6eLhBEihHdodOPXmX4LGPtVDnbroxPLObfTBkdBsipQqdd7kPpWL4/E0G
         11LOMYGOkb6NCgF2Pb/GkBdJkaxaqGuA90R6MpFbbg3z5Mq8BxdYdsv4zsOL3PGTQpIM
         7tb9rp1rsZ8M1BnEeoFGVJog8NIL1N9Q8xvZm38DJr4/8axPyr2NBpQXJOVGrSdrJH12
         ccqPFjY/dpjGT8Y6ABkuqVSts9IoaJKA2jfv2ghiueoMGUfjDbeidZlTWrcPG5rvoFPX
         DMzVeB94rfPxd9Cd2ciQWIY/J6BmePJNLQUUsVt7JlacKENygne2qSFb5ZLheV+TjIcn
         s24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736957; x=1783341757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pw83rsiBFZIUZWx5sliCML1fBJ0c8WhT+nfZEUBGdLM=;
        b=aew7VdVqupzR/GysxY+aTsipf/KoHz5RY393HElLINg4EajLuY15PYvI/3w586xhDo
         48f0Q/1atmZ/4T7Pp7ZN5rDEfXs5Bzyl0bVzDB0dkzIs8xzgl0jxgqVdUdxzzcIxlta3
         ZifkDUsfUV1OiIFiIeaGu/wuoUlWp4nasqPKBE+OcubnSpOr0DcX5z4jfwtZgxaw55Bt
         G4Hl+7VMvd68NZ0chTY2w/oD2ZMi6s5eJlr/RhpCO9eG2qtXqlVVBwk4x3Yszdv9WohJ
         JaKKJhuJ+dM8U+YoX9G1lsZOH5E9ZeKk72pY/odhB5MfM5UHDvW6TebKiEAbbJPYZlyO
         Q+YA==
X-Forwarded-Encrypted: i=1; AHgh+RqXE6flLS2Mwld60gFZi3FeGK1B67tzMRqq5fIe6UWOAFJYqvo8FOdNFsSvQwFGbI/rSB0VxgFdzjyy/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRQNS7uVJmlb530em3lIWB62reP4P/ztUiHXozy+hc/zoKbWzB
	CVSAcXVZfukAHuanECS37B420fu/oiLUXSZ8oPDy7pTF1MOlcIjofo+sdxrt6TUkT+8=
X-Gm-Gg: AfdE7ckU6Q15uTuRC/vRmsVvA7c5AumdDnnuUeCzPU0bNUrXCW4p3oMTPW+a/LPDLbj
	LNBEar5Pvg5tC3I75rD1mp2h8KFkLL6ILKhWth7oFuVZJzxVQKKh2FDsmHplbGrbRkFZbdUKbyh
	bSIEd4fulXvqMEKRRrrtz3e/IeGIHdiUhcO2xG5S1mEBvFLIi+BcKBE25z1A+ob6SFGHCVnR5gW
	oYw8xqwx1c+YWKzuVvljzkggNWRv7E/qfz3NZyhfZqD2SxWUf9lQaXwWvluZahZE2m+f42wXSzO
	oBXZ32yVmbvEN+1xLwhWX4tJL3bF8WZs/i3co/81BvHzw1nZmJDL67bUirJ4MIRWNcegs2tm8NS
	JPYQnbZOlMGkxNn34WydwoJEUK/HvRpC3DeXpLQmGWzf2oXoiLFyHPdCxP4qVaRro7Oy5szN7Bp
	0KjyvHohwCi+4=
X-Received: by 2002:a05:6000:2c0b:b0:466:6ed8:1e1b with SMTP id ffacd0b85a97d-46dc263a79fmr26849485f8f.21.1782736956641;
        Mon, 29 Jun 2026 05:42:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46f9db29b15sm21643420f8f.18.2026.06.29.05.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:08 +0200
Subject: [PATCH v2 4/6] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-4-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=FoMUBVpR32MtJZer6V8lgBnEQWSbZvsirk0xN6alb7w=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgvEGszTwRXVQ3roYF7XUovP55Mn6aarufxX
 8kePw4A99SJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLwAKCRDm/A8cN/La
 hTF3D/wL66zdurLSHBXauyOo/Zxl5eIu+ExlDjOXHuoU9nsyPbxB/Fvr5arOgZKgvkzeEFBeNyD
 rAJUqyTmc6DVlZirO2UJrSavRMrcf+PRwdB+UnjMkSCdqVrVRG57FRA69nk1XXGZooC99EBbYdG
 bhssIXwrI+pW1uDUGU5nLIn5+FoTUHgyM1DL9Wldf6WnJjpfYxvSmQLtGGwBK6Jp80BbtvgBVka
 FTJVT0SjaBvXOqJOYhqJaAHPveNEpUEhV1DgPiydlgT0i88N6GkXizHXfgPNom3dpTjQ1vPrRum
 QCL5QHaaIPndE7AZcGSyZAQ4OaxI/yEOEIbKFlAggihe0wBUWdf9tH9wiUVdvDZWrpErGfeD92F
 c9w3gkhEKwy47mVjQJcH9gGIF+CTmr3ND2kG3EzotXk+61Ok3LmVZcKWPSDrddLk2rY4x6LNqh9
 dJyxjsiE4Ee3WyWGcaDN1ajaqAavcA25KwmSg3BooXCtZPsk9rMDvcvylni/8+CoIqKYOwNwh7c
 xdUuJ66mrS6VvpM8TLvIHuoyK2t9uhapPTa7a64zx7i4RW6FP+20MIBepUl4nU8BvisqT3l+iKy
 AfZQswZZ7g+C8UCJH2Xb000LCLKJRgS/Ym4EDI5eEbwLYMTbotAmQnFlaOzSmJoxoU3bav2VMNW
 v1fkXBQp4GKAnTQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 11 +++++++++++
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..0e3d9e6e30fb 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -143,3 +143,14 @@ const struct clk_ops ccu_div_ops = {
 	.set_rate	= ccu_div_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
+
+const struct clk_ops ccu_rodiv_ops = {
+	.disable	= ccu_div_disable,
+	.enable		= ccu_div_enable,
+	.is_enabled	= ccu_div_is_enabled,
+
+	.get_parent	= ccu_div_get_parent,
+
+	.recalc_rate	= ccu_div_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e97..a30a92780a05 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
 }
 
 extern const struct clk_ops ccu_div_ops;
+extern const struct clk_ops ccu_rodiv_ops;
 
 #endif /* _CCU_DIV_H_ */

-- 
2.47.3

