Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715231C862F
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 16:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745078461; cv=none; b=TBhZlUhxQGwJpAlwtI//SIMtBWcR8tIXk2RrzapWuh/QUK7IthZiUNTaGm/fzUAWdt54KHUVI7d0RHpElCUNZcIO3A+GThnWhKbKPCNG6tXUHLusdGb9KS1QsCfdz1Qui/PQwyylp9AtGwCIU5ONUGvmx0TOgxvB6Aiw5NT6GNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745078461; c=relaxed/simple;
	bh=jRS+m56yoBKWqlzJCHpQcuz1hc7SEoagmFxe1YwYmyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTq5/kWkvlGWMMkeInwH/5FJsPofSgBSi2LpB+rw97TrljoQp5jCEL26930X6O1tf0cxem+IB0dgcd9TdSjEwszBVpQy6VEJBCF6WlQGguL/bknTuG5CQFpZAM6BQiYFw3c2x2v6htmo7qZOqgPYjXnsj/0I4Vwrqr9tUj5oukg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxSOQvEt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxSOQvEt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf848528aso20979705e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 09:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745078458; x=1745683258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWjhUwz//7evtz5HtoiKNduoxXjnJthBXIa+so1f8/0=;
        b=YxSOQvEtNw5xrl/0iPiAIEcKvps18DoFpq8M2MGKE9FmqMXd1QVdKblSjevegie8TK
         kgxB7XqQq1NiHXXyC2g/qbW+6sjYBQ4QR77LZ4Itq21ttM5lJipGGicrSgkIyjjz1lho
         rkrcnOv8Dk8ASxkJL+e/IPP5QUSwL9QZhQAWjpfb2q/41Zm4v4xGv6Da1PyQJSlzL9KZ
         ZFPbTlqS5i/Q1bbAxC7KGTXDnWcbRZrb+Lh230GW81FpG3qt3E63olu1aovPHiTf7V30
         OacTE2n3atAbkJO8nFC0AUKU2Xgt2e6OMj8BqGnTew3iMofGWLfAnP69TKc0r+1U4lwI
         Euig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745078458; x=1745683258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWjhUwz//7evtz5HtoiKNduoxXjnJthBXIa+so1f8/0=;
        b=c47VddFEtKn8fhyLILwG9z61gK6nn2mEMQqJQ/ACvKfU/md5l6TOo671MdmuXjs6IY
         v+olHBR83SS9Cqn1vui0xfbseOMFODAavYLrZegti7iVjJPOb+I/IwS/8xhTWOg3/62B
         whFQvZrsCtFIwsFTiUU5rdrDin3Uoh1OE1GAD57zMrHZ2Zho2/Jx8GwgrXq3ffJrUW4q
         YKm7JXMiF0u0TQ6d0M3iYDkvkRCOh7APN/3u+cMbaHjRnLFl0JJKkqfDlTiG9JRWmoZu
         sBBStD8b6nW46PtG/fPGC336wjuvPbZ7joAt1/vEmBVY2d335+xWSLVljtap+mmQYeCx
         ObdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwCdcdcYEv51lTmvF0nufSVsA5zuhJrZcnnU5pWjfjuC2bAXFGRb+cBW7OOw0VAtA2yrphOriY5uvZnA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl0wC0leMjXJSu8KcvguhTJzVRyVrDpYrQgtqqrvnUImT17tch
	X7eEUy8HHcrvyrs5T/e8ycR/lm7w6EKhLg96xhLNl89Y/oypscSW
X-Gm-Gg: ASbGncuolKRRVZII2I2wTzvOvPcZItCQ5Rim/r1S+McUF1qA4RQ8KuihQn03vZNEwoz
	tJhrmPqCDoXRV1lxFIfyGPMzFbYUiyvgGm+zOIgsRHar8SZz/xiqiirwHN0Unw4wiv7WggfnqYJ
	XcmhEgjLQwb0Ypb1uX+4pfi4ogE8hyDaLWhLYodND2O8yn7vfdyxpvstQP2QNQawzK2FqVbpLIN
	vdNgwC86WiTwEOWGfO4oW6VJQwqqY9DHEKW4tR+qgCH1srW3Ds6jL8wA6+bIhzq9B4fjABNI0Hy
	ZDr/lFRImqDWYE4M7zycH/szdCjZlqk+4JlEjyOVgML6ZIOqzv/ZRaIM1UDezTKwatM/Aouxws0
	2G7wnk6swiEx0h5knw+H5xqHnjlaf5gisacNFh68Blqwa6WMnJxzh1xRLJY1IyJUqNvcZqGQeon
	E=
X-Google-Smtp-Source: AGHT+IFibSa/W5S20lX1ZIerWQ4r767y0JrMahGOeoqoY2ep9DudBt3/PDo2q3Eq1Dwy2DGxhmaTAA==
X-Received: by 2002:a05:600c:1d03:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-4406ac6562fmr61019145e9.30.1745078457553;
        Sat, 19 Apr 2025 09:00:57 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4406d5acdd4sm65136215e9.14.2025.04.19.09.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:00:57 -0700 (PDT)
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
Subject: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
Date: Sat, 19 Apr 2025 17:00:47 +0100
Message-ID: <20250419160051.677485-3-pbrobinson@gmail.com>
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
the SoPine baseboard/A64-LTS. They're disabled by default
as the modules don't ship by default. This includes, where
they haven't been already, UART1 for BT and mmc1 for WiFi.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
index be2347c8f267..64d696f110ee 100644
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
@@ -103,6 +108,18 @@ ext_rgmii_phy: ethernet-phy@1 {
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
+	status = "disabled";
+};
+
 &mmc2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc2_pins>;
@@ -175,6 +192,14 @@ &uart0 {
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

