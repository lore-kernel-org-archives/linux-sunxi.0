Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3431A072C
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 03:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752206351; cv=none; b=ILl6V0DUD7SRoQ/RziQsYXoRscqs+nvczUmplAGMumsSSVlWdMH8RgjOfWGBNE8vNZ9OjADr3Y5cqP9E5AlqYGuPmqhhLouPeoKdeOv0yHoXrffjxzJ16DyHWsg/PdU5LXKcVhNZcsqtXz7V6GIdikMyNqzkcTiwMUiDt/M2cJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752206351; c=relaxed/simple;
	bh=IVBiCayxxjuIoAWf7fWUyLznf6nyKVFK0/CzMq6+NGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJpK5M9IsrDOay0c/OlLlSuapCOBU5ejKx/6TBQZpr7m2Y3sQWRzAt3/AvVj/ruAG3HesrfO5dDI4v8c+o7Ae2EXo06+RFCFSVkYl8TcRmRLvQQmhrgRbXE8FIFOrgmZyJrpL0DD0MUBA8I2Lt9le8EJnZZqp3YIObR2MLfs0Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghtp4V7G; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghtp4V7G"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b3316160so1705996e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 20:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752206348; x=1752811148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=;
        b=ghtp4V7G5TQXKrgWyZwSa9LqG41Z74QStQv4iHEOBXfnds0M2nyvGMun104scGAzii
         bR6ogEa6DC0KOYD/8ItXffJE0jd4g5d1IzlHkMvPWC25ZbyN43r+zc/d5NSD9ErCvlUZ
         zV1C0tmo4OYrysuuRnhbeScXmsbGk61VYf35dhyAWR/d3gmKxf004ngGqtRT31YL6Btx
         GdnsCxp0jzD/tzF27smPK6WsQy1kgA5OTvUY75Jmh+PQyjsCrd5WALxSOilneMFXxASv
         9A6cpLviRskWAvki97Y7KVn3Mz8G7n/twaSpDP1yh27hjlGmgK+tg9r1dEgst1h/kCvY
         /KNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752206348; x=1752811148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=;
        b=AaldoaIfrd9Q4jwB15epROwCaiJLhTv0d6PLRJiX3pg1zqlFvYsz9BmX2xj4nKkvhq
         vxHX1TagKCPrU+mzxc5iYBByoaSpgbBkkHLMj2hZ9dTSMFAQq8AgqFdPsk0dj9OqgXNH
         jQ9AJGb1ESXGivUP27YD9FCYIfpdMHH4ZyGul2yODApl5abOJLSlXjG7gO2e63eZoaW6
         xQ6Gcq8nmYgEIfgK4QLRe7RZRbbUya3lPTUB+p6Q/UePz9DmCW5baUwL7KWN4+xeFcYH
         fSJ9OEs/c8dsMlWiRK6NIt2jgJbKp2pZFfG0nMtKUCoMz7Xkzkl9DqO9TjOcMyQI5ftq
         xMNg==
X-Forwarded-Encrypted: i=1; AJvYcCVFzdEO+Ojjyd/cRWsXTKhK7d0NNeVaMOOJ2lLeoq5tQPpx1sCmKOPK8xRWIE2Hv3uQ/JqTjE1fByFxbA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy86IwQw2UzfWvFcEp8eK5DafpH2k8wobH4/O01dCz8z0pimfCK
	1zo1nhkvVeeLvYriJFB+zGU4lHmbn+pMQ57I3iLeI63vKo+8vmMKNuVE
X-Gm-Gg: ASbGnctbKlwdHiv5MNq//G0LcHS4xq93B0wb9P9ojD9w749NZucTxVF3PEOJnJHGR0I
	Xln+an/RyG7CFm30LsO9II9I5xJiekq//7WsIuxHkc+sYUjG72uaoNLHPynPnD0fQlA9zD/iEgr
	PcwqEQ8ZqQ4bz1ju7ta6ktXcjB1d5uFYYPPbumiMOH6mYzPs0BkrhK6YB8AY1qK0HM9bpvXzifx
	AMts6xXIfECDZXBWeH96ZlJCOxrVAKnSvUjw2sUTVj8Xp0tf4yf21PCfAucC1HTeSpeuDpQjzt6
	9v2RAiahqzdeBxZhJFW1k9CGp5rlV+yKAXoyuP9kGNT6wMOZjoM/6kB9GtMpbg5obD9LIo7bcVg
	6k7jwR0AObKI=
X-Google-Smtp-Source: AGHT+IF2Vs2taWbckoiIUXDCtLJBtsJW8Ugy8fMUOW8WzA36Et0dLFCN8dorIxDAVjB7GGJ88bp0Fg==
X-Received: by 2002:a05:651c:555:b0:32b:7ddd:279e with SMTP id 38308e7fff4ca-330532dfb0emr4152281fa.14.1752206347958;
        Thu, 10 Jul 2025 20:59:07 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa2943d46sm4971191fa.40.2025.07.10.20.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:59:07 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.or>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: enable Mali GPU for all boards
Date: Fri, 11 Jul 2025 11:57:29 +0800
Message-ID: <20250711035730.17507-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711035730.17507-1-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

All devices based on the A523/A527/H728/T527 processors contain a G57 MC1 GPU.

Enable the DT nodes for this GPU and specify a regulator that supplies power
to the SoC's VDD_GPU pins. The other parameters are set in the SoC dtsi,
so are board independent.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts    | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 8bc0f2c72..553ad774e 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -66,6 +66,11 @@ &gmac0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index 59db10354..a96927fbd 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -54,6 +54,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 142177c1f..b9eeb6753 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -76,6 +76,11 @@ &gmac0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 5f97505ec..d07bb9193 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -95,6 +95,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
-- 
2.50.0

