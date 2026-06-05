Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA58C46AEFB
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jun 2026 07:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643404; cv=none; b=tknv4s1b7iDCic7X0HT0QeFK6BnS+tpxi949JzGkvQXZvgs+B6NKxNhc9EtzSJ6qwjs0Hgt+9gbScYGWwJCan6K7dN1KolxxsSw1p7reOyVrVeB8O+ofBbLlMs6fmRJ3R0ch/TTjvMQsbNTuer2eLLn1VT0F9z7A6nTynFpHFZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643404; c=relaxed/simple;
	bh=7MDbaMfdfDFcEL1euNDkSuzapxJuUtssv4QW4CSalUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNTO7esh4foMKDu8w1qG3QRri0Hra3DkCaF9HFpOj1YeTJeJsLz1IsW4XDNY+c8pdrE+Wfw91kcL21iF4XoqKEMTILpKqCWp04YUPQpNPEeuvwsyksyOpoWBDQor7aWjK+34Nmsr/B7rUifOI5NF+z5kUoa/N37uRhkixJun7vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rfxo5vgl; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rfxo5vgl"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4600ddc4017so1191114f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 05 Jun 2026 00:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643401; x=1781248201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL4Y31r8dtXqoPXz/W9R/fk3pvn98vrw1YoAz+z4buw=;
        b=Rfxo5vglsEOlhkjEfxRq6btMAckqEoM/jxHhB4n4lXi+tSVJKTECPAygdkA9psEmhQ
         eN2CYYJnffklCVLLiHIj9qBIn8Sh2g/S/pvfr5I2GXmn7vAL43bollDej+J9k0JyOtU3
         bgc9K61g5GmgPxjHNaDUTI0+79iHeoKOvO9FW+iGMGBsE9XoW1F8zEf8V1Sx/BFCONeU
         M/GYJJ44/zkRnCL5sdradvhFiN/9+d4GX6C9dD9331nDx6dV8jxch+NtlvyUnVtkFXcf
         vur6Qsj1W28aosk+XEXkvyDEDVYi7Tddg79rzmDZpsJ2ARboCBc4K7V8yqZrE7G2KKCw
         iFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643401; x=1781248201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oL4Y31r8dtXqoPXz/W9R/fk3pvn98vrw1YoAz+z4buw=;
        b=XVH/n5SxpSjN27k25bhvfddNDc8T4gp+U2/P8bZTQGwHkoCN8FzL/jYiaSC4FtHQrh
         nAfZsMNHwalpP0NGnmXMBs0wyitecT2PpXzu1QQTZNcOMn1vmR3NszsvHbPriQoyvruB
         bgFNzj+kqqy2dOP/SLx7E4/S2ppfTuFtOq3V3ap5WlzFSRsKXH/sai5EHaD/soTvI7IK
         gKSa9AmnC4rgVn/ouyAEE/ymA+3iQfyipu1SEZ+F1H6cqlwc/25x7w4JmD5/r5ydP1AN
         hMS1gkt8+jqvxHkmOL+nL59JAkbov8fFPQ+DT0jyOZ9MKIQmxMZMH2i+R+RhA2lx10BC
         uMNA==
X-Forwarded-Encrypted: i=1; AFNElJ+lXFGEwZ1LHmCeCnmDn8xcQ374+NhULMrHUw3k/IgvGJ68+K4eeezEVIn4j7uLGPJlWowDbHZjntNIcw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp7IxmSV5Dqk0zyGDYlrzrFyhr68R+c931BlAAEC07sDvW4ko0
	oLP20GDfmkzlUQW6Hg0ewpoet3A+iHNK2FWp++rtmQRN8pFDlvAfeb2x
X-Gm-Gg: Acq92OHCjH3g4Tv/N+w8ePo7mT3EitkdJlrLAwVffaCg8Pe9/l5nUjxFeagFi/QDKfy
	UHd4ZNI62yAXxuboPJ81xEGUOPrq5Sfqh+gppJdxqvgHhcwXa2GAH+zaLNT/lNCD2kt1u+XRdtC
	flaqugG7NvcNDBkRor/u3eJ7vajDvi29+ohMTMN9TQUE0VGI97nKR9w81WOlC1XQtUidEzVdcVB
	AX+X9IiPqBZB18x0SggI9JciGhlABONx1dE4D68u+V2RhbU81LUDrd+V+z8PuZUdykGeAdcqMmj
	gJT2Xc9dZak7uyZkbKx/lsXLQVLr7eupHPg5lVynzxEMfwerqY19mCXcXT4uw0kfqRB7raT0ux6
	dnd3JLtLr1LaypYOMqik/VxY6vtv+DMUxzFI0FB01ssisufvg2aGkFZFvk2lFMf2pvbZQ0o+TuY
	EtSrTwj9ZNuU2DSJrdmxVwjnPOKeWM4QKtqDQ1QQO9nLM89YLij4TFcV29xANhoErZCPduvLrHf
	RwCcZfijw29u6HWBGbAG6X5W95WvkAk
X-Received: by 2002:a05:6000:178e:b0:460:3234:293d with SMTP id ffacd0b85a97d-46032342a62mr2372600f8f.40.1780643400949;
        Fri, 05 Jun 2026 00:10:00 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:10:00 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/7] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Fri,  5 Jun 2026 09:09:17 +0200
Message-ID: <20260605070923.3045073-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baijie HelperBoard A133 is a development board around their A133 Core
board. Introduce a compatible for both the Core and the development
boards.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- renamed "Baijie Helper A133" -> "Baijie A133 HelperBoard"
- renamed "baijie,helper-a133" -> "baijie,helperboard-a133"
v3:
- no separate section for "core" .dtsi
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..82dd58b95f8a 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,12 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie A133 HelperBoard
+        items:
+          - const: baijie,helperboard-a133
+          - const: baijie,helperboard-a133-core
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.54.0

