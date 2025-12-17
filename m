Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3137338599
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Dec 2025 08:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765959939; cv=none; b=OCoq7nDLkfRlhTsyRm4tCESisZVgvimB+9Ae/6UfHLMtZm3KP0egbGJb8wS7+dzARp3eVieON+hVuUMEdEVTUXCohPgw/lWz05W9foZuNwIB3J1vDraVCMWlyDOIs0sS370UKwGjMjpuVBQSIzKn1x8rJZrGhg4c7fa7Fu7tG8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765959939; c=relaxed/simple;
	bh=8rK8UObtNlXunH3ZCqgjs2acF9kkhu7gtkhWT9H0ndc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rrl6jNI9o5yyK+nk+xddpCRxTLUV9SF8I9E9jKQYF+p6IkEw5eXlcyzpIirZU4q3SdiySKaPlrGtP3SHm30beZRpbsoQRkZeeKJQZSjCvxhdFbPa92O7v2rVsY8RABQeaD+hPSRfl+blQBfOP5kSPEHeQ1RSB1dE0soPvO9caRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tgJq2G6n; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tgJq2G6n"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AF128C1A594;
	Wed, 17 Dec 2025 08:25:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CC1C6072F;
	Wed, 17 Dec 2025 08:25:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE0C7119502EA;
	Wed, 17 Dec 2025 09:25:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765959933; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=NBiL1YfDIGET34Id9XIjZ47HfM8LVPK1or9ae7Uci6c=;
	b=tgJq2G6nPfnc4g0pNVcNkONaQEneuCLW6L6pcrABcxqM37l3tmbyw7q3OWFCPFQljO0HA9
	uYwsGyrB+fDFIg9Kvd0CMGwlwqGXzqTBeiN3sZejKHErsttrrBTqc1JdWIRcQll3CJE4LJ
	X5u3U2/IegyB0rcK+ytLAc6mGfJqqVepWOtSMsHrt+VQYiFaleHZdPWn5AN/JPH+P2fCcv
	4O6cUjosS8+ZJwZSELEMF1D7FeDDbAEFaiJaxQJxbSON28z3e591nDBQfl/H4/t22mV5Tq
	g+8iPup5cv2C5bkj3+fekFM1iepqkCtVLuTM2Jk/QovawtRVl7gdOn6HsC6PZg==
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
Subject: [PATCH v2 4/4] MAINTAINERS: Add entry on Allwinner H616 PWM driver
Date: Wed, 17 Dec 2025 09:25:04 +0100
Message-ID: <20251217082504.80226-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217082504.80226-1-richard.genoud@bootlin.com>
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
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
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..df2de03e6e38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -903,6 +903,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
 F:	sound/soc/sunxi/sun50i-dmic.c
 
+ALLWINNER H616 PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun50i-h616.c
+
 ALLWINNER HARDWARE SPINLOCK SUPPORT
 M:	Wilken Gottwalt <wilken.gottwalt@posteo.net>
 S:	Maintained
-- 
2.47.3

