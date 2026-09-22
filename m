Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD9415853B
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 00:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035606; cv=none; b=WIRRcDG+6C0yML5kO1hh19ZxWFH4ehGzkR8k+8OKcPZWvpTOGi2ttPjxyByuE40om4prqRx76PhtMe4V50u86OfFZAIgEf4GWEPXM1OgeVtc5XbwYPYcLGTZuw/SD/nwMuZX+57J01Rjp7HYXtY3HVHr7SJwDkfZ7X5biZu5qsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035606; c=relaxed/simple;
	bh=5k9VLU6OvtrGZi0gO1yZy16OfwqfrZmQwujeqIifWv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRujug1a+uvjnFPS2hWDvjARcagKnnBLPJIwTDQ4XtPy8mh+n1159HNlPWiGZFKbKajOApODQV/MN1tbMgmLDszbJsRZW4XbuLkf1WalJxQMNNEBrd4BSmym1kBDyyAqivBOwKYyZu1ZcJ00i8ty2up1wCYLPXYrKf/gWoOuv9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRJxexjS; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRJxexjS"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6c8f6a53fabso390255eaf.1
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 17:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035603; x=1790640403; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=aRJxexjSbanxazuGRzL/CzQYT59tPMQsCxUdm77+eX0OmplksCsHWcJWWwpf7zZY4q
         GfD4v2LBsPtY9u4mpx8NjVglejA8/wjLGG22pZqvUmtG/8AwuK6q+svGwXP+XeV8EDTU
         sWZJY5XEHIiZekp1oyE0olA57IrkToh8ANcU8Rm0Y7fR/1Dr8FQa05d92I34whCF/GB2
         rBT2KON/JaKaZef6I9tkFDS5L279DVoX/vFLFHnDWC4sFB3Nl9CWcPGR/LgFF21XvfPA
         TnfBgrFztqlkbPz5A3KZ6TRm90p28c6Q277emSDKzgK01pBJ+yKk5jyRcDPlCF9kiLjC
         C9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035603; x=1790640403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=PhLqR1Q1MfXeRDno8MNbzDZfgL34Xu4U+/sAxxtcKv1dKX2sTO4JViftNKFEYiSGR1
         GQpAnJ8DSjrwdYGwscn6P3KAMk071WxW9DAoOG4gphlZWVo1Moq7MEb+F9gir50eHgtU
         2fYwQyfK9iTTynnhJIf1fkbJ66FEWQAmSYmvlAcFHsfTsV4pKS35xnu2yDjxA3e1VaCX
         QRmVnsWo83TiMtb92n0fEWWefGx97jfLrnjrCdWFAQIBvh/RTB26D3TnSykC28GjOcoJ
         AtS3bglyl+HoiO8rd9x6ZguuJD5yGaW0VAocnl8xqnFYApGmJO37ub2le2mu+dC+JyhG
         gewg==
X-Forwarded-Encrypted: i=1; AKwUvBxdK9//S7ujNqxzXlNJkdVMm4+47I6zq3neNfExJKPYB5m+ZZBoVBPjcgTRl+pD1Xk93T9aWyhIHrhzEA==@lists.linux.dev
X-Gm-Message-State: AFuF++mL3Z/FxqRmvrmNPqAA47hRUpJQcZWf9rfcd7TPGzFi2fqyXZKR
	rs1yLptOdY7j4qCEPVBawlAJwsvYek5AKXe4NhoipE82dffQratJsY2K
X-Gm-Gg: AYBFou0ZIuv1T1dUNZwZN3kCudp/7kgH/WuSaNFh7xSoJztxc/lyrvJ7pUyBjzRd6vV
	kp9hjg6//MCDIc/3pTCL9ugJumFB7uBIrC7ulOMlSmzytfzRwk1SVSyYZ77w6ocfxAy+0VInTTD
	LCRkNVALKC0CDl5vDaaQPyzik1mo/4bFoek8uyHwRmGqGKF6cUlAX60kbhxNq15IRpdbTXvxkfT
	thHN25VuO5xQ8FPT/9gzRrunI3g4BkjavUc3ydWFiKqdMiXN1TE6ZXrFzd5IdMDZhXnmJEZ9GtU
	EjR/+It9uBTGFeFLkOe3MEpkyPT3KDmYDuL+8b+oqgA0FSGJuo+/TVxOmXFSzDM46cgrbETyFKY
	tbJWYKhDWOsSwZxZiftEQZw1paSh/GIj52ttSd1sTktWG3gwjRiRYLFY2+MCYlLgVe0S/87AN7J
	bdxDMMtzCkzZwy0qqJF/U6L03wpc8Fe5qh0yd2aqF77sVo125VsC4cMKWgSSUhd46ORWTYrHEOP
	cVUytf0WWM40z/6w9Zn0UThh/UcTAqCIkr/sRwsM4Fq42WtIWOuCEFPVtmIX4G1Nwv4hsAGBKRl
	A0mjIvBbd3NR6hRhZIRvgre7PBmAwzCFSuKl2VmKJkVqa79pLBT/8UYfMp3kQlFttHTZQm3NExB
	zVJfprcHRUSJHIjxmJwn1
X-Received: by 2002:a05:6820:179b:b0:6b1:a146:1297 with SMTP id 006d021491bc7-6d157d893ddmr1041226eaf.1.1790035603341;
        Mon, 21 Sep 2026 17:06:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f7280cf14sm801683fac.13.2026.09.21.17.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:06:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:06:30 -0600
Subject: [PATCH v9 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-h616-pwm-v8-v9-1-37bec6201ff5@gmail.com>
References: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
In-Reply-To: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The Allwinner H616 PWM block differs from the A10 and H6 blocks, but it
uses the same input clocks as H6, so extend the existing Allwinner PWM
binding.

The block has six channels that can generate PWM waveforms. Each channel
also has a bypass that turns its output into a clock suitable for consumers
such as the integrated X-Powers AC200 or AC300 Ethernet PHY.

Require #clock-cells for H616 because the bypass clocks are part of its
provider interface, while continuing to disallow the property for the older
variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 1197858e431f..3b1819c8630c 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -14,6 +14,13 @@ properties:
   "#pwm-cells":
     const: 3
 
+  "#clock-cells":
+    const: 1
+    description:
+      The cell selects the PWM channel whose hardware bypass path is exported
+      as a clock. Its rate follows the selected shared pair source and divider;
+      the PWM period, duty-cycle and polarity logic is bypassed.
+
   compatible:
     oneOf:
       - const: allwinner,sun4i-a10-pwm
@@ -36,6 +43,7 @@ properties:
           - const: allwinner,sun50i-h5-pwm
           - const: allwinner,sun5i-a13-pwm
       - const: allwinner,sun50i-h6-pwm
+      - const: allwinner,sun50i-h616-pwm
 
   reg:
     maxItems: 1
@@ -62,7 +70,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun50i-h6-pwm
+            enum:
+              - allwinner,sun50i-h6-pwm
+              - allwinner,sun50i-h616-pwm
 
     then:
       properties:
@@ -83,6 +93,27 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-pwm
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
+      required:
+        - "#clock-cells"
+
+    else:
+      properties:
+        "#clock-cells": false
+
 required:
   - compatible
   - reg

-- 
2.53.0

