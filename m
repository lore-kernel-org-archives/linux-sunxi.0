Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820305;
	b=vGTYvQTnVbalK858oqadcREJJqdpksE6gfDvBm3tAP96A8OGDL5LvU9pgcWoATcU0SHo
	 T59ks+/C1T4iSlV1I8L+kXXdvWU+fDzU08PS5y5Y777HechqYd015dQR5sm2ly6ugvSXh
	 TdkG0HKe4fuZOlKyhD7UZ587/qAmNiXBb0IUyhnfL3j6geXeOU9L+bkYzibWeHlp+U885
	 Qq9StC8Y21zSCXQi6eKT0hwLPlslIveVPf1r0NDEK4Jhrrs7Dc5S6yBRLOolz96Nt2xWD
	 Gaxg+fVb1DTSfWw+Iy6lxS9fkAyplpZaRIQRbyK56iqdjvpgAAiExvfMHAq10WkllaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
	b=2rwvJai1ORQ4psnO0BRFZ6rguvb6735oo/aEpp/tzyCokSoaGccZyLfiVRXUvBdV83Q3
	 fAYhvEYMd3iceBlftYdEOXN88DKvXH7ohlhcWlJJmnJkTpY4Axzk4T4syZZYyuXS6VNq/
	 wBvhWFglbHiZgGeIxt0e7ohtRWHsJ5XpUaI7PWiAm8qtdHhKmfxidp6rRLgZBkFVM+IBH
	 s9T8zRpyx6NVOJVXWx/6i11cW2ahkQIdY/fAWCxM9RYHReb02X+zUHZt5V6ZbvjLPMbVH
	 jhKWMzUgRCYfywNuXKHdeqzDnUH4rTComliDPST47CBrt5jSyYGYvHsh1NRMY/1b0IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A4jboxSy;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7A0607F289
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 19:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7A0607F289
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A4jboxSy
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-5058b105df7so428037b6e.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 11:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820304; x=1794425104; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=A4jboxSyRXqeJkr1C8Tch/CYtTYhFoyNqD7MTENlSR/xfaCaZwap5Y6Jlnm3BG1d4C
         GfvFZfMLwKAF/5kknTk/6uP7eDbiin0k8s5h7P679J3GiUK2SSobd898StnqUf3PZ2V9
         jpMgtPZkD/vXwmbuFfoW5jKS1fx4OspxjjCwa2B+h9TXYxdsfMZM3Y9ZEnA9oMVW6dMr
         2i7IOYb8WWLlK5MpGpahrMAE9j2tHTWrXkrSrfg1c9AmtKEvAAgopilmuPgkknoz4PPq
         YwhwohKwBE/ZCc6FbaVBscgMnbFDag/NJ4LOB41LBEVVly5CqlkvP+GB2qUGg3EgTyIs
         J0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820304; x=1794425104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=dSxszimLkXvXRsidmiF4ayb5FmwibWTI7Rzu0xrMg0TTFs8+6L9nmsCm4Fhb2B8cG1
         YzkJnVw7tDAF6gwUicUdO3iB6CvdVywgJptMFPt4a3VL1v0FZ8Dj8dYzT3R+pxthCRUC
         Wx/SQD67ofEMGyZl+dg+/AvA9wnp4PJ8bEn5t5WWfnbnkjS8JKR/M3udaN8T7STScYRK
         wxzPCaDVskdnireeMgSWsonyjtxjndFcQzzbOSXdt3xXRKRyIz5vbIY2T77mDJkLR4ms
         l4jGtr16zWvWmUPxJOskfHiAyqKyt/TYN5Jg/cL6s6o64mCIZq/WEqXhPHUdd9nhhRQK
         JXbg==
X-Forwarded-Encrypted: i=1; AKwUvBzeiZlWk1OcjWtv84hEykhBQa17qttB5gWJW9BjHqGZmwTQZV+dAp3pIDSHcK0jvph7PqKJHK93IBIWhQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9+qpSnGk13b1R+yYx+WYbgc9vAnJJLJtpPxSgjXcUxK232qNYp
	dJYc13XJhNF/h5VLB3e8SrhVELraK5/s+pyghYNhXfwFvl8JtuL2GWum
X-Gm-Gg: AYBFou1N4XmuYn2M1R78sUTU4dSkumT60VN8CZdo8oJdt90h/TulBnXXpEFAdZeWBc2
	WBn4z/5ZcwydfoyrHQJ8rNJ9XPIF03g2qZ8RPY+0exRxMSReFyzj4A3dRH9J2AtlbZRWd8W6jr3
	qowofpeouwn+mC1WI5GxHq2qfLYTofw6OuaCH2X3yzqJzfkRCc++TPSJG3DfR1semRudGdXWnCZ
	M1bBD9lL74f5kuulc5VKx+7IMf094Ei6bd7GHSTAU/4S0FcxyKNl8kVAhgEf5Xj6RIuIOn0bbxN
	eSKfBoVNg4J6nKQUIqDls+my4IWV6O1CuJbNgJforBoQCDus30gtOPw2Rqs9m4a9+vbWpZO2So9
	H8XSAGqh7ZEErUKc0j24u76rPL0l/IZoLQzn3dVW8w/6TT3IOve+14o6I+Mgm1SZh9Syq3h9H1d
	5KZlMSFCrxdoBD7JmJdP4guQDSxhxdklj5AxIA45Jn6MziqLdZKOSgydZ+QGeDS4noNxTXbGOeZ
	E2h0Ri+xGBWTM5Nkxx09fkrEb7ujmCtpfA6fBnEqlCOi8/gS8ToZIrAyqeov6sMaWOfA6funAU+
	ExR3SZFcRTdw80/fTSOiQaFuBYKrcWwROT5EYcSxeoenFrZUoRFmBDuIQ1A4if60/knoDJCWG0l
	b8J7iiRoeRp8DDANep8QdYSqCvFmYbslrtek2EbJ8fvHA/ybfairMgWWqI4HOKQ8fOT3gCfB0tu
	waIdMiLqpauK59LWKMwrl8+zaMCULpY9ulB/KRAEbywbSmoV7M4jHLHs3o5yxgcvHHUNaGwJo1D
	/M=
X-Received: by 2002:a05:6808:50a1:b0:539:596f:6623 with SMTP id 5614622812f47-5640de36536mr13164089b6e.64.1793820304255;
        Wed, 04 Nov 2026 11:25:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:51 -0700
Subject: [PATCH v12 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
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
Message-Id: <20261104-h616-pwm-v8-v12-1-8ed39b0dba69@gmail.com>
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

