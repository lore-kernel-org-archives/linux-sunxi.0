Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F66017C9FE
	for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 14:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717164757; cv=none; b=bWyymxthvh3FakpY5ewUgE6soxfGuqRXx8pBR3taxdz91cRtuZvPQ4snxPeABuY6zH2XDRnOYsoqkpIxi7febTLkg+UMe0YYKPdREAHTmxqvzD0kOasEQifhY21wJjLBjUxp5aLCLjRxKReTiaUDyuLHStiOMf3K0m0mNIC3M6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717164757; c=relaxed/simple;
	bh=DmF9pN0adUq7Y61FuW2i/zWhZEm2BHUOkdLHuctMo3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ntkwi4h2UqIrrCgsc7O0wxrhu17qBack1e/8L3dXRqFS82Wpu0nAU5N7tIXwk7l9LwiAZA3RVMONw3UXKQz8/AZCLYEnFwhnfUmJDTktx4FM8sCxeQXd98sTgdmO/YL6LTgoxXxn/ajxae2EqzjaX0dpGfAP0vsFuc81VW7PeiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQt2fXnI; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQt2fXnI"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-701b0b0be38so1945493b3a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 07:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717164755; x=1717769555; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOcPgbtosl6aPaHyurBEDKVmEjsqOQ4R8FjC6nla/j0=;
        b=eQt2fXnIJxpI4SbWCclvTtbCCb15aoD81eik4gkDjipkA9rRMvuihDNM8Z+rVp7eXk
         S83PwyqAxFMmQ7ctaz5MQlP0tGN/jMD/g+AY97ka+69hYlJPmTQ4JKKLyjrUbfq8YQLG
         vl58x7edt1RRPQB/ovyBTHmNX8Rr/HFunvKTjDid47nSlXIGTCax+S/67T4zbpkQD41r
         +mt/yOxq1AKdFevs7oKmGC9wCI9/XK0oUpROkuDYvClRUc5lAuebGZodZQAX72hde9HP
         44rFP5mljNIv1LHLobRSmo2VdhuMK+NKiTt3LZ1kpu6aqOXXXj3FlkMRBYIJFai6k/zf
         Bhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717164755; x=1717769555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOcPgbtosl6aPaHyurBEDKVmEjsqOQ4R8FjC6nla/j0=;
        b=Us9D/w2ivj8YV2tUNYqY7xzDayjGVsH7Z70/mxf9sKFhiG3gsvwnKbxmPyi7HNVcLT
         4ZJY3EbGwmXLacnr9wWUiUYgpBflhH+daUQBAxDmHnI7JfKoWQ6ZOuAnkOgXMmXEoVFS
         Uh6rSVc6Qm62ETEfvUsFKP+S9CQCoosiaRDI9aYZD3iP7vi1ehsP5V0wckko4K7dzWmh
         wammUtqPjwBi5KVwcm2YuPGPMo6nbieeObqaInmw0HzfBnPsBd7nh3RsPrm5ZVaN0h6o
         M5plk+2pwHUam3tkAXLJyKxmBsHv45i8/h0s98uX4jCeEL/GTEEr1BGry6Dno6JdwlwJ
         +lcg==
X-Forwarded-Encrypted: i=1; AJvYcCWcCmtH+Eju4JMBPqPu7Si7wpEWsqP6/PoX6tOoTawhMBHxQ3VL8QtlYJrjwUOj7zopcMb5Ny65pQINPzzFqvCHP+rtmMl6mWdE1Tw=
X-Gm-Message-State: AOJu0YyIx1xeg8ttDFkzPRGdKteKZ6g8Y8LBo44BCTYJSGN+wJlujcsY
	/z1wsJZ4GRtXG8spXm9haugslmk6Ap71sSWXH1XURKBhE/AQiyVh
X-Google-Smtp-Source: AGHT+IED1pv9oGjdH+Ngk5fD7H3whpkkw+4F3I2DkC4Ur7bEQ6LnfE0ADN36jmtn6xY3QZI+rCQlyw==
X-Received: by 2002:a05:6a21:33a3:b0:1b2:6b27:5cac with SMTP id adf61e73a8af0-1b26f1f73b5mr2415856637.32.1717164755418;
        Fri, 31 May 2024 07:12:35 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b057besm1418103b3a.162.2024.05.31.07.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 07:12:35 -0700 (PDT)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Aleksandr Shubin <privatesub2@gmail.com>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 5/5] dt-bindings: pwm: sun20i: Add options to select a clock source and DIV_M
Date: Fri, 31 May 2024 23:11:37 +0900
Message-ID: <20240531141152.327592-6-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531141152.327592-1-kikuchan98@gmail.com>
References: <20240531141152.327592-1-kikuchan98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds new options to select a clock source and DIV_M register
value for each coupled PWM channels.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
index b9b6d7e7c87..436a1d344ab 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -45,6 +45,25 @@ properties:
     description: The number of PWM channels configured for this instance
     enum: [6, 9]
 
+  allwinner,pwm-pair-clock-sources:
+    description: The clock source names for each PWM pair
+    items:
+      enum: [hosc, apb]
+    minItems: 1
+    maxItems: 8
+
+  allwinner,pwm-pair-clock-prescales:
+    description: The prescale (DIV_M register) values for each PWM pair
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        minimum: 0
+        maximum: 8
+      minItems: 1
+      maxItems: 1
+    minItems: 1
+    maxItems: 8
+
 allOf:
   - $ref: pwm.yaml#
 
-- 
2.45.1

