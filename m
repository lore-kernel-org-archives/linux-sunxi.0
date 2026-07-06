Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853AD426ED8
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 09:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330355; cv=none; b=DTE9TD+o0+/uE5xMwIuyBgO4Hkv7a2LzpOvBH55dTnFKYs6+ghp+l1L+IQuBPH6m5HbFDk0NJfvHiSricayAwOvpDVglZib4rnIgaVcGK9s1Uy15H+iNmLcZMew5Bou91OI/nS4p9HF0YgpXiEY4UCjQWb2HL+7TDADzBly6LBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330355; c=relaxed/simple;
	bh=WTrYWpPBbp5/IQCt79i6cOc1+cJ+5cUXj7Xxnm4AgUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxwP/87toYgZMi59MxrWflF+EjGwdmzuZ5M5NFB/yi440KFeMdLdap9pXygA2BvLzEHsnvC2jwd6FiXzG7SCZBhYyFzHzw78OyKyO8rTpdVkAcdqpL8L8FXQf+UF5dQRcgmODaGgN3+7zpTdBXKGUewJ6ye+T3yTgecknuHkbMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kZMOpKW9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kZMOpKW9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so28268075e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 02:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330349; x=1783935149; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHNoM5YOqmuEFsBCD4vOioHygdVjHI2mw0dlIWWfPx0=;
        b=kZMOpKW97qDD9gUYHXsZVu4ChQNKf4egBXafGMOPjhdKA8aoLzTvVNmE+PbadkwTio
         8KW2gYVCoR6mno3pYbcQFBzmRybWDHm6Ps+7s1bKCG/yNm73dT9p9J++OUSo1WW+oYFi
         aRBuZPE7aTg1ZCtfQKCPsO7C4gm+ssdjIwmlCT4HXfkoe5x8E35eFYksQhZX3JuAixwe
         VU3ObtWawxmZXPnr9pYw1nsgqO5w+Ds2b79iZDlFk0Bk2sVLNDKQxoomflJiUPUvzx32
         KefoItduW3ZGQyK70JaJ3kT30D98eCvF27k4p5sdy3wPsI+cYbjRFaAqKMLz/yA/iY6+
         Cr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330349; x=1783935149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rHNoM5YOqmuEFsBCD4vOioHygdVjHI2mw0dlIWWfPx0=;
        b=PunVF+ScTMdTBA5RpRILaBJnyUrvRS4SqFhVNXRLhA+RVHFnQtLnVivB6iokBNpWFw
         oeQlKr0RHzc70rcklWHuhI1deOj2+DFnHVaq+55c2ErTkx/fv7ZToRDaHCw0gaCxPD65
         +2pkU5Hak2S/xqznX0CHAsEwqZhjHATNSL3jkGK7B88QIbh2HPKxSUXtNj0HXV/L/MmM
         8WqDjwDTeqlDXMgv7oEfClH9FbGCUxrzBXMYVi05+qCZuoPhxjBI05tF1IEUTclJLQZe
         nKbuEquHrJusOaeaGGBIJRHntEIHdNGdg8Laln/MMot/DzQ0b+7CklT1Dohuc9WwI1ed
         KBxw==
X-Forwarded-Encrypted: i=1; AHgh+RpssrSvO9HKKZbJNxOX/I2sgiANiBY9y6o7AyJPqxv266woVaGCFzmFtxZ2rFOKib73E/ZwPF4QBkPNtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPUhp5mYqlgsUVBzKiQ/dSv3Fuqv943Iq4vUtWAF/d9zpCOkkU
	RxnA2y4ykVF8iPHGOOISRLK3j4ogo0V2hEPRS4jtGv9pR1cdspKA4DpxHZ2AaYGuSWU=
