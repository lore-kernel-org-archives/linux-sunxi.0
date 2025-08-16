Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D5D23BCEE
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755334112; cv=none; b=PXS9hVmGZnP9siyjF+2r+1tZV/50R7sH56H2G8Hv8lEMMFECaq7j/UCXtKWJZr77NsAELTW1z3ym8X4viitHipWMt3Z74OmZMuBRTU+SNnSSqqAXZPE3YoedsgQLFqS3dWGyyI54BI7ZHuKA6OtxW5ONQU8OQLYBWE7j0VwN02E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755334112; c=relaxed/simple;
	bh=pzJn+y3ubulKFb+XrVV1kazkT/PrWOp3C67NiveIlbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbzXHyONCc/JMzxhtYJnmoVQAPj+EHrk8tGO0XgK5WzcS3yOfq73Om+mOFXp1QmqyWw4IuEezPYlWQ1zAmjk04AWuL/llNJ/X5fgCJ1fGvMCzrGCisiBks1zNG3bSi6ntwTOvlb0wwRjAGA4XjBbfvolnzWlZyGRLsDS/Um95XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxKqsD6U; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxKqsD6U"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e1fc69f86so2679993b3a.0
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 01:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334110; x=1755938910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDWOGAR/V8qhS+DEW6fYz84GWwsYflwCKKabdx3FCTA=;
        b=ZxKqsD6UTUnoXv206rZGG1kNDjt9+Q+Aoo/3xabhgwCe6x5FL/3k1jZzgwWrc11rI6
         j1EHM7RfjEgCNcDC+drdbn0d/S2pg8aa4MVBUwuElf1eSuHudqnVoZ1BTwBIS/+sLQ+O
         YXEE0Xy6rRMXsSVNFe66GTpftXhoWu7Iq/y+zWDJRnX6jJ9cCT+l2Bgbr9JioxwITAYM
         OcCurOVDzSXp8PU3FLsQiVGLRg7Q/ttx8YGBfEgCJkct0LSNKHPbeif4rMV+z4wiGHU3
         o4/1B6om/xsp2F6CSLZGSe+R365oHmD08wDubdIRXrrTZz7+jKQp5sUl0nYumcyJFWch
         8fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334110; x=1755938910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDWOGAR/V8qhS+DEW6fYz84GWwsYflwCKKabdx3FCTA=;
        b=vslhas+uqkKiDMroLq9SzGJRCjcnwaq4n1BXWeW8A8dJs646m8TFe24af7J0QLP4S7
         RfmLEpHrMLM/0ovSfkRcqJ73QSdrlMkCdd6Llgpg4Axohqx3itA26qzI4GALwM/IfqCq
         wuaWRCe7jf96yMhMa4DkKvofaGjVkY71wg/SoC4XXde2miRQRs3pJDzoSpWcNGIp5AkR
         IwfyJT8EZ3jjcYUI8xO3HnPCl11ggu499HBWtzw9/RxK74gVsCeZf/+P3TccCvZt0WWF
         zlVfGTN4DNNFZxv21UgTMMfycBWyx/OTZRmsGraSyoziA9L8VenmpWRf9aQle9HXswBV
         aD8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQdmsw9JD/2gyC2zurp+C3c9NLY9Ro3QnkYuqscU+uuMMw9w2fLyqHGLDCrYUx7tL502vOiswF4EWVbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnLjIrtyhUYxUIoTanQKC5TUKpzSLsRxU0cvSI793SK2fSeIXD
	DC963h1YeaBdeP1yOeWoeWpeh13LdxzAKF3GBH03X61rF3YPK9qKWXB/
X-Gm-Gg: ASbGnctUiRsfCzsWsaXgBw/Vj45r8iWhZov6kFXaRUcUJ1g1mgxnawS2PlhHYHE24hK
	1w7nNYJc0nhHieOHJkQGYXzFqpnsE0IiscT0kPMYpymog/RkSpySVwBe70xo9iYQmS+LjVsdX3b
	CWs89PspqOovZxJMpqsJ335lOeQuaziE4+iujomxiE3MaFHFGtMUWeSxNXxanCLYOPq0ntFQqXo
	cKTuZXYcU/JzTVkN6QS3HdVRTLeU+vLxjaUsi33aC7jFDX4pa/FSlVdqli0VyXErp5p7kN8bX1O
	zgdUAZUzKfMMmR92mbVLFDKd0UHlWYAVpIqynyyixtiX0NLyChmZxi8zpvLcNVmK5P5hX13Qz3m
	+Ue1q8FdaqTo=
X-Google-Smtp-Source: AGHT+IGsQHajlRxkkJKhsBN5q8Xue9SzeHzYvWpvVEasktK/+7UqcjxhnXytQgxkbXL5divXvBb2fw==
X-Received: by 2002:a17:902:d50b:b0:242:b138:8110 with SMTP id d9443c01a7336-244598679d7mr146468085ad.24.1755334110487;
        Sat, 16 Aug 2025 01:48:30 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:48:30 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 7/7] arm64: dts: allwinner: a523: activate USB3 for all boards
Date: Sat, 16 Aug 2025 16:47:00 +0800
Message-ID: <20250816084700.569524-8-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816084700.569524-1-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Currently, these devices have a USB 3.0 port. Therefore, we can activate
it.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 8 ++++++++
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts  | 8 ++++++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 553ad774e..6842f8e8d 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -47,6 +47,14 @@ reg_usb_vbus: vbus {
 	};
 };
 
+&combophy {
+	status = "okay";
+};
+
+&dwc3 {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbd..19388bc11 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -46,6 +46,14 @@ reg_vcc3v3: vcc3v3 {
 	};
 };
 
+&combophy {
+	status = "okay";
+};
+
+&dwc3 {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index b9eeb6753..6f05cd297 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -57,6 +57,14 @@ reg_usb_vbus: vbus {
 	};
 };
 
+&combophy {
+	status = "okay";
+};
+
+&dwc3 {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
-- 
2.50.1

