Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366831E5729
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 09:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745142513; cv=none; b=g57IKkgsTtTkWfZugKJ0sDyz0SK8sRkfv82SSDnOr9m66cMRKHSrvDrZQIdygruLZTNSd1FPSwFxKza69H5r2FHWJh9WCn2bBAHJ0DD1DN3So5sPbXUt4UuyWbTi6KYCrwJam9ji2PtWtLgZ6/DeegPWt+nCn0aYOF8NG5mBnaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745142513; c=relaxed/simple;
	bh=ANkoL7ea81UHYIa++4P/2uX3YHtTBEieOWgY8Mvo1F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmhCjTXRGsrMYiI5uq77yEYxEC58uDCkb6itVBxBH95LUa5Z23h4LK0yYEq7MQa9vbFdLNngR6iWSBgYlXQvE1CT+18ST7r1qs0eXZQkDykP6BoKkrulxWgV2MdfehUXMSJdTn5Z/Jmqx3YNYicWcmOc/py0CSXYKxDi3MM/wXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fM+JqKuW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fM+JqKuW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so23052825e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745142510; x=1745747310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV1KL0B4Ol1zLYcOywJS50VMsEVaOjK36lDCk5xYJ8U=;
        b=fM+JqKuWQ6MJ6gMDtET8PCaoG5EOp+qudJ2eHggE+2oHUMffCGRcffX6CNVK9ZnnLG
         cr9MeWeBbv/A2UPAEM+uUplXSxPCWvIMZWwwlGw9F/mmFQFar+N9KlDFqUySmtHKMQGu
         4z364CRBna0GQ+5PyuTivhVQMl4QyXzRzLqhcUqQs/y6MTYYx0FRae850JpaUmn02lCG
         8edlBbNt7LD04hIHHIac5zsiWy4B0ux2t/N+D+yHvEC1b3IUfhjYVbATJ9gPQI4J3243
         tsbsRgMk0odq0+UqoKOKLunX0JlWbQMnnAhhXgSmV9eIa1FI9WQx2kno/AAZ3uEDilkm
         ob/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745142510; x=1745747310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV1KL0B4Ol1zLYcOywJS50VMsEVaOjK36lDCk5xYJ8U=;
        b=OcaavKtm+YdjBU/VCbPqyGgj/7Uzp/1KAxtEvC9neosnqYcvZZpGI/AOxA4XC3DHIK
         OZQwWgv6jSya2NtYgpNqY/EOTYKJKIe9KaTNzu7qWj+9wuNjelQ/ON+aARqKOOcN7bzI
         54JOPT1182VYsLoR801CI2xKxV+VQWrcnUJ5Xx5R+JhoOADqHPW6+Mjvf+yZo7gUHSsm
         H7w4imxWJGQ1M5PwWAC0DaTHT9ww7SySBXLcED4miYtpdkgtPT/MXCjjdSctMJvu9TMj
         NTDeCDWYdHluUaEcmCCEqWO6GqlWH8QKnIClNznWCdTcBEiI9b2JJ5ZkgDCL1uMc/eSY
         agiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgB5TGJkBbnJQr4Z5rTNxsy+ZTBe7Y1iOOXJokmix3kGDSKJPHbGJ2Et1BD0/gTyoKF2+AlalapDtMSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0pPAce737++u02i91htOP4XpuHofr65QmrsWkk2hcZ+uBLRI/
	hi5wOvoiYc75zsFjR/xEGJh5Vcs3vdRMBt/s8oKcfMvmdOePUzSG
X-Gm-Gg: ASbGncuHC63MKL+p6oEERnEir9sfHBGKi2WIkQJKXI0PmE+ZEgNHs4NRA6nzgyiuo5F
	a3+nPiEyM0h4BRVLm7qyDBKxScDHMfEcm/borDKf5+eEXNbRlbUlYk6Md3PsA6mYgSwR7D5h0TM
	/uF9WhsDlcYPdl4aAH2feuznJYBiAIs/aHYpjoj6BjrJzLHVc2RUjMYZ9hgRY+cjeA0Lrpeojne
	LJqW7DPE4fa2t94WKdCf3/L8rEJbHyn5jldWaI3kP8NY8sofyEnvxKRUgeHEh8cBxWoBV7USKPI
	jP4etNv6Gj7LW4qV4vSWKCBIBdYbz8V4EnpdLD4XJzU7qXDlla6q8kMVUB2Wi7mlyhvpaHxOzZ9
	yI3lvJtIqBk4QOLFCoeSK8Zc3Ee/fKLDhbDaHeP+s8xkIAMuP7eA2zvf/6HTjkvsZkic/DkfJBn
	g=
X-Google-Smtp-Source: AGHT+IGLhlzrje0W/99vHutqnqraxOZnv9q3niHg6lZbOoS4HG8LPSq62S6s1AF4Tg3e6WlI1VcYEA==
X-Received: by 2002:a05:600c:c0db:b0:43d:10a:1b90 with SMTP id 5b1f17b1804b1-44072c7f6fbmr44810305e9.16.1745142510468;
        Sun, 20 Apr 2025 02:48:30 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39efa43bef1sm8273712f8f.49.2025.04.20.02.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 02:48:30 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v4 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SOPINE Baseboard
Date: Sun, 20 Apr 2025 10:48:05 +0100
Message-ID: <20250420094823.954073-3-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420094823.954073-1-pbrobinson@gmail.com>
References: <20250420094823.954073-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds all the pin mappings on the WiFi/BT header on
the SOPINE Baseboard/A64-LTS. They're disabled by default
as the modules don't ship by default. This includes, where
they haven't been already, UART1 for BT and mmc1 for WiFi.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
index be2347c8f267..231e652cab67 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
@@ -103,6 +103,17 @@ ext_rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+/* On Wifi/BT connector */
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&reg_dldo4>;
+	vqmmc-supply = <&reg_eldo1>;
+	bus-width = <4>;
+	non-removable;
+	status = "disabled";
+};
+
 &mmc2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc2_pins>;
@@ -175,6 +186,14 @@ &uart0 {
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
2.49.0

