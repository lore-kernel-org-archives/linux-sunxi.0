Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820311;
	b=E8UphWAcNL+HZLDaucW+Asw2/CSF97eSvgxhwAcQUnHZncJvSCHHxB0VTpDuHMfUCxBQ
	 iW8axLPiDzO/iDLocriXUsobQq4goNWbpM1LzBpaYQx1/EpgsxcszzqHY/gX7yKDdvhUb
	 ciLjzMNvW16Wnrmph4c1eX0LVlj8YgFu/K77+7qLQAfYnbWvrdZO0UJ2cKxaLG6dNFa9q
	 LpjeNpAEyMWSLHIXJhiGsoFieXlDJ9lUOgiidfojDEC7t2Ez9FM9L+8lB+twCLtswmLEa
	 Ykdz5SlmZfrLA0bw7vk7jhHWS6CLi8Hr1RG2bETxvPTq9FVqnt6PllWY2M0rdCp8XNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
	b=uFlz7h2/nUO89g+yc+tGIkRIpdm+KJJJUII4rxmEHTxqhxDIlVCV7gv+uy/NQTOYWJDa
	 PQiiS5U02q91ey1Kf0VC9qDTZyIE2UJWkI6BYoTMCuhX2eqXNBl7HNhDMe8gdUuvMZmHR
	 4QAQNpKFeyrwqAKvNCp50aS9lRlZOj+BsNogcyOgWxLNHfv6hLqF24bIpvO9ytOXeMfTM
	 JDA5aGJVR87TYlJ+zN4yCw+X2QSWI7JAAh2TUmBWp0+rafrP2bW5OTIOIJ0aiHQRmr7lj
	 tk//Uh/DL1NxdFk/S6OXVNKTeTHsA0fjD74h3cJucv1eUv+LzUt+Kn6+g6OKwxYqJTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2wbH2kf;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D33A608078A
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 19:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D33A608078A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2wbH2kf
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8490a7d6696so647878a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 11:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820310; x=1794425110; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=e2wbH2kfjPFfaEESz5lcVqL0vzVebRt59F0vtDYeU5oKTaFmLffOZcH5Tp8CCcSl3s
         r1wYhw9Kx2v+Sthaf5C7kahAE5LRVFNCl6C7TteqdxHnQYYYgt39vIq4wbBu/Z6qrtdG
         /2Y4HlsRAeaqkA8IkuQHNMxtrmCL4xIyzoQvhdn5axdWXBokFrnQkZQjrf3yEhxK+xje
         Ng8ilXJsOSxEQktRr4Fp8lK/YEoSj7wk59gDmqDR7YbCZTUPlhbUECqyFWUgKe0RFuxo
         apsUv9M66yrjp1YMMuYhWsx6drAyISNARTlbQWZ+PrAgu+12soznJJtEyOq9P8hBbuAF
         Fs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820310; x=1794425110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=hQntNj70Sp00CIWU9yl68hrLPPQ+w+G+QHXRCTMuAO7RYbDDvcP0ndImXmvh/81yuc
         D5rDzE4AwwzaeW/GsY06e+buwGW2vl6gO+jzAyWikgvghV31ANWRzmNVp3AH249BKY/8
         sCbcjqmaHutY4TThqvc2JV/uNDTfb7Fm1b21uCEiRWPPFmyaG8EAXjKghZZn/BlDwm/e
         2FfelIOTSCj9nSpzbfUgvgFYZL03rOSeqSyeXa7g1OhazAKy/YnFDt3/3x3ZmI8QVDYZ
         GsUYU5er2HXyPr3kF+UK0zexGnDFPKXHtIL++JC6+JozHmM/jfwYruI98GRHvGKH4qBf
         JY1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxClafntf1Si80EBqo7GgrrrcNCpJDKtYulhVSIVI3PbssnDaJLg7++oYvIvgxTHbKd1j/tVovJcsGawQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z88/KKDen9VHYvmFqnQKAsFBpWxSR7vYjVpR9k0d4NVNLYvDDKP
	K8IFontR7xC2t8vgdWkZGDAGlgd6SeqXUUyJN8+lVFeagZtWXmQYpRlg
X-Gm-Gg: AYBFou2+6wW4xMPQXVK6NjEilzXiAXsSXao3y/I6Pza7KJL8orapFZvPeRs6fEzHJJj
	Di9NN7EWMpYsC/W6lmrx1x9scT06gEIpgXKM4HvCnLo1EBFo5p3+VhzEbAAdmg29CNueHMZFdf9
	EJ5ALBe7yufxv863WeRp4m7T3uv0/plhGOzhA5q40I1N8TV1a8JnISzqjyTFQyl2KPx4DYlDKCA
	1e87eLXHoGTEB0M9NGsC1ZGAl5IiTw+59c0tK2C/iOFrBsIn4TZG+2rH0Pl8j7LMMCXRzlMkVpC
	5KCgcSBLGOwymvPOvJYg10eAa7N/7vdGzHs7YxvMYoHPI3ujUuJKGae8YtkBcFLM3KIw2P0eltY
	klqMymOGHpRs7WzVFTqQz5hWHFGPyCpytPC8VGL4RUISjDUbQkenOvZe8ub/dn+pH/dMUYqzDWU
	yqbmliz44ur5wULOq4gWilmHF2zfQNresck4UCS/oXifYE/Nl8NrfUO+V/ofHLxFB7AXytz10DJ
	rNtDdIz2cncR54ZakN91Nc/8tg5maw+QoRVBaz0yp34FWnK2mwVzhxJwC3Ji2jy0E52al2oiVB2
	lK6wpyXMwQO0TDuVsQXSpT4RC65B93StaMDgaiGXKOYujOEJmCQ2fWkVPifCYze24K8jckBcB5t
	mUruaYdc4gUVe1q2HKCvalwOYV7QWKppgCBhe4wthEe61k+Iau70RqbL65fsuxi7Xj0AvS/ywho
	8T7XtbltQcAMnYGChmEsr+1NpTvu2JkBbj2F315peKzFsqaP2/1jBp
X-Received: by 2002:a05:6808:198e:b0:4d6:9293:9b56 with SMTP id 5614622812f47-5640de2e892mr13003756b6e.62.1793820310505;
        Wed, 04 Nov 2026 11:25:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:55 -0700
Subject: [PATCH v12 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
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
Message-Id: <20261104-h616-pwm-v8-v12-5-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
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

