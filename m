Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3D472
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Nov 2021 14:13:00 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id c32so26771611lfv.4
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Nov 2021 06:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ZLSBMSvQ7dJDOk6e1Mx89OYCP5iH5hZWG5YrIJUvVs=;
        b=Q0jp+Xq/7805elOfY/7qi9pN8dkRYSzSNlvQekc4sAQLG6S32Fai3oQMAbRYi/S+Ze
         Q4irm3DLIfCxh69p1knnhKOxMl6UHPUACEsXD73Lz9/HsU+/bRLd2s0K98x7q/LYbfH/
         hX4gmXI1ObqPwFrQ8Eb7EMubNqMg8ugfEEv2yvFOh6TvKbVzrakFwxDgA4IsEFBx6I79
         HhBy4slxLJJNH8RFXThN5cJknqEfbGGQYO2m8/JyJTl7Imz3Ib7LpYV9zZR7ISsTMd5q
         lRTk9+CE+uLnFflVHwcT3r44epUk+fugM25p/fmySOTLScUYwvhijzR50jL1Q1Fh93Se
         xYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ZLSBMSvQ7dJDOk6e1Mx89OYCP5iH5hZWG5YrIJUvVs=;
        b=01jlf0Yp8WryugM15lt0+LwGtoqHCVRWkqtzFZYL+nspqhP6g3OuQhGf0611t2Qu/X
         uMpYkR1JA5Je6aECthfyHmBKM1WuIa4SQ0QxB4QFcTZjCwWtr+Yw9Og6YlrxcAt0Smg9
         s5YIkANwjWeWSDo1DKxrB0sShzB7iqFfM0dbGH4JoPQijrHXHiz5LGWhjJ8UqrB3upmB
         oUq8ScyJMak0OIF8ohTM/mKToUipJaxJoPtM2hY6KnxJaAsHYcOl+AXqz+PBnIDC+AhF
         n+yHYhAOnPptRdRq7lpHyTIAiFDN1TaIu97/0b3MSv/hYg0d0MvquBxHhkj2DXDSBRoj
         MyGA==
X-Gm-Message-State: AOAM53104LjFPMXGtkeIBzz6GB3qzj2bKUO5TwF0GZJW6KCenRYqNuCT
	6msHTU8OhP0qGgWUfV+qsFsyjQ==
X-Google-Smtp-Source: ABdhPJz9vlEmw1/O2Nr3qDyeD0f0a4jF0ReUmezuDcpfWjpAwwTkluE4z+LBsrs2jyZizP5IC6lO+g==
X-Received: by 2002:a05:6512:3403:: with SMTP id i3mr25675413lfr.413.1637244778901;
        Thu, 18 Nov 2021 06:12:58 -0800 (PST)
Received: from boger-laptop.lan (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.gmail.com with ESMTPSA id s15sm193634lfp.252.2021.11.18.06.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 06:12:58 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: linux-iio@vger.kernel.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Quentin Schulz <foss@0leil.net>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] dt-bindings: iio: adc: document TS voltage in AXP PMICs
Date: Thu, 18 Nov 2021 17:12:33 +0300
Message-Id: <20211118141233.247907-3-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118141233.247907-1-boger@wirenboard.com>
References: <20211118141233.247907-1-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most AXPxxx-based reference designs place a 10k NTC thermistor on a
TS pin. axp20x IIO driver now report the voltage of this pin via
additional IIO channel. Add new "ts_v" channel to the channel description.

Signed-off-by: Evgeny Boger <boger@wirenboard.com>
---
 .../devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml b/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
index e759a5da708d..d6d3d8590171 100644
--- a/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
@@ -27,6 +27,7 @@ description: |
    8 | batt_v
    9 | batt_chrg_i
   10 | batt_dischrg_i
+  11 | ts_v
 
   AXP22x
   ------
@@ -34,6 +35,7 @@ description: |
    1 | batt_v
    2 | batt_chrg_i
    3 | batt_dischrg_i
+   4 | ts_v
 
   AXP813
   ------
@@ -42,6 +44,7 @@ description: |
    2 | batt_v
    3 | batt_chrg_i
    4 | batt_dischrg_i
+   5 | ts_v
 
 
 properties:
-- 
2.25.1

