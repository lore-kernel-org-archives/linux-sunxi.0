Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E011C4A09
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Dec 2024 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734696045; cv=none; b=RmzPW+e+cL791vqXs1DTP5UTJfKh1hCooonHLamlnX97RhkTxmyv2suO7GH75P93Q42K6ux7+ojmcsZUrAYYcgpluurUrpr8pTUSUIGIgDAFjiNoaM6xGWay+bn4Q+QXjgGGYS/CWbsbaN6qLbWBXUTYvdgv0XKY2Qgf+tYofDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734696045; c=relaxed/simple;
	bh=ZvIQnE5umiaAN8ikC0HerlOXymza/w8b7xBF7bzrYuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pa/R/EHYIjIi5ny/K79T9N4XROUWxYjR7lpvTLoVAGTJv43RphPM1axZVeZgq0BwDhYF9XSkgD8OoMkpccG3sQYCJJK5A9IkfHDbG+6d7UCDr/T1NvNJai87QtMVwtYAGT45cYZ9Bdrg7AYJWUHJUeGLHZRiF1a366qVMvep4do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmJpBkiY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmJpBkiY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-386329da1d9so901328f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Dec 2024 04:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734696043; x=1735300843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c+9If8W7Xl+w31iRvENBg3VUkO/76wew21FGkaNGXY=;
        b=SmJpBkiY1lPivUfeRHRIGgw8an/4qBbTxuBCNi7ZWgMwwfgvnpID8aVFkRmK7wKA5/
         GtqmFryM3TQHTwGdZQluSebiZAf4d/9Uvi4sFpmz8hfBjAii4+3WcC4uCGYf8Qr+IlMp
         wbRSQ46Y4iDHaniwCzyN+zlQJ5pmuzAr9EpzXBUrKchOsTcl0FeLB8i1yWQyHRpTLH+x
         C+3wzaJTh9CPgL0FcYpxmsxoG3vlezkRYmBOXIDCGRve0BPrsF5p1Pp1VA+h5UaWcv6l
         2uOOkrqh264bles+LK8sixFhIFuvDhtUTkY7ZIkAT9vg7tSLEzRxK0aDT8YGYJPprvtD
         E2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734696043; x=1735300843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7c+9If8W7Xl+w31iRvENBg3VUkO/76wew21FGkaNGXY=;
        b=aP7gYf0vS71+aZoJ7EUvLcCH033ARhJyEdkaqDmISbchNVFofAJQlhVXj3jL/MjaQE
         2efhUaiZ6L5JKTuoxUphED23EYb4YZefi5R8F4HSrhJFE+dArEkAxIVfpCm+0e6jzc8o
         QiosCavTbitsRgHjK6YxM9yjOhUugCUw6FX7ywxKOmX6Lsn+RkIQe2q4yyyetDquNf/D
         ATSrKoRksB6pZw/gWRYy8Bg8G2d7afVV7J7ojQPUDRhsZuKJ6VLljvaBSbLAYIc35pLZ
         DCy4ilYDh1FMMGKphk33Q1GjLi2L6JpbLiIcHZN2ulr4X8VrIV3A92DfSPc+TJ/+8h5h
         BTXA==
X-Forwarded-Encrypted: i=1; AJvYcCVTseYnO+VJXPxNJzWhEM6Dld7Qm4KvLTsL2U179EuNCQ11kypaZIRFSVhbxh1C9n773G3J+47f7j3c7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFNUfZWa4DuHauGvEQpb5ODowXwuP/p/LKXtkb74/MwfiHqowl
	/ugZFT02GLXnGtgnoYE2b+0UYUD4F4VJrWcXq3MtT9jmFL9spMHW
X-Gm-Gg: ASbGncsOIDnCkcJpJeONnUxqwFMLpfm+Pxy9Vh8qHDaAiGaklgpWZ8KJGFk+wQD9pmB
	leSlCnEEP/IWmdZOFPhqYyBbhDG0dmVQnIyNrJ10YJaynwYaMNdbwrSxi+5RuCtDd1KEu2yXoV1
	prDdMR3XEtxqHd9i50ac7+kIx4ypwDQu1q1A5ZTfyupYkESmpUoWD6shJe3o+P1nr1VBUw/i9gt
	qsXkE/SsZJPYjUKS0Y4vCVlbv9MD6vY+dJhQZfJ3bbkfY8x9TXQGOolVYBi2HaJUne1uJuv/8vN
	7WFZvgpKPh2WdUyBOYnWxcjxaf7jA6+0zmubTX1r8djNIRgbv0gaty9u/kga1w==
X-Google-Smtp-Source: AGHT+IE2c5XLJyzNR1zhyXkJ+darIKZUZG1iPFBT6zdD9tb9k+0R145WUAU3upIKBqOszM+jPqMnSg==
X-Received: by 2002:a5d:59ac:0:b0:386:2fc8:ef86 with SMTP id ffacd0b85a97d-38a221fac08mr2551293f8f.14.1734696042701;
        Fri, 20 Dec 2024 04:00:42 -0800 (PST)
Received: from cypher.localdomain (e.b.8.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::8be])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8b830csm3921038f8f.108.2024.12.20.04.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 04:00:42 -0800 (PST)
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
Subject: [PATCH v2 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
Date: Fri, 20 Dec 2024 12:00:31 +0000
Message-ID: <20241220120038.3137248-3-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220120038.3137248-1-pbrobinson@gmail.com>
References: <20241220120038.3137248-1-pbrobinson@gmail.com>
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
2.47.1

