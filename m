Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CF9472F8E
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 21:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785878866; cv=none; b=hNgyvYawcGG987dSdqf46+OvD/rvpg9UrMnzgRI6MKcEh8tcLPNqgEzttA17IwZFdn5QY61/MbpH+L+1nMHR8a0nzMhjYtB8TCIxMrG1QEzmyGh4IbdinQU5wajex+fzPY5rDfSF7EXlEFTSpSovWXSKGKC6XX5m8ssr1JS395c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785878866; c=relaxed/simple;
	bh=VGb1jfHkMVxOapYytE16mS2xansj6G9Y/AJehlGO+Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uG4yS5KuM6LRlKMr4p/h9L3z83em/2XKYSQ+10InF4ME5sLzlSsQRijA0PxF/+h8q9nyvoytkoDX7uZ8cOSFcty9LxnsbP+wt2xIGZBeiQHBCcat1445we77hGM6eI7zPyyd1455FGwQprVB0y1XXc5Ig+eIZ1T75dcxO9QJREU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+YknqrO; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+YknqrO"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-497e6956acfso262418b6e.1
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Aug 2026 14:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785878862; x=1786483662; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Elx81wKiFvHIBGMAjiuzWwDTmSw0D6ljnUBG1nDCbuk=;
        b=L+YknqrOOgC02s1QNTu6Be2OgPNsy+nTIMELh7kLpz1owMB3OSx4MebxKbfPqztKM8
         1ApfVDmorJ8p/ICRszstNUe5hPWHYeq9fT1yVzVEiIbbyjAQmhW4PKFOq5XQGG4yqjXJ
         Hh1oO6I7N5Gj9Ii1YFiLgAlnMM5X6me6xk2xlbIXySZKbz/vbzAb1Yucru96K1yk+Sod
         Q79I4mpXF0DfAEpQWjjBlbzbFzsc63U0AFy6KcHtlykSjV3JYf+Hwq5HXTBYYCkB+20L
         01bnUE5J2N0CwggJTZYCaQZvrCVqpCM0q7qqsUZ+WKF2RAbKNWLmlr3UP4uqzxMS/aHz
         wYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878862; x=1786483662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Elx81wKiFvHIBGMAjiuzWwDTmSw0D6ljnUBG1nDCbuk=;
        b=rgLqU3TFR2xD1BatnFQqmXhvbGvEkzVGhPqpn2+mI8ZR7R7AQerRwJvaTj38gnCPn+
         V+h9r/w4v2p3SSmrZTz3W0AjsnoMRE7i9G0XkSXBzq0RPGVwzPuvhiWEZm8IoTU6dkFb
         jI9dd6rwUNggFK4QWSzOrLpqeJMnkWicr1o3pfqsxR3tRsHn0s7un4NNEmdF3nWt73/8
         mT8jYwYpOiFmIdpgeYhpW9V7wsy3Z3IG3O4+OyTynpUdDIarSD53IOlsg/bzN64HRFTk
         Kbakh54bvKUbcPOidniztfYwoht64IXEDYk/geUdQC26bUg+p6SA3A1kLifegu6czhvZ
         CNDA==
X-Forwarded-Encrypted: i=1; AHgh+RpUi7BzQ6JPXcQyefV3A8V54wSZljPC4ndNaEHc/EU1Ym440imdc4oe6nE1CrXpCYf8n6qYLxkGlsQETA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRtLV05jqJAkFC4HZOlqs6EmmAXZOlZSIx++9hLQBkbGRDdcjc
	qJ8eNn+Zzt5k9HlGaM/HN6mdXYJOydkt2aI4y9X0tYzPy0jpN93Wp5oY
X-Gm-Gg: AR+sD10aMWhjUZPq+kXmx3bq5S7r6Ym9nfeuLiw5uoLiDnsKFmo6sKCTiAFmIDpUYWg
	9MMZcfZ+bnFRu74VaxJrpIsYCWz/7EKEPx4oPekXJQOaxS2qFc+3/Vr/NGmFzhsWJStsiDM/oWD
	U+VKMkCZa4jJqypICeF8sAeLuPiHHrC0zlTxSXSolWKZXzxwC0OHxI0S0ll1Q0X0uB45diuCCSf
	NcAt0JIpvLZejHIyZK13ZmEuuSS+TXlC+lZomdlpdpg8c84muXA5bF+cE7s6ftdhLzpY5s+X/5P
	UiWknZHInHgUZMIBIrZJhugOaJ4TKHuxCNNngl1YbZ5wNZzw4mGsYcrS3yxgx19GTEDHAS8XhNm
	kiKI+fvWkRTbiLcIeOSuzDKnThr3o6txgl/isW7tQINEj0YJBtrMOnPMUfhycd3yhL7g8NT0d2a
	LrIOxHXE5EhxcDblZRyJpDd4Hw/jZy0XilHeCzQYFOL9kobfXu/1IF/PuQXarEa681YjC0Mlxnq
	e3sGI+YogsKqA1kpXomF+90v+OReE8tYfqEarTh0uKbvVeIF5ZV+XDndQYDmLSEVEUY0AWavH9M
	sf4ModcvbEFGRvLdA+7qxBGNuDmSB+uc49lPCKWX1cl+ChpJEH5YgRrALetWgei2vVknL6Je+Ro
	oSneB0QIETiFxHr6CPY0hi7r6Ufo=
X-Received: by 2002:a05:6808:3510:b0:4a4:989:bb1f with SMTP id 5614622812f47-4af98935a91mr6058342b6e.9.1785878862648;
        Tue, 04 Aug 2026 14:27:42 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae7c50e9sm451659b6e.17.2026.08.04.14.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:27:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 15:27:27 -0600
Subject: [PATCH v8 4/4] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-h616-pwm-v8-v8-4-db37ab8624ae@gmail.com>
References: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
In-Reply-To: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
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
index 5114e6db7307..9a778d1242c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -919,6 +919,11 @@ S:	Maintained
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

