Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0530E1C5CA1
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Dec 2024 12:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734696045; cv=none; b=Z+O812w7EnOdYzEa0KZb9x24UEs/CGV4ouX3ebjxpVWuaxQ1cj57FrtNKwjm/o4k2uZphsvyIhQQCij6ss16miT0dp2RPaoMirB6OgSixCAouQOm5VZPic2nZjPkEFmkZsAEF3vXEm9zoC47g7ki6LBYdq3ISyZP0PCDX9Otahw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734696045; c=relaxed/simple;
	bh=D2tZXzEqgyEKFEmVwk/d41UosHsvKgGX0qY3bx1cllc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7dh2IXJNozTf5v31GfhdellVXz9mrc6F4BDGi+EU6JRgEWpKgtNWf2TOBVsF+lxdZVXEP7Tu7NxRsDUoPApU7dYxIvzkzj+8nnwfE/69RmCdX2vZEVKQqh56vMN3ix3YVcVztRYAqx/Y4vVQw9ANjV+7r1fSq9wbOySzGoJXio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyzWmxoC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyzWmxoC"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862a921123so1287594f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Dec 2024 04:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734696042; x=1735300842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PSZeHHkCW6wlnu9PsCgTdp/ZEwb0V+NyqcmEQUOdns=;
        b=eyzWmxoC3cvojTRWgFrk9KOMRT8CLR3AJzfRaufrFsUccY8oRNVsSWHbDs2u+sxXU7
         k6CZoD0G4H5fMY9iH4IApYnzkKWb5TUYmwGWXyuKpeIfUZHDBJgwUy223enKLomooF7a
         xP8pOt3yDDFEKmjtgpscbg+lZPxNY6dAJ2lNLuCI8v2XvPPSfy69hqImBRAQSkCvQ3g5
         /pHTr5ON0VQ+ndDHiETHC94zI5qzKbAxr5ejqipzybE0FrFWOSm8E2mZAsQQUjnLmKG/
         BSZGXGEJZEbKvBGnATOYFIN7sVsLTwfE7U7p3cSJ+I4sA6X4nmZIkmxi0Sj30t5nAM1m
         ZVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734696042; x=1735300842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PSZeHHkCW6wlnu9PsCgTdp/ZEwb0V+NyqcmEQUOdns=;
        b=GtAOok0Hn9w0UCq/GncJEhZQryfbDi4ZLQpe9a5VR3T0cUy+fP3buG2FXWvFj77gli
         azfCJDnB7q2lMaNXPtwdeeELMX43WUkntLz7thWPdUWfkxQWnSnPbODIl2PaYA0rIHOg
         nK456GQTswwyRlwyOpcgntOH//eTrYYxJexhPiiw7MoqKaPLuQ4l5apiFDiuUWjNHth5
         kbgmbOT0E2n4yD/wsZOnkHBSniYv47N6751o4H0xoukXmz3+Y/CsWNbZ+NGon9QbcOuB
         9mjUcKqUcitk49T9V7Wrh6wDkY3JrCJnKSahb3PGP4H927ykPHIVPTqiDzlErHJ4UPzZ
         Ixrw==
X-Forwarded-Encrypted: i=1; AJvYcCWnJdJpRDaewo2qjTRv3sMTZh00wD+UtBNta6E4AZdVKQGYJE/gaD5iHTAW7opkqM2Dxh6pyLg7BXGSrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjUHlhWRbJw17VKByGnLJQQuyceGEvYhEJ4MYAbfkBc4vmWGdQ
	QRKRwHbRbs8BOK9Wq2djSKfpkN2A3N196UX577lIutZIq7IsC7NZ
X-Gm-Gg: ASbGncuYwA9UT781tVyGwPQIzxZlDkUYalp7UBAceFRqipIOhbvAmtvHguCutwoU1na
	Cef4EvvH/cMVsdEErkADa21P1RjxA+0lHJ+EZeGghw/VQdvL13UXGnrdqtMlAMgS8vG5ee4eF9F
	DB+KG3k1gTuWjGkUdiTa6TWzwJcrUDkQZLkCTgbphEVzHr3Km+Yoo170U80J5k3V/mF8kYFHXr+
	R70so5VgHx0UcqUU+n3rCRrh4xAWDzm/VMQnBkckzH46/Mtlm/h2eH4AxdWzRhAcXgJkUjMhry5
	1k0puUYjUTIEGXp2rt6fv4K+5N/KnMPTFlsZ62pDYG/str4whC4+V/xzXFcd/Q==
X-Google-Smtp-Source: AGHT+IHmWsMA9nW1lsPiSxNBhMagfaDdRvhKKxRsgc2zMuwWmMdOEPQP3bdm0aS3GFPGO5WQ8QG6Pw==
X-Received: by 2002:a5d:6d84:0:b0:386:45e9:fc8a with SMTP id ffacd0b85a97d-38a221e1dfemr2502314f8f.5.1734696042080;
        Fri, 20 Dec 2024 04:00:42 -0800 (PST)
Received: from cypher.localdomain (e.b.8.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::8be])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8b830csm3921038f8f.108.2024.12.20.04.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 04:00:41 -0800 (PST)
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
Subject: [PATCH v2 1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
Date: Fri, 20 Dec 2024 12:00:30 +0000
Message-ID: <20241220120038.3137248-2-pbrobinson@gmail.com>
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
the original Pine64. They're disabled by default as the
modules don't ship by default. This includes, where they
haven't been already, UART1 for BT and mmc1 for WiFi.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../boot/dts/allwinner/sun50i-a64-pine64.dts    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 09e71fd60785..f04f0f1badc4 100644
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
@@ -124,6 +129,17 @@ &mmc0 {
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
+};
+
 &ohci0 {
 	status = "okay";
 };
@@ -286,6 +302,7 @@ &uart0 {
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
 	status = "disabled";
 };
 
-- 
2.47.1

