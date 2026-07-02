Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EF541C312
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 08:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979851; cv=none; b=eomWt9EtxTkI9zujmpj3fVYyrDJCg+61kv0B8ehWDsKpS3M9sQfqKp9NUpPiaBrOfueBuqBP9QX/TlLrSEz3c/QVJ59iEesUoUiAkwQIKeV13v8mhsjj58LFdYURTPgEa9fOSE8aAhW+/f2vEt0fuI8Nq7UYoCEeB4YjL9usixE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979851; c=relaxed/simple;
	bh=CzBUXV7sOVhx3D4ZGCj9tufXm0ii5Jrd89A5CtNYTv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSztvqWc3aHaPLdCP5jkyVhlAavWPtFe4Jic5Fw+kKRrwbmorXSJ4UhKYKXsWWTTvwAF1oTjjIbS2+HlvgmzlqTumCbxhz/ICEYGB9Fh1zGHrqwr2nwGYZbCwqVHjjYmW8G3Sm81EuDdMqdeOJtAQYZtls9ruxtnc5BhRgvP6m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HBCS/bOc; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HBCS/bOc"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-472326ca506so1101489f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 01:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979848; x=1783584648; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOiiEpGpIC5lxOzEa7sAsZH1/Y83nzXYTBPvtikqmXw=;
        b=HBCS/bOcxv+AgSV8SfBQxE405n2Hip3mqG1N/0hyUNA558HOP+7UV8sNgP6+3Rq5Ki
         XnRuFZ/6osj+Ru4BwFyI3FCQQlhxTbw4YztLXKu7VRJ0l4k8krJWzO0GzPogbVRpRoHJ
         YKGrwuVh+Q4TBeekePkRgIeaRRohfPWrznWjO+5/ZA0/xHD+6jvnFp8QOUAv2pFUpz/p
         0u8uqVFIPb59yfUbQGVvDy47z6H0+iwbs+Ukyj0GNDTIU1TdDcwXi3ZjbbqpI4bMWDKM
         9sWJddZTvbOmBRZhmsj4i+/k/J2CpZTn4YulLACVEGbw1ADxiUAx0c3JIrQbN3rwA7Wg
         zNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979848; x=1783584648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XOiiEpGpIC5lxOzEa7sAsZH1/Y83nzXYTBPvtikqmXw=;
        b=PT3gNR/ULxpI0rnckuYdNwzeIm9DqRqYETQAcpppOgtKlXtORtA5CB1Z9ieiue6D2M
         t8gMBBN0Rm5nHUxJnUh9mQrQfEkZ8OtYn0XfhmHgmCOxkK73rCYGmOltxgLKc2glqSPY
         tISHAPLbgGXRqTlEfg/KL9OWA1+6jg+IVm/VtOujqXSTgPSoWoKCUpxsz2mlXBHOajVZ
         zfoMHk5ho8U5RswaEvOGUB7ZNrCMaDQQh1Kvi1rN5Xctniu1JgV6N8jnO2RKH1d070qI
         q/hw8jEyoUuylvF1tEWabIz18L4WtNXFFa0/j3vapX235wZZ1EF3hirLWloBJKGMVXyG
         51bg==
X-Forwarded-Encrypted: i=1; AHgh+RpaEvcrnfuEA1uoOymcLkuDE4/VZvsSjIi/QVyNK7TGibI/+dHPnjN0TPDzVGe19U1GuFF7GOf1xic4jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyG7BpVHibgLNPgKs24QYRE9IoBDKhIwDCTaQp2+jd7TNxrFkHM
	QvbU038gvYsBjow5uaBFpxlQ+1KrxlthTB0dYCqpJmYdjeI+sVOXbOkrHaORvSmaZ5A=
