Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4453572
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 16:12:30 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id d2so6570794wrn.0
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EWKGcG6m6lpD17jpJUGcdHL4XL/5in5ssmRd0zz5CFE=;
        b=D58azlBHvUTHh5+YVEm0omEPcm5TD69+lMvlCBC6+UPA3F+6dzMJg/abiAis9uYZHl
         HYbmKzowOvp6vJg4N3tW5La48sg75MPqoapKojtq7vWTwU5Bssb/bIANtb6yL+G5c2h+
         eAGLxGvd1jx9UgCzJJcLhOEQwWfMKvT1dqOJdlJfEg8ANLLfdG8vssDOjxrbCluWxqTp
         jRcJPERzE96h2MBnidTBDHkCqlEquWG9BtswC5Q5ZzOzckYK7Hr0RtJRtB96ur528/eK
         P5m8urcxsUNIRj7bK+4CH8Tivmv9BwUP3ToW+/zXBhXC14OFBEgXXbTDKlHVjxJs2fx9
         sugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EWKGcG6m6lpD17jpJUGcdHL4XL/5in5ssmRd0zz5CFE=;
        b=JRLQbZvj/V9Jdw8xpG46wMT36iUT2lRyjFsqG2w1NTf0EDTM9PqnjCau71pUUtwVmJ
         X0IG2cW+P/DYsgjn5j395fNQrznPFM4Rs+y5CcaJhXCUokp5f081ezHlDp9837rsoMH/
         Iz6JpE6ilBg0xOQWgGUFuTTrY117WjG4VEEBJExQwR9L37RSLKp4rDbs1PYjrT7x4hT4
         4hiKhQMaz13/z6xoVlQb/C4zIIj2+ehCTYcRY3gEwqMj0XxWKlamxUW59pVIU1gxJAXv
         kZjg+eWTPIN+ROXm3ZV5MPvfVJiss9YZsEkHYNsNK3uA72utSZ6sBw0AYwxmxNGR0S+y
         PKnA==
X-Gm-Message-State: AOAM530w04jIRzvJDkE22tDjZPRFWYQTwwVhzYJfjuqH+XwMHFlpeNu3
	A1j3M5dSB8UNiOqsWWdXr9w=
X-Google-Smtp-Source: ABdhPJxUkC7snrfFoWJTIHUcEUZVF3GCGzEDjFLhbaUilEODb4AeyqfTHX+NGVUjkq/Mj3E8jGAuKg==
X-Received: by 2002:a05:6000:1043:: with SMTP id c3mr740928wrx.13.1626970348708;
        Thu, 22 Jul 2021 09:12:28 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id z6sm3585363wmp.1.2021.07.22.09.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 09:12:28 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	jernej.skrabec@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: allwinner: h6: tanix-tx6: Add PIO power supplies
Date: Thu, 22 Jul 2021 18:12:19 +0200
Message-Id: <20210722161220.51181-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210722161220.51181-1-jernej.skrabec@gmail.com>
References: <20210722161220.51181-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While there is no publicly available schematic of this board, it's not
hard to determine voltage of GPIO port C, D and G (only ones which can
be set).

Port C and G are used for MMC/SDIO communication, so they use 1.8 V
power supply. It's not clear if port D is even used, but if it is, it's
pretty safe to assume it uses 3.3 V power supply. Value read from PIO
Group Withstand Voltage Mode Select register from within pre-installed
Android agrees with that assesment.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h6-tanix-tx6.dts      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
index 02641191682e..cf9721ca6370 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
@@ -32,6 +32,13 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	reg_vcc1v8: regulator-vcc1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
 	reg_vcc3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3";
@@ -99,6 +106,12 @@ &ohci3 {
 	status = "okay";
 };
 
+&pio {
+	vcc-pc-supply = <&reg_vcc1v8>;
+	vcc-pd-supply = <&reg_vcc3v3>;
+	vcc-pg-supply = <&reg_vcc1v8>;
+};
+
 &r_ir {
 	linux,rc-map-name = "rc-tanix-tx5max";
 	status = "okay";
-- 
2.32.0

