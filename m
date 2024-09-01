Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A0516F8E5
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Sep 2024 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725193302; cv=none; b=Xe412UdfYUwxfXKVqACKZa9MuLUzypsWmXjSCvfwWZy22PNnCs3wrB9YQvP9T3nr0TskQ9PNsMzkn0gzUFHB5cSIxROB2Dbw0YXN/JLOIac2z80eNRdWmA0Rtwq/LnQtTj+ICCEYc0NlOb9F9dFLd9WU6TPD5qs6GWIqDjRu+i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725193302; c=relaxed/simple;
	bh=Nuu3bcQJLrHnaAJv0JgVHZz2b3WIU+6eKa/YNuuQ58k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d04B7lFT9tLMM9ef7Q3e8M2T/IrOvuCKAKcVICVUhp9THmSP9pMpXA4HFza8+S/5f4eAbP0QACudZhz1cGlnhKq7QiCT75gkSGqmklN3wiXKiqU+z7WiQ7v6fa/MwMEqwoL+J+oMmiToClkE4yqmZQT2eCvr1F6f+dLSYGOD84Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwpsX/k8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwpsX/k8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42bbc70caa4so17524255e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Sep 2024 05:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725193299; x=1725798099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhI56pgcnxtBEEx+nynof3inTrYjDZ/FBIpYm72ZYDw=;
        b=OwpsX/k8iV9FQpvSS2dBjuwK1xr3mfhdyHccw8AIxH9jQfRd3LjdoGt2Qb6YJ/N1Jh
         R8o9H1UzRVzc/YlGzNBWH5recBJ6SwAzvIbRiJQdI03QQPu2tY3aYrS5QEhzY8s1rAHC
         G2mDRsNMUME/Z+AFSZj31vCqtBOdyDsKRl5B9g44tW3xd+F4fLivKCxY+mZh52nWAmvi
         bnPVZxUrCYdenswFH8QSUG+IU7Ge/mzUbgh+0qU9Q3+EmkBVviUjURhv8B4yuNyVRKYb
         0PHiX0b//SxgF/SmaOdOVo4XS90c49s77z5FXjj02lsq9VjikdQZVbYxiVhS3OfoyEH7
         OC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725193299; x=1725798099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhI56pgcnxtBEEx+nynof3inTrYjDZ/FBIpYm72ZYDw=;
        b=doP1xO4aMtdQo1mo5rlWp+Q+nlkb4u9jmfHe7idba6uNFKVJlIy/depTzxjYakkPhj
         Kj8Zw7sFmBtyGQsmid0hAeL6qFNry7BEIk9Vh7whjIfbt3suSS9T7tfhdzM8Y+bvS0zq
         NnQRp1DwvGu9L2w1sx4RqfEeFOFqGLSpRdy3aNrICTer/K9EBW0ZruWrxS5JEg2AM/5n
         T0VSvn+IYMmPdRNizVzXgy3aWXcB3EijhltCrtbbXP/1ny/jfKmMdvuoMYriH2xolJu+
         cA0xpfWFKLKn7ayXIvzf9pVgFc2t5rOMXTock1MBNPWbnSkmPkL1zKLUqXqSUGar5BTP
         a+YA==
X-Forwarded-Encrypted: i=1; AJvYcCUvYPCW/jUYZ3binlN1GtqR/qrbG9O442BLzMihKtM//r5KSZeXHOMvcLdqnMgr+F/qKkFwjkQa8m08TQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwScyEy0mpFHs8hqppBHpHg0NNy0eVVbQKkI3X6uPrbywtnO5mY
	kfVWmRN8ooZnd7SAhuOWq1+EHRBEO+f0xPwwnAADoXaEUW5ZKqVF
X-Google-Smtp-Source: AGHT+IG9qppS9UCh5CXrPVKTFU/i2TeP8Pocpu057YLijcm21jrSyQQkkzKiA/23MWwK3Yk1gwRtYA==
X-Received: by 2002:a05:600c:3b25:b0:426:6320:7ddf with SMTP id 5b1f17b1804b1-42bb01fb0fbmr83228275e9.35.1725193298464;
        Sun, 01 Sep 2024 05:21:38 -0700 (PDT)
Received: from morpheus.home.roving-it.com.com (8.c.1.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::1c8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42baf1b0c18sm121363695e9.37.2024.09.01.05.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 05:21:38 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 2/3] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
Date: Sun,  1 Sep 2024 13:21:30 +0100
Message-ID: <20240901122135.1389702-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901122135.1389702-1-pbrobinson@gmail.com>
References: <20240901122135.1389702-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds all the pin mappings on the WiFi/BT header on
the SoPine baseboard/A64-LTS. They're disabled by default
as the modules don't ship by default. This includes, where
they haven't been already, UART1 for BT and mmc1 for WiFi.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
index be2347c8f267..752d2aae8465 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
@@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
+
+	wifi_pwrseq: pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
+	};
 };
 
 &ac_power_supply {
@@ -103,6 +108,17 @@ ext_rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+/* On Wifi/BT connector */
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&reg_dldo4>;
+	vqmmc-supply = <&reg_eldo1>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+};
+
 &mmc2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc2_pins>;
@@ -175,6 +191,14 @@ &uart0 {
 	status = "okay";
 };
 
+/* On Wifi/BT connector, with RTS/CTS */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "disabled";
+};
+
 /* On Pi-2 connector */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.46.0

