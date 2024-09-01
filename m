Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A98017557E
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Sep 2024 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725193302; cv=none; b=PZrP1ptFVX73oPcgxqClhJGVExccG/YVqmzEIkQ6uOfphU3fjHDMPaHbIVcL/fv7msh9e4SHpddv0/1hO8oeJuFqcdPe6fLx74aJda9IooHciVSkn/RqcpLxMJQKjGU7a9j2PgtSqKa8l+UfP5L4ITnGK6nbebXhEE8geRukF6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725193302; c=relaxed/simple;
	bh=kMkSswi3cJQEOzCI1FvFxAKA2XruX1VlmLHdEV9umyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jmv/oejbalFqMpLoNua2R7rtIsbsKl3920uD/yBKFgr2upj/PU1pbnHW7LgGTZ3YNsPOb/fBxIzbvzB5FzqqXmuwXuV6IwiTSlm/kLXyPbvDVF1rCyikf9WBBiYWQ35d7vnl7QYYN5HtJnHZRkI2b/MZB4heJiADMPQ7IK1eYO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kihHhU9S; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kihHhU9S"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374c1963cb6so602311f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Sep 2024 05:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725193300; x=1725798100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MyPRlLasNmrOw4DOrVnxaytxIdGW4v/OBVoaI+Igts=;
        b=kihHhU9SnkOZCGNdjwYxnhD9si9wh7QsVswcaap62Kzo++q0jUqik7kwVlcT/CNNn/
         SVt0O+79Ykqctme6YdrKxjn2781W3LloaOL83jSlWI/654eAXacOJz1EeuoMsl57EBGu
         eTSSX7oqYA0lVkJ+6o6G0htmnbRkYkCSFFPKFlQ5c6qI9MOsv7sBX0nCqXQNOFBD5aSN
         RcfJ8qHNJFfHjWHNbT2HM+L1lVwRdG+pw7/XdYvzneVrZAH2hTOo/c5e/JwhOZIlzsVE
         Cka32ctYkcBFr8gxzUAjsdORjIgLV5RlHTQ1NIOD+rA+SvQ4Z6zVCMFwsTivJYo2gfjJ
         cz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725193300; x=1725798100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MyPRlLasNmrOw4DOrVnxaytxIdGW4v/OBVoaI+Igts=;
        b=IB/7tYO3UlpV9n6Z/g8zHJmHaNV/i8cFUJvdJ9np4nOPlbqwKNKvofmlfR6qKzOEtt
         cFRO4IRmRrQHYuKSrkOhKB4Xtu/+Lj7EXIHnz8DjBIVN6vaLGbpdP6InocaHJKzG2djR
         n09gLYxXkrKyKGlPU2jXCrOuhjFAfGs0zDOnCKcO6ROMmu0h5Sx1Gzd+i289QRjUUPIB
         fwrjDPJUIfFZ/VP1j8RsGoS4nKPKJsnFflfvDismryeGf0WROYaj//57bPlainy1IQh9
         Jp8poMytKmoW2l4h16urdK+lAuyWiA3IPTGVpSSmmgiUrmRDOQyNIyy4XwK3H6WCyQJ8
         6v3w==
X-Forwarded-Encrypted: i=1; AJvYcCW8vXbeTTrRrColxHTgSz21cLgmb47ZF+8NKAvGsovrckMso/kK+oCFSrGD4u4M0YyQy0vBxcvrqITbgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMXg/xPWlz3J9BVIACK1vKwvOpmQma4YEFa9GPsO8Z4mSwGmFu
	1bnOlofhCsXri2wkpzqnFVGkxCfZk4uaUcfgKKswonzgTsakguHy
X-Google-Smtp-Source: AGHT+IGxEwCIMs1vckP44Y0ObbyoNuVEf9RE6EeOjE/Zxr5ZsSmV+fTP4u6C/LtxynfdDXIfD/jxqA==
X-Received: by 2002:adf:a448:0:b0:374:c61a:69b8 with SMTP id ffacd0b85a97d-374c61a6a38mr972561f8f.15.1725193299078;
        Sun, 01 Sep 2024 05:21:39 -0700 (PDT)
Received: from morpheus.home.roving-it.com.com (8.c.1.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::1c8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42baf1b0c18sm121363695e9.37.2024.09.01.05.21.38
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
Subject: [PATCH 3/3] arm64: dts: allwinner: a64: Add WiFi/BT on Pine64
Date: Sun,  1 Sep 2024 13:21:31 +0100
Message-ID: <20240901122135.1389702-3-pbrobinson@gmail.com>
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

Enable the rtl8723bs WiFi/BT modules on the Pine64.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../boot/dts/allwinner/sun50i-a64-pine64.dts    | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index f04f0f1badc4..1d514859e664 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -138,6 +138,14 @@ &mmc1 {
 	mmc-pwrseq = <&wifi_pwrseq>;
 	bus-width = <4>;
 	non-removable;
+	status = "okay";
+
+	rtl8723bs: wifi@1 {
+		reg = <1>;
+		interrupt-parent = <&r_pio>;
+		interrupts = <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 */
+		interrupt-names = "host-wake";
+	};
 };
 
 &ohci0 {
@@ -303,7 +311,14 @@ &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
 	uart-has-rtscts;
-	status = "disabled";
+	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8723bs-bt";
+		device-wake-gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+		enable-gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
+		host-wake-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* PL5 */
+	};
 };
 
 /* On Pi-2 connector */
-- 
2.46.0

