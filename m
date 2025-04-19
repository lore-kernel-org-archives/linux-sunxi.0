Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C673A14601C
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 16:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745078460; cv=none; b=nNIdNm2Iubwaj8X7pBmNfYaouCzKYLTikz+RxQMyrLqWG77u1ceRF3MmsvQ2YCUB7YUezOivhZqcRCxVBFoRvzFg1/esQtC3WseqVdSfueJI4QL8kSc+RIrqZOYbDAwNFYn2LT8Xk0K1Az8ktpGeuFk++gmAi6zKdyrPblyTOaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745078460; c=relaxed/simple;
	bh=9EIQvaWuR9v2xjQSldh7WwmpF0xWaVIW78XgjHwRd8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MK4cUTYnnPw8f0xk2u7UhY7IKTBextI/JzPDxygJ5X06BlkR6aA0KWmeFI3ThIC59bpbbC5QSiagt+P1Vkn5viNhoWVPFIPhHdP3Sw6cvGaSWpc+ncauspbSDoEIDV5n/mofc6biEuDKPM+BM24Sb4/dKIRk0c6Bf2RSbhNXYbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnvwPV+c; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnvwPV+c"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso29382045e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 09:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745078457; x=1745683257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9g6VFlFUjDGAvPM/73WOyE05ALtKuShtgVCvymsHIc=;
        b=NnvwPV+c6J3IzZoBG6Ez5B/Hf52bGRx92ioHvbTK25heTArsvzLMBsYXakf1ng3Ngd
         G54Jk1jiuhkH3R1P5XThrkqwtLL8nROVod24+ksZ0x0P8gSVcnsA74cHFQoQZeUxiSOj
         v9vo6BRzAnMtQMgzxY1rYulI0LZFuTALB8OC1wEV9Hbbx1PdED1kaKnKqk1HQGsqGfhz
         3HOdzPP4tRNTJSwVqmmuAzTATJ//1eVpSBeLV0x8mZjJ7akmn+nPq9gEWHlDzhJkWMaB
         iIf7bKmVj0YUR25RCNVAe7tLSWmJv13hp1PIyBy/8or1LBCNUNKluH4CLMDl2Jg25C83
         lPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745078457; x=1745683257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9g6VFlFUjDGAvPM/73WOyE05ALtKuShtgVCvymsHIc=;
        b=U0pbFeuPlxvEvnVlZXHTQcfyxjxAK6Ijj+xePEZ6Cs2n838UGFmdxJAcSdDjXEErOS
         5UgU7Hmeih8bSw5c1zCZK1Hh+VnYnEF619xkw9rDyCbVxMNlD7P0wSDsLTx28iT4g09A
         sfsJggclDoGzEWwhYjwojo7ZgrH15C1aJeMmX+s+VofRQ/rYof3ZOBgfHj5Cze8qnQVQ
         bBqlF+2riPW/huNb5lA7fAXgDWJL7fEWptiEuLrP11g2uf/KSbNBuLJL78SUsifXXxmq
         dtWtSourpRtyLeB5pRpX9gcVkXH8fGLG+PR58CqUWliBOmML78JzaINQZ3+aS/JJ22gD
         uXbA==
X-Forwarded-Encrypted: i=1; AJvYcCXTqCo+PuvZxmjgr4rSmTkcmPm5rQzXXQuzxsuAD3dFs451fZRqyZNALqFO0A9O9148BRLiDbNhw0x2tw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx69EfC5sAzFS5xoeraXopPkngLp1vs8ZUe6fx3j/IjFVEl07lv
	bSwC1Kx6G6nAhH+dhGYecB7j9L5609Kq7gIuDEcgHmZUN0232ZTN
X-Gm-Gg: ASbGncuKk78F+J7ZlrbUVHl8pZFOdNUdqnqwgpSXo04+SvnyvcsvbL4UAl58SqfjD76
	PcU3DsADFC20Pyt52xXcIwNJTQ89gjCmxhrSN+w4KO3MahatDa1UhoyQkONoXGQXmu8AUMYUe9f
	9mKq0eZpZMVBVDal8rgiCnmALbFfnzC2jPRbhZFy0ALXpoFG/5Jud9KssyjSCh5hkwOMpHfz0+c
	CgH0OIkUT3t+zAf7y+8xxIzY+KbibzXAYmPOH6n1st9gBRNb6HlmMWKZ+ldQ2sYZ43MZxCfVxmp
	X6D30gFKbYL6JJlJLkcZ581rzUA/VWOyXDgm2v27ZFJcl3nHXeLR+a9cyKCtGsSkbYzNHsrp0R8
	PdGkxXHqXn6HAjTyxP2hwSj2DH7/Vv4ANKXtXkq2bNvu70rTVyTjvJPNHJOjpLVrXtxUt53FRss
	gCxeqFW3IH2g==
X-Google-Smtp-Source: AGHT+IEFux77sQ4LMwqgP+aTNt02+1lfYyRsU4Xbnatq+EY991mQXeDP75cSTOaBlkG7ePdt7v3xNg==
X-Received: by 2002:a05:600c:4450:b0:43d:94:cff0 with SMTP id 5b1f17b1804b1-4406abb198amr42996095e9.19.1745078456892;
        Sat, 19 Apr 2025 09:00:56 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4406d5acdd4sm65136215e9.14.2025.04.19.09.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:00:56 -0700 (PDT)
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
Subject: [PATCH v3 1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
Date: Sat, 19 Apr 2025 17:00:46 +0100
Message-ID: <20250419160051.677485-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419160051.677485-1-pbrobinson@gmail.com>
References: <20250419160051.677485-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds all the pin mappings on the WiFi/BT header on
the original Pine64. They're disabled by default as the
modules don't ship by default. This includes, where they
haven't been already, UART1 for BT and mmc1 for WiFi.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../boot/dts/allwinner/sun50i-a64-pine64.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 09e71fd60785..764fb191107a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -35,6 +35,11 @@ hdmi_con_in: endpoint {
 			};
 		};
 	};
+
+	wifi_pwrseq: pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
+	};
 };
 
 &codec {
@@ -124,6 +129,18 @@ &mmc0 {
 	status = "okay";
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
+	status = "disabled";
+};
+
 &ohci0 {
 	status = "okay";
 };
@@ -286,6 +303,7 @@ &uart0 {
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
 	status = "disabled";
 };
 
-- 
2.49.0

