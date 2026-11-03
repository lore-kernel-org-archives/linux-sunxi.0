Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695236;
	b=4YpzgM/wLsx99JfrCg8OJcsmSWTn5+NMnwqj3mQDRNac27z0+gsApDSV6MIvb17jLZF6
	 tytMwqH7cKS7hSXaaHkWzqIeM5XO7THnmjn9PCyew1vbUEEF5ZDD7LkBt0tY9q8dQzrX+
	 tSKzJJD7M1IBe6IgB+a3IPtypLW1wqjw3SOHq7xlo6P427EXcsVmxiGVEpIxVPVkyUDp/
	 iBI9PummUaL3JF5qup7mIVBm6dqybZWJjFoz8G/VFa5NdDdgfIB4GOAHG07CvKGf4PX1F
	 4eGp4TafY/s/l6YlR9x+vJeLFSktfttRiFzDiRZOEbGGc+9gT3GwKFwPs7YXyAItrBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
	b=Fcs7r8Qnzddzp2B0tebeDg+5DUNi0v+DCqvjAJukrENDySN/BvkUWNl5Zi7wWK962zOu
	 ylY4k9RBOt4ggSsiAgTzs3i85Glkyz7jfyHR/v0egdttVOUZpZmY4nZMrESp3SBH0ujSG
	 FOFgf073hFJIrXNtPYcKBcjQiHRuJp0N3T47/QEZ9357/3ApRdUOzXwL1N5YlZ2PZWMca
	 iED8cs0NufDYsKcwDw1Yjrd3wI7tvaNMYkeiLyYrxQcUf2hSsWDJTOQtiVmT3I9bG76pE
	 DQQbt55sjl8uwSL5xQtgrr18OLet6FY20lChIlpC9p7SG/AdlRlvPO2zdACfhVVgvrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUa2K7MR;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5D9606A954
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 08:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B5D9606A954
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUa2K7MR
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-706113e92f9so2172730eaf.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 00:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695235; x=1794300035; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=RUa2K7MRllhQIHhweE3R2akTBhUTtROoG3vwH658NLFfkr/fc8P4D8u0tvrrP1gX8h
         I6xMHZTQc9ndxr3JMHv2GfNVUIRkaB58UWjQHIY8AKtxop907eIEblGOc+zev0LnKTb8
         KNdoyUC6RvHa4kJnMRYO/nmSxtrl/DB8NDrUci/wAQK/7tF+qJvZlXSFa0fhdzKjdnyv
         Dt7y/IrgkoYekpUXgAkhroVBxaS6m2EmoVO37DSlVrIyvBHW3YqN3I1JwHAu+JK9DA3Q
         d4y5aDc0S3IlnqbmrwpBz8M4ic04gmaRhfyi2gKsPkdyA9MzwWsVEAaxWWMjqMUKMUTu
         OcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695235; x=1794300035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=eWoyQ5ZGmQd7DKvKG9poVE13RBpJyPu59ZzOS6YZ/336xYuw8fZ0lPBQjS2bcuq3v8
         XtULLF5Z1hAecwQ1GkJTbjZl3hGhM+ALGDJe3eNZcFhkrFzB6FYAJRWCLlzLwPIVxxxp
         j7HBTNfBgdZoUFLM0vdItMXOsgzd+kF7qwMtGNYqmvC3Yp/qrx6GaGQHtrf7EYjTbfMv
         C89cbxzf6sJKUb2/fidowS8/VamJ6FtYCojaN6E5UNG7yyC0Jw05DL+sRqsP7iJjGlHT
         zZ8B1RDxsYMFeq1E7PbnWF5LTuPy56UBJZ9dWhv61TIik7BLU5zLu6VlN1fS9+UUbxZx
         I4OA==
X-Forwarded-Encrypted: i=1; AKwUvBzrLn0EW6yMPv5iV2ECUUIs2B5JSoDr74Q4AO6H2U/l8qkgyPvqrlEonErNdkSYne5058pWCzZlRDv65Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/xfjjFoLRyTCMfSpHIwFnQ4thV6lUITD1/INv+BMmYLIrcxPnL
	G0w2/Rje24UWnZQ8xqSmB89hYfk8pwgffLeZOuD9sxng94yrxvl3Vf1W
X-Gm-Gg: AYBFou1Dy3oo653bFpKtti+6fXHaGCa2Qbk1/zk1fVwu4tmUF9oOHeYLUOJ6fKERYgR
	QUEjN0vZVwfB8WXN9F9eiTbgqPxvc8zz6EQ5PKehb7DgV1BtOT2JZ9Wufy5KaocbgoHCE8l94uA
	gWKA4tlYnKwFNOzgzH61241EXoVpVo1VoRb5OkTSW2FYv4iPAu6YwhZwJsNZhPQ6brWdAPGbyER
	LtBo19Mu8I0AkgWaDMVCROrb5V1zoMYeXwddBYS7EB+67BETlOUUSbd/2njwnFvFtMrKOhHycEf
	fcrFAJnibhSVxiav1U/0HdBO/LQHdBrokuMzNAuYhzjyU/X3l9Sn/aK6so47cxPI7snuEAIKMt+
	1T0Af5bx1wF5NB30p9SLB8fyRsbT0wNalkPQWXHaV7bBPyTnD9atEQkZKDNogReAAbMQmz934oE
	seyzAktMKo0oMJBwPnJHldW3m2j16F8O4W4Ba58VKm7MDMsJPFGgsdVXrmMrXUiaTgYQ+I2fjIi
	RHtvGvHj6/SdNwPLQ9SkHUAjsiGKuWAhzDizrh9Y0djCTnkKz1ApeQlqs2tMPMWN+LMNhYqGy7R
	Cy5erTfqIwmX8nscCtaVMFbY+ZSzeNgJkI6diG20nUkO60S7Yj9KEsiL7ZgAj2tYNLufA7bRDEe
	wxvR6Hv0m5lYb927ZN5i9wAORrYnKJXP2Yly8EKBMzoxjbutf9f60lvinbE7Y9d2YZW0MjT1Sp9
	As3MXUhf7WvZaiV11ug4sMIiWk2apLlcW/Pc83P/DELy3QbX9qnRQ=
X-Received: by 2002:a05:6820:a50f:10b0:6ff:3c41:8153 with SMTP id 006d021491bc7-714f299c8cfmr4772331eaf.54.1793695235466;
        Tue, 03 Nov 2026 00:40:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:26 -0700
Subject: [PATCH v11 1/5] dt-bindings: pwm: allwinner: add h616 pwm
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
Message-Id: <20261103-h616-pwm-v8-v11-1-07abb59575c3@gmail.com>
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

