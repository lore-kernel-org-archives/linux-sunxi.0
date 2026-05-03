Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E1A3A6B62
	for <linux-sunxi@lists.linux.dev>; Sun,  3 May 2026 19:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777835937; cv=none; b=k2nVgdH8wfXvv5GNIMJZ9VvZ6b0OzCBBjh3rAsnVPtNQLswTKwI91GPinCIOG9vqRLFlM3ZI2pGEHt9MRkBhgPL3EwB8/nlFmd04OjvhiBdcKr2t+V0HPg03Uc9FCFPs+LC19J+3a8e6qL1JK6WCBI3d5eypbLVFXW6McxQpV/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777835937; c=relaxed/simple;
	bh=RMk1uYRIF1auQutDTrWqs+polxCyDFdCZCiQBLGEn1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWAtu6d/JMTo/Tlp96GE/JFyTO4phT/NVS2v5e6UM5SNjJKx4IOqP9F6bIeK/X7MAZ2xMtAiZCn1gv99exkx6KPCXYsGChLfXg/aAqor1CK1ReKCGBqmbx1/yKAAid+HPgiyMjG3wG5EftAi88DIYn1aIQn4mD3G4qorlbnNlFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3zH3rdj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3zH3rdj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483487335c2so35326825e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 03 May 2026 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777835933; x=1778440733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UHe+LlrtosdhK09gGgG/VkpYFGnEvDBwqP4aIDrGEg=;
        b=h3zH3rdjRmRrE2wzEg2VIMMqsxtVpXQVWOGftemASC/jNBXMdQXGABxilyFO/6xRjF
         guAdgnZt9+yIKtTPRK6DsrtXDkLVAgw5E5IMa44E5z5Rmevb6pL6pmsWLI+xG0Brnv8L
         /+iVT6ltebE0LYHN0agTXO4l8egIs5zEqw1BVdTYdkhkd9aGpkoLR8CAOuVBwyw3AHDs
         5wCA+DC4UEwFsoClR2TJQASm/zUW9ZvQVa/JXB2couqtDYoFiOcm2YgUg4abPHlqtd3G
         7lsoEML0/LgD2QX1MUY0672NqjqUJN3vKO9KabcSGT5YBACMuBPtD2i3QDUd2MtB+blb
         NkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777835933; x=1778440733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/UHe+LlrtosdhK09gGgG/VkpYFGnEvDBwqP4aIDrGEg=;
        b=UeJO55bNol0SsCR4kPwiiKr1nxr0O60lH2AlJ6nzVsupgemH+v1pxD5qaWr0wlgnS8
         QUN720rhH8cXPRfTKtMVrlVydkbUJ9NO7/p+1XS5EI7wO/9OHQ0audKvIjemu+5Gfrqx
         wQLogY2tu0bYonmtNhFVWCIWEmVpLnVrQq8/QR1wfLdZq6p0NHuKStfHmsQvPe/DaWoJ
         /fz+nwFEjkKAWhzfQXdaTkSEnJwv58gu1IQKzpzDOh1sWCmWkv46pdKqoMk+OnVgFKaG
         0yhD9IvHtc4zGfXDbqc2oX2wgRYY8FeYav+LoF9uH470Om84Lo8mov03DttUvTeu9NPU
         n7vQ==
X-Gm-Message-State: AOJu0Yx32rlGX7DsEKFHYFIL56DybTrWM/DukR7dCmDj8hmJUwu0xrFz
	/PtENo3h22UOoerWKUexhWbf5TmHlN9MFlLUR2wpXb/5M0ZIK7S4DfJRwg9NOg==
X-Gm-Gg: AeBDieukU8BhYmmRw6aiuSwbHA3NVqQ72Qhh47AD/vjEJR6RTxwXI9Gek1BGEc69cqm
	mqWPi/P2UcKYXA9dCbrz9foamPGjkirmWTW0Xa3B2JWrwuE0MF/Y+Mik5dGMpPH747CIgfH60x9
	b2nTcCRHDdbShq3sCCP9y70TidYuz0nSNPewXovPF2CPKUdJQin4eXHhnsq/sk/H4M60cjY/0ay
	cT9UviZFVOGQ2q4FS1p0hSAvZweZoWFVO1wHmUWYDBkZaUGEVd9hyO0v29AZSXonmzowTKpucOE
	oF90WaUEirZgMcr7gqJaLm8eQW01YlZygpwrLR1X+Sj0wnpPgEnL93eo1Q14EPPcbw5DDMKQsoo
	LUpwm+MnCDjQ8ygERmdJEap3hsMC4j3APeuG0abGS4h2krn0mgs6Vhns96IcwNZWYyyKRaEUwD5
	KmWNqRI3Wd7X3yrMR0c5nMifIDe17+JC5lSCRGDoCAPHAax2I8652uqGJgDZGyUwoz3rL0iqt5s
	A==
X-Received: by 2002:a05:600c:a590:b0:48d:5e7:a5b4 with SMTP id 5b1f17b1804b1-48d05e7afb7mr22018905e9.23.1777835932707;
        Sun, 03 May 2026 12:18:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe928f6sm62230925e9.6.2026.05.03.12.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:18:52 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Sun,  3 May 2026 21:18:37 +0200
Message-ID: <20260503191842.2736130-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baijie HelperBoard A133 is a development board around their A133 Core
board.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..52b42779a283 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,11 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie Helper A133
+        items:
+          - const: baijie,helper-a133
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.53.0

