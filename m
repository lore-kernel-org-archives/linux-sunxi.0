Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B242FD68A
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Dec 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928985; cv=none; b=t92V06QxIJpth8n70WMkZ6PBlnN+A/yzI8ClBefZrJuf4yFVhDUyRXYyMaZA3SE99p/RP2XnQnEj8asR2YR9RtAl+j7Kv6fjDf1W7IgKh8s1n6uTXQcMsKZJqBXyzdYloHoS88/ppSlyJbPX1FUKeRoVvVXyeM4N119dIo/9Tsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928985; c=relaxed/simple;
	bh=Y1FAYJA48M/Xcdycplj+Xi9Ecwdzft2Jl0ep83NiIVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1Vlg1PGWlcnhTsS40bcOTe5WH7Is2M8TwnytzqLTiMKF8CkTqzWcAlOGHRLwvbLn9OCY8OeTBoSTYbPp4gfb+2Pc7TaIURYIZnRPk7w6qNMkyVTY0l/onb+16d5Nstzj10MBjKzRM7Ewuk3IeVzmM5Lcvy6X5mDQRiki1aiyQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QYH73ycq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QYH73ycq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C97654E41A66;
	Fri,  5 Dec 2025 10:02:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A04B960731;
	Fri,  5 Dec 2025 10:02:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57C0B10B60769;
	Fri,  5 Dec 2025 11:02:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764928977; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lcJDgYt4uOmEYvg+2YJwYcGPnE9cLxBjU9f46SXWfsg=;
	b=QYH73ycqdkq9nIP4JkzGLReG3T2s82hM1YeCDTJ793yrPo/JT1ry06U+vbdF+Na1wJhdc8
	Y9dp/i4/OtUMuZ6Zlwhh8qDWBxGrf3PTFqbRqIRlv9Q3+LgTmW7Qyd+kLJBwqijd5gPrBw
	Rjit5qI4EgdGffp8AXFuhEy2AN8mhN9GBsEI/fLt9OmUNtGy9Deb6HkHSvfpBV2DkDsz9O
	7xCgbQ7WwKr03gasvqBZyqJ+0WTHV9zWfY7YxXGQRQyQyHcDMVD6xzYB2zHS4IKwS87TxG
	BlhVJIRXY1dZbAstlx88WfIrlCfcYmo+qraM+vB4nRhg2jM7sdzsyJA+zvu9Og==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 4/4] MAINTAINERS: Add entry on Allwinner H616 PWM driver
Date: Fri,  5 Dec 2025 11:02:39 +0100
Message-ID: <20251205100239.1563353-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205100239.1563353-1-richard.genoud@bootlin.com>
References: <20251205100239.1563353-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add myself as maintainer of Allwinner H616 PWM driver and device-tree
bindings.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 578c068b738b..b336c0fff4e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -903,6 +903,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
 F:	sound/soc/sunxi/sun50i-dmic.c
 
+ALLWINNER H616 PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
+F:	drivers/pwm/pwm-sun50i-h616.c
+
 ALLWINNER HARDWARE SPINLOCK SUPPORT
 M:	Wilken Gottwalt <wilken.gottwalt@posteo.net>
 S:	Maintained
-- 
2.47.3