X-Gm-Gg: AfdE7clocUs0omWnlkB4iR76mmWu5t3VNndRchoNyZiX9a0scLsFUaEiRt7JE42J4Jz
	vy7N5WpQqd66RTuu2Jkjbeq3Yv7QabmNdnkt89rqRV9171giKDlne93ewyOCsyRN7TwBVxH7sYo
	X0lUgxwc49d6WnKZGlsHi0binY8iV2FYw5orhK+MNNGYqHCfW1RHpjDUq0jt+B/h/Ow5tPugA9X
	+Tsb6xKnHT4bh92ff1PF2RcehTT/MmHx3b0HIZg7ytN3dYl/tYhWVZMaY+MEIqzS3vBT31VwyNn
	7RuAxpGvGZd5H0uQJx19K4rEIWOT3xdQ9bOIdUIQ/Rtm/qK0CXMmhSk/QKgqFEXOBSuVjGlCHOy
	xzUfSDDXdSp4r4MMSS/i6m2WmkEXSgNVvj8+SrkVK6WL3O9e+YQWdAcjGH70aEqpndj27RvZeZj
	BFmlFFyRpsRBA=
X-Received: by 2002:a05:600c:524a:b0:493:bcba:3d5f with SMTP id 5b1f17b1804b1-493d11d7fecmr118661335e9.13.1783330348753;
        Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f213e8sm20505835f8f.34.2026.07.06.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:09 +0200
Subject: [PATCH v4 1/9] dt-bindings: rtc: sun6i: no clock-output-names on
 h616/r329
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-1-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1343; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=WTrYWpPBbp5/IQCt79i6cOc1+cJ+5cUXj7Xxnm4AgUM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YgZ1kmVhbAFJg++nhyvscPyVSYf6qHpsfzf
 Q5jILv6M+OJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IAAKCRDm/A8cN/La
 hS2yD/9JC6LOTzoSad/DXBsiHV19K0GF3iopYtiTD2yka1JwfFAt56fW4Ql6js+tCDHjIR/8dNl
 ZCcQ37QX7+/ncxfGw35t5noFVL4eEv+HD0mAHkuiruSHXdtTQcc3TtTCtFdxRdg0WfjEIPUjCVl
 ecRZ3eMUxmbWUPEsSh6keNgpfZbmb+fow923az1r05IuTJZPvHCrp+h7kMHfAUfQv3jBW+Jitn2
 z1mXPL3Gp3GYRKAlruc7+fiwvN2dTZyzAH3v1Yzz+fLxz37C+XyK0djx/bbXdr1fLifB5rkCDSB
 14rD40d8cmUaKNROMLYfXMRTclaPfpxDyXldQLSn+0monEBssPO/tacKg32NUKJZ60Pc6oEKfYc
 tYxLDc0BE6z5jWxIC77CfkVuWwZULNDFT2BJPAKuj71gyThxusvr9rMIHlRu80ZFQY1xnZnOv52
 PBXVB9zZvmQkdbA7vZPwVVF7Rokh16UAHovkwZe+qOU99rQlDp+VaJSqXqYYqvxZTl4YE9Yf3N2
 AHiykcCHHT5HwgOsR/UlVThdLgH3dAvBJVF+7dnb+/e6T46AhEnI8WmeR66G8k+XgfXFh2ot6Lz
 wxebV68uC56VToYtAcrpAYtv9FpCPDy3HxCM8xErN232vbr9iAZPYICXQbCYACoOJTgIwdI/WY5
 /pSukiBC+wiN44Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On h616 and r329 chips, clock output names are never defined through DT and
are not meant to be. Just disallow the property for those chips.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: http://lore.kernel.org/r/20260629125305.0DF981F000E9@smtp.kernel.org
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 9df5cdb6f63f..959a012c626f 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -175,6 +175,18 @@ allOf:
         interrupts:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-rtc
+              - allwinner,sun50i-r329-rtc
+
+    then:
+      properties:
+        clock-output-names: false
+
 required:
   - "#clock-cells"
   - compatible

-- 
2.47.3

