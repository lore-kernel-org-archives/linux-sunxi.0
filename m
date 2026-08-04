Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544DA440A3D
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 21:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785878861; cv=none; b=VSEPchVhDtFR7GBVDqnWcE/psgrO0JKKIZlsbtrb6rQy2Ox6XHd8wrfgOixxE6+mgpmlXUf0SvKfD66+3bmS8SVJGXZT8tDI7fJcECSRn2PQQS77+4MK/kL19K7wiumi/VdVWYK/AG2OmFepsmoymt1SBgpDu3f7xCwwyYf6Hk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785878861; c=relaxed/simple;
	bh=3czOY9Okboe0CqTWBtAucidFmXyF0lxRkuvX9UtfqlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OT1L8tB9roRXAVpLDj65HVzjPJ20VwrjbQD2vUM/wEXl035xM3VDeKwv3ha3WdNoibKD5VL2R54F9D0RqCGWTRJuhi11kA7lF7dfSb1ZOEWpXfoXjlk3PQy26hxasy8RCZR7b0DlzFJhEdjzMVVPxWjEA1s67D3ZOOTlzRvwYuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jo6M0R0d; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jo6M0R0d"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-48a0ca07c38so202849b6e.2
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Aug 2026 14:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785878858; x=1786483658; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzLX9GA0PMOy5TOxJvHxVnH9yoPV2TfmIgWpC5Rtigc=;
        b=jo6M0R0doYacNwxpigJdLUG2b3CYroyovEuAdANhXGRDAXeFT2PqgXiVFjJBbSXJ4b
         /iFX3J446yaC3LJNIhZZAWw4zvWLdpBWbrh06RbvYTGfb1AGyptyvmMSe4ymjpIY9M7r
         G6ST/un6ujOQQdY0APsSf+TrrLS+XESJkCaJms6hn6hqkKBCvhqBTFSCFU/rlhI/WMrE
         x2AMIDJheah+7zIQPHMqYcHlzojhlh6hKpCigeAB8Vhm1jqPFk8vMKdC49KuWXz9I7hU
         p+NwD9nboykGcF0JGQKYjG79t8zW0LOPzINYSy2IoN1udC8v08dr7UPegKyUtDbuiytY
         /BbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878858; x=1786483658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JzLX9GA0PMOy5TOxJvHxVnH9yoPV2TfmIgWpC5Rtigc=;
        b=nbsMxueVKIrtbfl8Q62+GldsONZY82y4Bpb452kAQtrlRMQfBSUQbiVE0a88BCpDUr
         959XSbqBz9xbGTElahiThI4cZ8P5QzSBlq6oK0vpIe42KBL3KYgoSWOmu8E5HLaKDaif
         B/cQuTktVhnxOLt+uadFK6R9fdvQI2EXo0/d8WYYynX2ktRd2+q9qTf00SzYFMAIJ9Qj
         7b5H83mmilX7L1Pam4ruR9bT+aL8y3iHqMwCT85Xor3S1P1PXetdnZCBhqrjKYAduZq8
         Mg8P3nLnV5vrqPpwujhWdEGPd5NcgLCM8EYgAbiUYMw4DhEj9LgsrIjNccbhypOw5AAH
         POKQ==
X-Forwarded-Encrypted: i=1; AHgh+RosHj6HCquZSUNPGn3HZoy/IAXWGAB3XLcnhpKZwBBBdg6G5E6ubKt5cBHCty2NOOGxDRiXCgjvBJJAuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIk2LF1J77rBKngaZN6EakH4MFc8aaqESi4wd9bBg9cK3gh/zD
	Q4G3GKnYiyY/I619N0pVc4UYzWdOLklai4qBpo2etLXb5TZIk0HLuzOB
X-Gm-Gg: AR+sD12lRisDFat18UqpuU4o4LH3RgCD+Br2lE5O3RD64Aqie2a7jmXfpjTbLME1gd4
	uIDOFmVnKDe6wCj5CnoE1w6XjW7A47FRwM0AJtm/leZJiP96Wg4LW/nVSg/fSi/TXiDdj9fiSt5
	HliqxdbvwIN3Rt1YFe/sHRi3nYSiHeHlB7eGYz70X+/4zkkhq4yrOjtulduejIf9+vb1ycBCa6C
	ZPk9N+c9ZrRDEd01vkmKWNp26WWzZqcCZ1/uBP5eGNRMOf2amMx6Bmu+luU18bW9bzsrJS+tE1a
	pSCPYElWjEm7H994nNzKo1v7rkO5sr75zBE7SQq65YAQecNEJsme4JKE5NUYDEtdkGeAyWN42R5
	/ReojgnULCM1IxNcJYKVmJaJDCsPHUXJBFNWSlZ+fnI4lKV2qeeuYtjutBmtikYcPzcppYu3g+D
	sxMY0VW7L+wClqfpZVz+sErrHz0YobSNSNbzqHlOb6UXbqfJj18K9Zw1FkQ/a+/IPUfhrgxKmJa
	3vl9cV2mitsRf1p+i5U49DFj4c1WAU1KkFAT/zxPsz1+RIMRKUD8zJjc0tz6XlPxrtdvuFif2WY
	ZR59jFSX6rkyHb8v8hnZjywCVYhDA4p7d22CSQxEHjNyprorU0KkuAf4pa3M3q654YeyFdkr/rg
	MZrsZR8H5fxDtuMuySRSyWQwLnxTi
X-Received: by 2002:a05:6808:524a:b0:496:11f1:f2ad with SMTP id 5614622812f47-4afadd7f963mr1120843b6e.6.1785878858060;
        Tue, 04 Aug 2026 14:27:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae7c50e9sm451659b6e.17.2026.08.04.14.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:27:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 15:27:24 -0600
Subject: [PATCH v8 1/4] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-h616-pwm-v8-v8-1-db37ab8624ae@gmail.com>
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
Changes v7 -> v8:
  - require both the module and bus input clocks for H616
  - require #clock-cells for the H616 clock provider  (reported by Sashiko)
  - describe the channel-indexed hardware bypass clock cells
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

