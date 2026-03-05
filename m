Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AD1377EBB
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702430; cv=none; b=lPInHWQSgxr4nm+qm3+26lhmKVvNTvsW5oTLvMxwTrDpagu6dm72d5GTxgnlntrbu0ksHAlyuYxSD7EcCne6xY0tnZvm0FqC13c8zh/BLkwYKXfrQpoSwZ5qrEy4VjKYYUIuPLeFJ2/wcwT0aCw4WrQC4wrWXwZuGfiU3h+JdpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702430; c=relaxed/simple;
	bh=HqdVqRbPd818waPKLUsW51+PIGKiW0zHXZ13CSnPEtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4vB2QfNAQlonB0ukuZBVUqMllD6p5XghZdEq/oaqnGaFPDZHCb+nH2MhWrHxS+hLhtB01cPQ8wSXcQyOLjkDa49sHn3pg+XKioEne8fy8ICUzJ0m93ttrigSm23BxkZqu6eLY2AdXRliFFwy7TMXY9cDgmnpHZ0ztpjcLVmF84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tOYNQlf3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tOYNQlf3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BB6001A2CD7;
	Thu,  5 Mar 2026 09:20:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88D5B5FDEB;
	Thu,  5 Mar 2026 09:20:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E838F1036984D;
	Thu,  5 Mar 2026 10:20:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772702426; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=OLBfsemePbGUtd8zlxtnOZP/YHwWEby+hKn6Mo2n9kU=;
	b=tOYNQlf3rSv8k4jM7bLv/IjCo2eMugbKS1z9Pvf7CH5NI0SwrPU7EU0JmgYK+PjkXMmUdR
	8Sdyyqc5iJm3fyFicXgL1gKO17Sd6S+APWWqgOKaEbDPkl2P061uHgYtQ4dPGxUM55dbil
	K0FwgbVzX7O6b9OyhI+/XgE7Hepwa4S+ByTyI0PE8Lv6DjmUdtm12nvqaPeIdpzGDaxCCT
	vjhJEDRQ/tF30dIqyfu2okxh2yNbxbnyuEzp5EreHWI+7N1kFyyT4U9yhKzm8lprZxwcKR
	5xCxS6jdnh5ZAjBp9AMLmjQIRHz2FnlSNs9PEa+NYZwYaxTqIIP4b7CkbDPMhQ==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	John Stultz <jstultz@google.com>,
	Joao Schim <joao@schimsalabim.eu>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/4] dt-bindings: pwm: allwinner: add h616 pwm compatible
Date: Thu,  5 Mar 2026 10:19:56 +0100
Message-ID: <20260305091959.2530374-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305091959.2530374-1-richard.genoud@bootlin.com>
References: <20260305091959.2530374-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Allwinner H616 PWM block is quite different from the A10 or H6, but at
the end, it uses the same clocks as the H6; so the sun4i pwm binding can
be used.
It has 6 channels than can generate PWM waveforms.
If the bypass is enabled (one bypass per channel) the output is no more
a PWM waveform, but a clock that can (and is) used as input for other
devices, like the AC300 PHY.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: John Stultz <jstultz@google.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 1197858e431f..4f58110ec98f 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -14,6 +14,9 @@ properties:
   "#pwm-cells":
     const: 3
 
+  "#clock-cells":
+    const: 1
+
   compatible:
     oneOf:
       - const: allwinner,sun4i-a10-pwm
@@ -36,6 +39,7 @@ properties:
           - const: allwinner,sun50i-h5-pwm
           - const: allwinner,sun5i-a13-pwm
       - const: allwinner,sun50i-h6-pwm
+      - const: allwinner,sun50i-h616-pwm
 
   reg:
     maxItems: 1
@@ -62,7 +66,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun50i-h6-pwm
+            enum:
+              - allwinner,sun50i-h6-pwm
+              - allwinner,sun50i-h616-pwm
 
     then:
       properties:
@@ -83,6 +89,17 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: allwinner,sun50i-h616-pwm
+
+    then:
+      properties:
+        "#clock-cells": false
+
 required:
   - compatible
   - reg
