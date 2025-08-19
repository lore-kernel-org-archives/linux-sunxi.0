Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58E73375DD
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 13:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609480; cv=none; b=Hs1VUQL/C0W33Dnd4+VyhijElO+p3QBR/sL9830YXWkUIrzWN22wX2YJHrQzr4vEw8E6E38pAvxtfWxnP+WYrQ423zZMSUGnkPhcPssk1rwUv/yI31XC3YnfJcj1aL/lDHfSqBQaR0e2yJV//HQXfUzxX/eNgCM4/G2U27LL6Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609480; c=relaxed/simple;
	bh=a/1Am43qkovn1U45ePWY9QossHBqqTSsbI0vixo31/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=APhMA7qD2gmZOB93cTKM/vh0xLXiuhu4HpncZmMddA8GSUaIUqxcVr3p3N7Z9luQT62CYdC6HxURngMxStrr6Yxt+8YXSo6fD2xqQBIzis36OIEOuj3GT8JwsNz/l2pCgUkfAgdbiEpvjnKh9vtiSwD6syiemC4F1mWxnk2iM1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcFmYlLU; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcFmYlLU"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61a20bd7a72so214887a12.2
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609476; x=1756214276; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dwxhOWr2tfFUazQ0vTmv0AWEueIJvOP+MVDAxepHzKE=;
        b=pcFmYlLUdaYhRa7nANQc9Zzy3eahrjC4VlErc0eS4I1pG8ZJBq7940g/BRmBLliD4l
         xbsr8Pnh3nHWSOTmMctiWSQeYhQ8q25MfPn71k+aWy0v1jU8CxW0EkPQoFcNCWC5ePKW
         LcJsJiIpCDEtAYcEECk0TxhO1vNgruagAyVzhJ+ZiV78wJR+oiiDGgnYHk4WtEuPKfP0
         xzv/KKtLxC3VVxvvd6UnkRew86CPDPqgn+UvpoCq9IR+N+WeP5/Ak0YCgCcT4IiUgH9R
         yriSXxFohIAeZ0jL05MBo5Kne3B1uqRBKc0LbNCRxCxwaEVCQa0U6o0jZsZ50XB9ZyaQ
         a7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609476; x=1756214276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwxhOWr2tfFUazQ0vTmv0AWEueIJvOP+MVDAxepHzKE=;
        b=vnQzn7ItpXEP0t1zm9S3HiQm4UN5LLiFUnrg7FlYoBTlMkOjHpwhclbKKqVQqUjguP
         M0Qr3DtYtFnhdDSr9Y0AtcT3r6DdFM31ieYLxJMu3fQAqSlvk5teE8QDoPWruzvBPINi
         hzgXwQ/IxDSAtK+Ls+Qutb2pgQGSXRlbu3gfwdGuJza1/kbYXIEBnTvKPHEceJeJSnsh
         82XXiql/5ZhGd/SCZPkWiYwgKBsRVgOYEIP5QkhrPZZsil/M/kYHH+jdE2oUMwGqXMZs
         8aa4FVYP/GimKtbTRlzDq9/26V2TQMgxxecok6wnaytlNhDwbDbxwIcIOhgZDoBhM3L4
         hnbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTzYKYkjRHFAIMXzxG3I1pSWtqZEpOBQbQnRnkqLtv6XdG4JqXV4oSlImVAMKrMGta57puLZRdJObjdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyY9PCpof+LUVjw9SvKHTvVX8HVDzBgVom4ymJRBhxmYosE77He
	VVqFRtFsH/lLfboBfK9I/F0kMqRpHIItuBp/bROQt3flPM6FbLOyXSLXXG5vHIjN3+Q=
X-Gm-Gg: ASbGnctBZe70kzBQOzEE/3qzAmlemKwdRj372GI48m7hEkQmpyfW50UKjM3pt5xbayh
	UIkKo1Ies60cS3dOvdbb+Sjge6atWK3nJOoi/UUASimtlDaJ0y/8S43ZXQPUO2t9BVrnh/yFx6L
	2SZA9SWX19iSyRqqKAZAu4dDINpWOsVMJ768l8PR4/4IE8b9j7kDTaQiwdYguAoALNXaJ9s+DOs
	wGIOf6kM3CP6dVI/4VuVAQQvH8V3XoqkBGrsl/4Zjo7leiNkUA0uKMv3I4hVlrTQwbo2S/nG5Dt
	phVFuVYykMw7L+yvbqmGv20HzUPrQgFsyfQHaXTfzuXdnQ4fZqw3WrYtiBKKnrRXs36ndBR7fRJ
	8bCinA5r0hRwRqS1eFtZelBkt3R8XexHyrw==
