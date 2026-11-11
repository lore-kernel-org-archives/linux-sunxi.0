Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404993;
	b=j2JexYG889dX9slFo6Y6NmEGM4kghQabErHIf9sXIl0eXhB2ysnD090rJNczEy6uNdwU
	 0Qot/WQVgGsSJnow/bED6lSWOzxMlKbELupvYO2BGODInjQMk619B2gOOECNGTFLHzUzJ
	 p1C3L2kTPUy0biR/J9nkeB65P7oaKnbL3M8GCiwbkaKuXhtMnq76/j+KwJzNzFHLoUnJ/
	 7Zw8YcK5avNiJZhgCGzbtEvBGGCxCsE4e0OGZ8hjbyYSbwJ66nYiONM9xrzaejHTvwoAw
	 xYIjScglDCzUjbsrO0p+NsUhj5MUXNafkLb0Mq/NiDip+bQkviIpzLQNfKqLAVroqDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K5vGCoq82de48Tm6DcVbUfpg0uUXTUpd+UWgSwr4YJQ=;
	b=eHIA1MT/0k1pTV4Rnmj9lPYnKClGENZS2TMUcNH7AeF6HMKNg1a/0mW7bdzuWwegUh+W
	 OOrg+1q2XR6YSoLG4kH0o1RTB5Gc6srJqvEIYMWkrf8H81GSDTJJ6cC9ZelKOlTaLc2SZ
	 72IhFBC2Nllr6YsFBXYHtnXMPIuKzvlnNb/U3bmn/U1zP03kMTPCE/1XjTaFwsmCRBADI
	 Os+7WWa0SVYGsE8LgtusegPN2n/5F2MRXoU6vRhpOP1YGyudbjGJVMv/hBoCzR9SWAty8
	 ztB7gIkv7AQl/+j9016mhUdXxaqOQyxE7YC5aDidf6iSCOe+tYJgxg3VXaWcKQwQSRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I/iO0zOI";
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4202160A2601
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 13:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4202160A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I/iO0zOI
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b32bbd39d5so25778787b3.3
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 05:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404992; x=1795009792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5vGCoq82de48Tm6DcVbUfpg0uUXTUpd+UWgSwr4YJQ=;
        b=I/iO0zOIerfo6lYEHfZc9PzKdVvjkwDrK5qWD8I+HyZSRl4sYwazCxKSp91t2l5u+G
         JK3PXOK9NmUB99UQ669aUtml02XKpZPRI70DsdiviZEI5htu2Q9lbR+7lPnVhHEGb+Fb
         69r/VYiVtnr9fbs7XVJebGKp87HBlIbkyAfBDpm4CrGnzQqi6kV6K+7WXBrmYgLjZlBz
         u6IbbbIDIKHXIHXwL1lNnFAR6rcEod/FLCrpLnAdQycIJf012Ax33CGUUfod/7UgcXwI
         kgAWvCg9hBC0LSys1kHVHesMICHOMN7lkrhvaXQtILeQVRenEn1uJwIwas40/pCAl3G9
         2WyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404992; x=1795009792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5vGCoq82de48Tm6DcVbUfpg0uUXTUpd+UWgSwr4YJQ=;
        b=SXMfhHxaz/U2RIFIRcFL8BZHfSwmMOyHidH9qpNHXP2Lo5Bx9i3yUJ0oh2glVPWCYO
         F8EG6ASbEMCYAFdJ1rM8FprEwOu9POWxT747kRS2XU565tuh8HTlWcvftwIczttVhLSO
         vVMGof8uv+y7Iet/0Iq5x3I5JK6oVxJkg5fRjQPM8XwtHqeWNJgq8fN+wjXPbvmK71Fm
         PDMJo1b7uHoKM9FVESIpDqXl+73nv8c/dhxyZ0qq96Fskmk+V2AtY71fFSn0jDfjgpDj
         tL/hPD0ItIjxcXL3SqdxCpAoEkAo105phQZHfc2UOxzocLrw5NMChyKB4xJ5dbco93zZ
         vjNg==
X-Forwarded-Encrypted: i=1; AL+hErHMBctMZw9Fi/PD+mDluEFO4k8u7DxV0bnIVNtlKqjBvmJYbhJgYdtRPeinVsCtez72ltoNt7px2ZI2FA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9S7yANVlMte+gkIdK2B6nem+zzbsEXOOgsAMgyBuyn7RPltLO3
	0XuSOqFQhoKC4GZm6Q0jEnrP4vZGIKFFHpVAcy6cZH3ON677nwWG3p0T
X-Gm-Gg: AYBFou36q2+omTEnTm+2flyRDMLdoqTLVcudvg3gaxaQ0lTuCLw+f5kBTPcqM/5w8R7
	d3iN5ORENZBxW/KaOpWDdhXuVTarUZRw1zLijyKxua0DdwGx5nxhYpC+JhGZE2mvuCG1/wz6LJ3
	VidLh6of9QWCEgOiBhifb2wOAUfniOce+JRDpTDKT9aqx8LAPP2ypwWal9pijwrvpwJdtkKr287
	mYurFijgIwxJS48NMHipUd1Ayt7U8HHQfKIB6PLDtrufweE0wzmeMfXjQ3Xs4oqNLJOfSPBkcKq
	g7KhD8AA5FE29L4XkBqqBXLLqMz+30D9hwY0ctyu8zjvlxoDvo7AEOUEurV4zVShWRjkAA0cFFl
	oiJGZIwAfAVxWsSTzZaAbjit2nxC9hCbPoZm280usJcVYuGp6B+GSFaOyV4cSUL7owBydv2vm38
	73Q3C1d0v8z3AxiMU2z9AxCn0zVcbyj7LnM6dBRrx81la0E82ef3fsFKZFnBeqU0e5XjPpZsTPv
	lvzeulntQGQHUXWS3IpqtWKCRkICvf9adtPa23Y+vqMPVJUd7e4xkcIlKI3YD3Eb+CkJZtEecc7
	PcZefr7523E2bckuHSjgHPRMvM4V1bbbX2h2YyTVe+nBqg+pkIZE0v2R+xllmeTnHdZOk1+Do9n
	GH0Ucv030BtG7pcd9uKvwRnrsEjcbw4+MPZV0XVAWjiE/pEJMr7atynkmG2PtyupS7XYqQzMJkl
	M=
X-Received: by 2002:a05:690c:6989:b0:8b3:4deb:7cdf with SMTP id 00721157ae682-8b3a7fe512fmr20947607b3.22.1794404992067;
        Wed, 11 Nov 2026 05:49:52 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:51 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: allwinner: sun60i-a733-cubie-a7z: add the user LED
Date: Wed, 11 Nov 2026 10:49:17 -0300
Message-ID: <20261111134919.90264-4-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the green user LED on the Radxa Cubie A7Z. It is driven high
by PM2 and uses the heartbeat trigger by default.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 .../boot/dts/allwinner/sun60i-a733-cubie-a7z.dts     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
index ab3d3d70f9ff..5dee2084906c 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
@@ -4,6 +4,7 @@
 #include "sun60i-a733.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Radxa Cubie A7Z";
@@ -18,6 +19,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	reg_ps: regulator-system-power {
 		compatible = "regulator-fixed";
 		regulator-name = "ps";
-- 
2.43.0

