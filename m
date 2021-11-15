Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B5572
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Nov 2021 20:11:16 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id u1so33004117wru.13
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Nov 2021 12:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVufiMS+5ME6/qbmdZ9jFuP6rhzYyALe6R8u1xIQ+I8=;
        b=WxqUWqw9dcjW58RqrOawZJX8dFHGcFnqlOdeYJiHKEfL/w8CcJBKNfS5hs/bRlROkS
         DdCUsECLDA5V6QkypM6B5Wo2JFC8uqqpwXHvO2vr3PQkfLPcgvgG/dpAAkznKWl65CTh
         JG8S6Ii+uYuNCuRUEOU6lh36LitBTBiHXD5BNIp+F0gEkasoxvJUMDb6aPfs+pDeq7Ub
         tZ0U5WoZ06rEso3K4WPUoqi6IghSkiNAwMkIo5Gl1C2caO+WA5TvDvQjV7Npuwe7GsZ/
         X4VpmqIT0/BJDzxJ+kavTAjlQx/27rs4f6/LGwf4soEWmIW4B6jXLoAqzFHR0c6SDKn9
         0Sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVufiMS+5ME6/qbmdZ9jFuP6rhzYyALe6R8u1xIQ+I8=;
        b=ow/rO+HYfUG9wxMvNqXhm5Rae86vmEHoJMdK1qi875SKmnbk5A1OuMAeoYwqj6yL+B
         Tcuu/t5tfgxPeRVsb+teUwqj+YGTm/WF2nLNw9zE8a9gwzfS/iDms1wyhfiXI8JOm4tf
         UqnPVEnHwAniwTx4vBLZS4Db7WM5vyPlfJOqI0SquSfPzCYH1lpDMpJgLirQYrCSWZy7
         +ulatPXd7L2PlHCt+biTg7rNVSJACqfNx/lP85uJc6S5ud7911kETsm52lCumd8DneRm
         C6z9Wfa1wt9SHRmyCuYL+1Lvc3/TwM4RLAVZ+sEjSJr6ySvRJ1lT4WPCAWnt8CL1PmHc
         wKkw==
X-Gm-Message-State: AOAM532VvchkyyhtuR3bhM68GGccEAIsjDdwNppnCNFKo62DvLOFogUG
	veBP6YxItQnsKtktaA5A5Qc=
X-Google-Smtp-Source: ABdhPJxRaydlPIgKCNnFlVSM/bdOi7Fbn48Le9KlaQLD2hWe6B5eTE0Fonu5liBo3qPVFLkEO0xmbA==
X-Received: by 2002:adf:e484:: with SMTP id i4mr2123541wrm.49.1637007075508;
        Mon, 15 Nov 2021 12:11:15 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id q4sm15529370wrs.56.2021.11.15.12.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 12:11:15 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: h6: tanix-tx6: Add SPDIF
Date: Mon, 15 Nov 2021 21:11:12 +0100
Message-Id: <20211115201112.452696-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tanix TX6 board has SPDIF connector in form of 3.5 mm jack.

Add support for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../dts/allwinner/sun50i-h6-tanix-tx6.dts     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
index 8f2a80f128de..6c10ff7f4b1c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
@@ -52,6 +52,24 @@ reg_vdd_cpu_gpu: regulator-vdd-cpu-gpu {
 		regulator-min-microvolt = <1135000>;
 		regulator-max-microvolt = <1135000>;
 	};
+
+	sound-spdif {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "sun50i-h6-spdif";
+
+		simple-audio-card,cpu {
+			sound-dai = <&spdif>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_out>;
+		};
+	};
+
+	spdif_out: spdif-out {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+	};
 };
 
 &cpu0 {
@@ -127,6 +145,10 @@ &r_ir {
 	status = "okay";
 };
 
+&spdif {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
-- 
2.33.1