X-Gm-Gg: AfdE7ckSbhe+T1EcqNuzceMLSRh5bXG06FCIQrphmlzMnYhHeIn1H60WY/4kRKwkE+R
	Jcpdy/Gjm++AKrqDd/Bae0UwTNtG5P9pgKTVkrpKM2huDiROy9PXQpgvdg5p2V2PpNRG1DDKdvc
	/yF9gSF8LSLkReG6HRDwni8ho3dVpEhaSa1JuIbmb9PJJOaB+ObwOsSHgYBPenEnHRUhK36pn27
	AnAiIfFSVibKU1F93hF34E6qovFTYKe3cMCTUzNcfIrxK2tGLrcRmiunsO27Lw8I4qmEmpkqB6W
	Yq2enVXp/ByY9cUEix10Z/MlOzY93BiI2Afb9LNERvTfuQrFRE9V31LIjZuGO8le3O0SprPz8C5
	R7Xlr1n6P0ro4JjooqIm5MtAXX4zyxPLlfZP+H14cqCVRdzAFfjrI1xyKv7sYBQqZzC5pngEYRZ
	1Cbt8g5SnDM50=
X-Received: by 2002:a05:6000:18a4:b0:465:ba53:a006 with SMTP id ffacd0b85a97d-477588e7d03mr7472094f8f.23.1782979847883;
        Thu, 02 Jul 2026 01:10:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477dd94c829sm6374826f8f.24.2026.07.02.01.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:01 +0200
Subject: [PATCH v3 2/8] dt-bindings: rtc: sun6i: add sun60i-a733 support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-2-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=CzBUXV7sOVhx3D4ZGCj9tufXm0ii5Jrd89A5CtNYTv4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz3c3Z+CDWtJbpQmgihyGCywyiqoUE3JkQyt
 6xSTIHXDA6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc9wAKCRDm/A8cN/La
 hev+D/9qqaYp4+SX4EN+QRwhZL9SKx/Rjuxo5TLCmPxSfNWP/r82A0hPjW8lkiXBaHr0JFpStVl
 jzHLZcQ93NroFjk9JyixfEnW2GKdPE/DADdhVBQBRnB8rwQxJHJWFuWFL6JrbU1MW9Wj48laRaa
 6cmou7Koc4vN+e9OClHXcB+Nw8NQ1okWbDUzwmbsZfMypkIyQnIPsvc/HX4u5tsUDCfVbU3x8+n
 iyPB2URXAHkgLi2muc2ZWr2FTnuSYE7rFOjsax5ymg7+CQzHWLED0nz8JFxqd2BaraF+Qeg95T/
 +fCm1g8Rjb4/vkW63foqIcmbd4PdtFdq5SPpcG5jWN8PXRcU+PrZ3gng3z2/Yl9+lSZtxJHplnG
 rM7K78UOnSYxqV0XZb75pVHjQSkgFC1JNOk+XtV3dTi1Oc7o21Twp4ct6qLAeJ5vV+WWYivLCPR
 t9TGq2qozq7pQPVtqppeCAXrgwi3U4O2bWOu3CYOv3ZJrVvXScRmFujVs8Gr5p1N5y4w2Rf9p/a
 3PKVMaOyiM1tf8rUsiCGqyl8HffUlRS/Ih34/QYfrutYr/EJfx7lTzxu6Guntcq93hoEVXn7vsy
 I69t0vQV7mb0t2d+pLhEXvDPk+OaCQ2lD2nOrPz0aMGgCg8r/ez2P+dYIfEpxKh5fqfbk1zpoqw
 3YvXKzSzMXDUKZQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
peripheral oscillator clock gates of this SoC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
 include/dt-bindings/clock/sun6i-rtc.h                              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 959a012c626f..f2b91186ed37 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-rtc
               - allwinner,sun55i-a523-rtc
+              - allwinner,sun60i-a733-rtc
           - const: allwinner,sun50i-r329-rtc
 
   reg:
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
index 3bd3aa3d57ce..5132a393ca4b 100644
--- a/include/dt-bindings/clock/sun6i-rtc.h
+++ b/include/dt-bindings/clock/sun6i-rtc.h
@@ -6,5 +6,9 @@
 #define CLK_OSC32K		0
 #define CLK_OSC32K_FANOUT	1
 #define CLK_IOSC		2
+#define CLK_HOSC_UFS		8
+#define CLK_HOSC_HDMI		9
+#define CLK_HOSC_SERDES0	10
+#define CLK_HOSC_SERDES1	11
 
 #endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */

-- 
2.47.3