X-Google-Smtp-Source: AGHT+IHADlenz3AdOd7FQc1EL+ISVUt3VbFHxgCFL2F4EgiCqro4WqqKqiPXtAlrEaDVo3hCIju+Ug==
X-Received: by 2002:a05:6402:40c4:b0:618:1835:faa7 with SMTP id 4fb4d7f45d1cf-61a7e6b6437mr995125a12.2.1755609476324;
        Tue, 19 Aug 2025 06:17:56 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a755d9b37sm1734573a12.7.2025.08.19.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: allwinner: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:17:53 +0200
Message-ID: <20250819131752.86948-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=a/1Am43qkovn1U45ePWY9QossHBqqTSsbI0vixo31/s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHmBLoUxXgl+pLIifvNbA+bzGXESv/qvlnAnv
 KJqtnvJQFKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5gQAKCRDBN2bmhouD
 1408D/4+3v8iYk/kQH1Z+B8Kr9TVDiNW9AGM6dhlicodidDswX6yq4R7L3uHYrTgy6D9DYOMEdu
 fFOh3dMyd4r+ifvr0b7k6sCPRUD+Kcgx43HD0zpp0/SJCRxXx9qT5shxaF3D15gMO/NB2RreH8D
 MFPf2qMJRBhEiHqWjay7Q1UPC6iP3f2YhAA7i8TuunoQDknp1UrqhB1ZHjzVqo6qJQe9NEnTYjc
 E7PXWUP3ywhYvv1NqwdtWz8TS9YOHB+AhBXSv0+ss1C2rOH0dpUWJEamidIoHUrRJFxpIP1+S9e
 fLWuqLHf9njYf3FVpy6IdqLSwOq00wcEoupYtSO7FVPyX7+2CxJSh5GEIYd2DZitCEVV/PNGP+3
 VlkjHdcEl7cYowWa+kPhfuJfuZfFTK+pjtVKWsDyIrm4cAUNA+l9lMIeQ+CgMsNV2yoeinUgo/6
 v4Dgn6rCndS8yLKXhFrbSqYuFQrDI2RW/haQ21PbbCRLhWq4t22xuMMv4CfeQsBU3GzOBWMdfsI
 nVzMZXfXDWj3aI5cNj0YC6I0EqwsbDFPKC2mrgEII6wGpa5fUY1sC8PUx4FaMHf+aef60jx6tq2
 0KYUU11eJ+K4hwElrfDLLI9wWWeI9IEm/9lkARv/liujs+x6PMt/iI0P3mYXiBFPwAe+k332Rt7 Cjv/D/Z9mQ6ZYeg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space around '=' or '{'
characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts  | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi          | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi                | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
index 83d283cf6633..d425d9ee83db 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
@@ -218,7 +218,7 @@ &usb_otg {
 &usbphy {
 	usb0_id_det-gpios = <&pio 7 4 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH4 */
 	usb0_vbus_det-gpios = <&pio 7 5 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PH5 */
-	usb0_vbus-supply   = <&reg_usb0_vbus>;
+	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi b/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi
index 272584881bb2..a0f787581dd9 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-q8-common.dtsi
@@ -82,7 +82,7 @@ &de {
 };
 
 &ehci0 {
-	status  = "okay";
+	status = "okay";
 };
 
 &mmc1 {
diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
index fa162f7fa9f0..f0ed802a9d08 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
@@ -705,7 +705,7 @@ uart2_pi_pins: uart2-pi-pins {
 			};
 
 			/omit-if-no-ref/
-			uart2_rts_cts_pi_pins: uart2-rts-cts-pi-pins{
+			uart2_rts_cts_pi_pins: uart2-rts-cts-pi-pins {
 				pins = "PI16", "PI17";
 				function = "uart2";
 			};
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
index 5143cb4e7b78..cb6292319f39 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
@@ -29,7 +29,7 @@ chosen {
 	clk_can0: clock-can0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency  = <40000000>;
+		clock-frequency = <40000000>;
 	};
 
 	gpio-keys {
-- 
2.48.1

