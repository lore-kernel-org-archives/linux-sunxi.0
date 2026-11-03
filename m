Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695243;
	b=LpJaFc+wzOYV5udOdE5I2smX/WIJn0mgNl7x9zIK4Tcyt3U5loaZZDAaWf6fDweFWLNO
	 S7fV3LSXVkmXRLuxy0HppHKHe63NXgDXzw1DC4CIiqQ6PMoXVKaiVIO7EEg8u/ho0iLd6
	 RhkVqSKbAja7TwxDGMf8VIrhb6DxyqjR1fe1YINOfqKdcu41gFWfKeVau0kKP3q4c8vdq
	 TGc9kaXVpPkOH/qmQ+m2TRn0hEKPNRExYFM5XZ+uJ+JfyTvS9/Mj559/nSsHGW6bEZk5M
	 qITFgrHemm0uZY9GtFjNtbg5+IADMhEaO5xq9KKQpWgWLezCpjdJBFfFgOTyfq4ll/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
	b=GvWIg37wJc2frP63zU8gmJk04u217R03WPT7BHdzAODEOEoCsFM65DhbewPiowAkdiWD
	 L9AtPmF2fvHyDPE2V/AhY/cGCdaFRmS/etfQs2Tjvqu9BptsHcdXfpFgEQW1PIbn6pD4a
	 D3VxUqCTIGezZZn9mgcPA3vCPWeD2ngk920dKp7sZ37Z3yPAnzTE5YCg/eHIHp10em0d1
	 Afl4A8D+Gf2iplcTgffioEYz0QmClXL6tasoNIChnaah1Zm+qWeGrXwtH9WA32yqBmRh0
	 548LcLXngGpRE0jZYzl0H7qH/qpz/1RdF2Nk2qOT/yieY3O1Lj0oznkYFc2PYsDK6Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uvee5Hwk;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6FE606D82A
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 08:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C6FE606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uvee5Hwk
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6fe4372c5f3so2638846eaf.3
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 00:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695242; x=1794300042; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=Uvee5Hwkp8p6ltael57UpeWC5SdWRcUEQuu6daT9zDIHZwsLTR4CmQtxawmL/nUA+a
         IvsFRI1EHSrcNJ5XQuJx3EQTFeYsZSvG25J2mVIqqIOWtMRRSIiz4OpATGAmr9T+TvPu
         gIYwVCqC8yQKY/srI+CAneS9UWqgCT/6IZIAPPR1ngp3vu2rbYqn2/GAJ0N9Q8jeyBtJ
         bAKs5PvnsOfoRnt5Ulh+R1ZsKMn1A3o5wnq4pybIdqGeKFPusAa0VU4mfnx2lIkTpnuS
         xCmBpiE+rkA1n11vUhw7xYqk/N64UNrXPT48gn7HM20g1r/UbE3GKsLhJJevesyGkbmy
         gmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695242; x=1794300042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=MHFZeWmG8pQHPvwlXtXIFk1ZMujS281R9B1JTqiQtRwZMQxnMAtaW45t1aOa+mK6y3
         wjkflOKyaXSWSwRfSZ0N5IyZ+OGSipvISN/ldTt1v39yAnjdo6K49/OJP13oGSKHZ1t5
         O/J57q4Rc6gmcgkdhew3lPRUL5M4GCUsJgassSLeUSc6JTSXD78dx84kqtmocRmS3HOf
         zW4aO0izRJ+QUJIWIJ+TEHiwy1tZu2FPkwY13XM3nJ4FeDBLcArVR0n7bc3r1FC1rSzf
         xDgz+iYLXe/kc5GT2PrVmDDdi8JqkaidbI8FMvXV9IlY46YuU4bABpuwrvI1gMPCvMZ2
         B8Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwZ/ewfdTiz566WOtLsrpyg824bC/iCZBG6Ru0c6ly+RKDAqr2lygMuEMFGbAryrlrvKcxCqRYYMIJ2EQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8MwEgkj1qLzHoEeHu49Cf9sU2kBLAAK/qqr1XfFg2AfQf1CXbC
	FHiqUmzI9VcaTJRnAKGoDSyvBkOFrfCANlPUSGNu/clArY1IFAEZohCr
X-Gm-Gg: AYBFou3OH2bBZZKwJzugWr4rrU/yjVb5BZUTGSkUp1vIgsT7nREXQr9kfhumtA8BrW3
	aDInx0PSZKC7w1qMt2naBb75me9sU9nuxcr97HVZDCqmfMqCa91mkz22IrVbQU3spx/PI0CAnAo
	3GakE6G7pJV/dgE0kVJsP/M+3Z+CDuQFPPrvlsdvgKDX0yXUEdb3k3lnrsNiyMrGTyvMuQjkalb
	6D4HtyNEsYC6xHtOZXXOMdkb0+vsnQX7WvyX29XxHP60WpNyie27ku95+B1RcEaufFLK9dV6xKc
	oNspeHC6LZOu9SVbNa2FSTBujv+JAnz/JJnlHYO31Hm8a2xl9QTdqr1gUq8gvcd4B43IhAieE2n
	w16Rg0i2uWV1ZtxjZoqzGR3yOiwcyA209kr92CSaJbBV89q8hiU0Wpadwp8Vmb73X55iDfnSWF3
	K1m3WFRAbt9uBpFHkV+UJPXz/Kkhl7uJdWgFTK9Jxlw88XLNV4F4feMo+tJLQyTio2uSNb2JC4Y
	8d3xQYL3aLd7UIMAsOYL15CXYzRBXOo8jn1aF2MtNvkGFJhHj+96IRri8DThumE5OGXcB1U/2pg
	QCME/JPQ7dpmnjprpA213jwGZCvwbScr6raB5IdzkS55+In6dRZA0Fd5BGHBHG/LaGZqIX9W1gV
	OUkebpkfTj0G2mW0FoL0Gn06jyPJ3WdvcQoqeTCTCeChz39JNtlRHGeyXdMH+f8MIzZrjapVfJr
	3Wag+yFjCUSeaCXnIizTy4JAR8fjVKFc+L9O1Z+8iRPYgf0w7clDQ=
X-Received: by 2002:a05:6820:240b:b0:710:8db7:5f57 with SMTP id 006d021491bc7-714f2ab5e9amr5840218eaf.78.1793695242282;
        Tue, 03 Nov 2026 00:40:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:30 -0700
Subject: [PATCH v11 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-h616-pwm-v8-v11-5-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
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
index 93abbb315065..b80ae0ac5eed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -947,6 +947,11 @@ S:	Maintained
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

