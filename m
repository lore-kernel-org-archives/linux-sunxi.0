Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF54349B9
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 05:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141793; cv=none; b=NdFrXMVSjM7U/gqVEHUk6fTNNoSpc50mIH3d+NLP8zrF1Yp2dQV7EZtYYNI2RMQo8KOpGdM++k0hhMvyVIc8vCbay0sefmDB6g92j78LezqZd4OTR8axnRDcNmxoUELasXnRbTFkyP8mmUc/LUb1pu09sKQqwE27OM/i4oW3H8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141793; c=relaxed/simple;
	bh=OJS6mQlRWmTTimOyj6kC0TvQSBszoDm45iW9XPqV2AQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8BD+Pnshjd3MVh6CX9dKNCJKEcLAwQs+r4e+eHC9cPAX6KEj+b9lrELKD4zBmdamhF56/GpVwLlN/XGEjM4sOtQE1sLN3d0DuV09U0wN2L24q5Wc2dpz1C7DTl6EOUd84FYAjbglFZx6d84ES9bYERnzicTuR0CYCXFvalNMGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdmuxrTj; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdmuxrTj"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c537df4daaso283894b6e.1
        for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 22:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141790; x=1790746590; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=OdmuxrTj8Rg0L8Xfojy0qbxLMJ1AeUI1z2cgKzw74VWpnIGK0QeFEAhGVFVuV93KFm
         r82IGYhK8m8P7v3U15ANMISkxet2fDUQBPxKkQrfYCBIs/ZXE+jD2hB/yKYYFE0V7kcz
         iFzIPEDdiJEz+vOx6J+viiqojLifSm6uU3MmuHRNrrQ0vKFo6/M1T1jiLKZ3LLwA7CM3
         ezh71HLGoujfy68kJZi+utVm/RgYTkVJNsL8vY8qavpYAvrU8PIoESrx2cqTRhmjhDOp
         hkGcHMM4vixGijtxjCCZP0Yw9N0uIWe3wtWZejLSzbQi2qatNGZQss+OcTXGCDIqP2xN
         cCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141790; x=1790746590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhBI/4MYKZ9FiatfUTHQXDlddZz4ARJ+4t2N8WN0Mwk=;
        b=iWlujqPiy8tHAdAlnmuQXyoplXpb2pQuMlJErJvxU+TRGsRUH7zujR6W24g0ZAVmY4
         g8ozDTlkypE8SVgBunfzY0P+fQimc9IMK8Mb17nG0HG31FphtEjc3qoRP9K7iAvvZiYN
         /e0VwqLilD6c7rTTZwMaXSVe526fOYQ55XFZ6jMJrr0Udyl7uPyOKpigZvZmpGoRqo/B
         KZviI45YeY66b2cM5Fk3ytPUk2UcqnkhGOEFUMLxQfwXCKIjtRjEpDwtlz4trLi884zT
         rLVeDrQO9XbZA7qP5ULPBOIzBXYD+hziKP/75FDfpD4wBFNKB7O+KK8hlPujeOnMzqGr
         Hudg==
X-Forwarded-Encrypted: i=1; AKwUvBzhVxxiwOA87SP27OyCuZq1oNxBwV3CYvBsQWrgpxKSSFikikSQoiAZGCkOa1Fho/mTd/gG6og6NmZy1A==@lists.linux.dev
X-Gm-Message-State: AFuF++ki9hU8dNMZtbzg7FAb2Lnh4tgoAYkUMNVe4MOGd5cXCbVnlC6o
	aEULhcOAfzePdebfl2yhsROOxN4jcuaOq/6eMXyCWSlZaSono+3IzWkZ
X-Gm-Gg: AYBFou2RF/wTUhIRIFp6M5gqBd1H27O4fBRkybpk68SflofoEpyq+bQgt7c+zW0T1fj
	iQbdB6s+cimuvNaWDjlLX5bgwqARhY79/VI24JPk8eFNaBFwpkYxsCaRiPLwbjcmPsDzxzYGmez
	3BJQKuDIP9VLDseUKXHjcMchJC/Y4ILb3HCwwL2qUdn12tiUy0OOfwOdhFST8Chs8kpgXCBcmFl
	FJFqGNumpbZrOminH95Nk/uAWeDnGcwfLu97VSu3Rshj91lumWcm63Z5Af+Qy8M8jgeUABVISqR
	UrEuSklh86i3g4+XCxaXpjiQ/pZnEZcONml5fj4iGc18UbEqrSbZuXPGtiyAQG57OiSgTClwYP6
	OBrX9QWozTsk1g9LJd50pAwlMjAXMnjFPXMkphGQvMdCMBc/0JZOwMnmxsAOHF2nW3hJo9qEE/8
	GcY4oB4dV98zR9axsnZzyk6JmFFe+Pdq4z+FW1zAduKMdyD5Rz2cvU4YQ9bnXDEIm9owBz6LT5O
	N36VuiUAt6HrL61EibIOmrnLhMJ4d13Aj6If8L1w1hBWJisWVhdx4Sesol2siCgjwv+URQrjmRK
	HRD4gQBIrR9+lSLI5ni5ViL7Wo2DI4HtI+/x7yKcXId7NhjappMqTS4DlIlefFK/nmfvb4gokf9
	jYCB7AhODRH+uz4ARxJLA
X-Received: by 2002:a05:6808:1495:b0:4b9:e5fa:8a1d with SMTP id 5614622812f47-4d5ba092ea7mr1861997b6e.34.1790141789974;
        Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 23:36:18 -0600
Subject: [PATCH v10 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-h616-pwm-v8-v10-5-dccebbe1aabf@gmail.com>
References: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
In-Reply-To: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..d9713b1044c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -918,6 +918,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0

