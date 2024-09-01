Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257C114B083
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Sep 2024 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725193301; cv=none; b=tKV6KEyebYmFCu30qXob8ODsua9R/THILI7xu1pkTBDBFdP+gQtUiLw3rR9jGe+Bh68KxkSGD5YLvwixZdNv1v+HUEiuZBj2v4TpQzsPgzWe+aCglU0uFz9mUhPUWnlKUGPPN5O3xjnJ0YeWjavyYr1wlG3yfN/4VpD2sfEADTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725193301; c=relaxed/simple;
	bh=w7JvkxpFs3aIiEobCg3ZLPNGzLbw3r8mGAVW38488CA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISsdYMlAF+li7DCojhFHHQr1hYoeXKJfLbLqCBEhFudPIvctnIb5/fc/o9YQz3Z95K/TouwN/8W7/Zt070wL3YLC0zsAqT5mVzr82UmbuJ0EnuXH80U5TJjGbPdZt3EyXk78/zacvhUQTYXhcQxqe9E5/8UeGpmTM61n7PL0E3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDMNvgZf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDMNvgZf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bb8c6e250so24533085e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Sep 2024 05:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725193298; x=1725798098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S3QqO1DNWoq6azA2+M6iG5kCR4SnEiL6Nm4BqEihvJE=;
        b=PDMNvgZfjLI+HYJR+nFNT2y+ZR1AJhMWEf2N0gagn61njjeuDecaj2H91wXFZPJaz4
         thBKASI80PVnbLHaQsazHeTSuDJYrvb3t8qDRAYRyuYkbK/r7O1s8wJbZtJvDkv+hB10
         gyF1ZnEilD58MzmTbMrVqAmCovAwMtHBhOJFPqO9BBfUf2TJvOGU9wItALSxI09vkvwZ
         V+84PVPj4TERokQCWEsm/Pe2VJWmAfzMziiZ4QVGnU579/+rgcKH6sMe+0s9YHTs7zHu
         RWnoLbDsolHrXG8pNnVhaxLLzKEs5mIlfT+5EONOh3qREPfh1JVga2Gj0j7yzbFwrY7l
         Fa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725193298; x=1725798098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3QqO1DNWoq6azA2+M6iG5kCR4SnEiL6Nm4BqEihvJE=;
        b=rvDw8yEk+PHyhWOEyk0d+LgiQhtp6lo/MdWHdnOliFMtnt2aFgnj8njSfwDtZIMVsp
         gW9vfVh1Zi2I/gAhNCL60g+E9nrNUymN9JG4oGbt3INRuc4M5jgNTYRHT86MEMuvStJS
         OlpQmwL+X61w+xH/4aFkkdqe1X5MjI93uJPjgyh/MymfYRKhixaHjWiwY+l6oU1jYjbI
         mdpcyqk4/P76LSrp+3f8g9VU+UdE9U4tZvtbJUS0CbRc/mGLoYG6aW9t4gVzbkeMHqRN
         wZf4Gn+xLRJbYlmbSulX6HforWqgj80p7oXEJ77soc+AntmyZ+I9umtE9mPVa0f+jOKi
         lKiw==
X-Forwarded-Encrypted: i=1; AJvYcCU5fXCsyA4JtbdCkOq8/2RcaZnZ3d0ZfS7e+21RQuD5RFGdcYcDogVNge9w1JdM9doW/7GSDLjApVNWqA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn2QNIApz7VprzMOUNvOIn+p2ymjufJHR5+CKmbeUAv5f1KVpF
	YdMbHfx7q42GZI2457P92+IPmrFeeyrz3j6WRulwcsKIf4kiiIMA
X-Google-Smtp-Source: AGHT+IHrFigHK4m4sNfpXR7aEdiOm4KSC59yNn0eiFWD1Uc+I8s/Uk57fGk+MERhoR/1tLQHxgz+tQ==
X-Received: by 2002:a05:600c:1c91:b0:426:5440:854a with SMTP id 5b1f17b1804b1-42c82f4844emr5021875e9.1.1725193297737;
        Sun, 01 Sep 2024 05:21:37 -0700 (PDT)
Received: from morpheus.home.roving-it.com.com (8.c.1.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::1c8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42baf1b0c18sm121363695e9.37.2024.09.01.05.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 05:21:37 -0700 (PDT)
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
Subject: [PATCH 1/3] arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
Date: Sun,  1 Sep 2024 13:21:29 +0100
Message-ID: <20240901122135.1389702-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.46.0
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
2.46.0

