Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F67A3F6C55
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 05:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141786; cv=none; b=RMGXnbgqAoPLedsDAhxxGR6i5mTKGz0X3990wRvrU5Xz4nMv9pXaPNwY3oq+B1FXdjt3bJnKU7vXTkJX/CtwXCO+zGbTIa9GLkK5MJNx5jZdG69F28Im7qyLHTanHfI6rLdgSDBDLZdAw1OIJSPyKDuz/dKkt8yP4DKlowzRWGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141786; c=relaxed/simple;
	bh=5k9VLU6OvtrGZi0gO1yZy16OfwqfrZmQwujeqIifWv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pLpt5d7wYxF2U4P6fQdFtY+fMyldZd3yyuJmL213WjW+q0clX4Xp34798MumbmZaiIKxfrmEhDhshf847vt8iTdxpYEKq4qOJTZfenZOcC4hMN+I5VlmrKBzhMq1tIqVUAFyjIErAoox1VI1GZfdpgcNNpyBwsjDrb6WCXnw6cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sE8n6NLt; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sE8n6NLt"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a3688a2so516005b6e.0
        for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 22:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141784; x=1790746584; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=sE8n6NLtWLFvddfvL9/e7QdrDyxIIIuyXDGjUNjEKpAqIWPckZHoJT3v+Ybrjq0v/d
         LlTIIFB83JIR+q+xzt21rmGRjpnD1BhTu9Cbjqq3Dn/bz5JKX5qc6LX+tmydwFOM1NlL
         AwuZPUmP6lPxaUTd75PsYPPYDmQzfHu5GWBf5tvYjEI+Ino56/yJLwEgJmpEQ9sfnsx+
         jZ+/WsmwdPpm0RJ/04JB0mqXtA+247HrQ6nF7h6L8CgJDcwhJthzYJ6EAhzSsoCauwqc
         KWLbcta6nvMibUd2NwoXUK71P/EurRpUkn/o5LiSCmLuiPWRPEIL1NFrT2INGp6Wcl42
         RK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141784; x=1790746584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=0KdHZBvpdjnxCo2ScrS2+3/KGJLyyI1MpPGNLRV8/islS6tsCCgbB2yMTCLjzesxZs
         ny363m9/tPMKkOlX8Alhe4FzRMDLqS/teju7H0E0+15CNO8O6CRL/hqvGw9XJzrSJnYd
         YnJ6WpQzTq3JvtFdedUJuq6wLnn2SDW1w1JnJ0INtkckWW/Xt5XjDDlP56/dVHq2X5KU
         G0U+q3LxWJdupLMq32ncQ5Z5fB2Fx/badeMzKvan4mF6uWcvTWNhJKwJxrfzKYP7pngG
         CxpW+6+I7Cqf+7jjZbR7Rg16hAANMJ3aaSMu44PjaaHUM7PrYgHxaNgNiHpxM1qgPmzy
         gtfg==
X-Forwarded-Encrypted: i=1; AKwUvBxUgPlha3jwo3ZBoZEHJUys3tHE6Y1Dz2lhA7tEPXAp9rt+trxkvrsgIqHu7+AbPBXOtjIAZtw1vrdmmw==@lists.linux.dev
X-Gm-Message-State: AFuF++mqv80pKtSvpxp20RAAQIlvXgGD2IPHgSkuHKxJ0FCUPqHYFi1S
	kvls2yrQcWn8zf7eLqU4Vzk8SZDzzlOmLzArv8EZkowbv7MN6NMuD3oIGABQlvxM
X-Gm-Gg: AYBFou15YGQf6KxvW+LNHKcg1eY64TjK/EVplXspG4bx7SeQlYufjDr+RK9g2f1+AUl
	1qi+yiJRTtSeWtmeUeyyj9JMyXvUw9Xk+z4ujAYaHxCo9ZLoYxLRzYeVGi8nlEi2hm7pMSGU4tn
	7a8l8YiJDyMYCIreV6ve/8xsbF7oaFVdW+968/UtqV+z2VuuwykBKNlO+edCcTj2JPSW8yjbx9G
	j/Q46JdJOrGOmMRG39XhU3BW2By1rO3ZLHL7cEYDMlckSc1h8Cc5fTns0QDTn/ahe68oPe97HKX
	n/ogNMHUnNq5f6k/EQvQDJ+LJcnCObqUKwofeDijAKCDGUQs1S1t8vLhtYqAmXA0jLDbHiCPDAb
	9XLggMvCI0Djo1foSaZ3CbULAhaPcl0PNALW400xqsLoZb/SF3il0HaoUMeAMO2cpAdn/5czo4D
	9vgEfq4PuVKBE5sR3b8O7yhVVDj8cQtnd9zDiuffQZzBAE6QeVWX1FsadqmHUdPZIsOi/1SQL6f
	9t19KuTVaQPwAW52oR5Yuqql2dVALgPr36O8oGFGQSA/0RJYZ5PUGYCNCsba84GzjaMrwJYUE/q
	9wseI5nl93X+QVeZkz7LUz2L25SklNWRZFEnBLe2XQ37VqnZp7lIEvqjRloFLOzq1iTH/x78SIC
	yamcpS4L6yQ1ZmV0cF28Q
X-Received: by 2002:a05:6808:6b8a:b0:4c1:9127:c0fb with SMTP id 5614622812f47-4d5ba3c38b4mr1883196b6e.36.1790141784089;
        Tue, 22 Sep 2026 22:36:24 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 23:36:14 -0600
Subject: [PATCH v10 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-h616-pwm-v8-v10-1-dccebbe1aabf@gmail.com>
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

