Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFF78F55
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 09:24:20 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50078e52537so3623587e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 02:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692696259; x=1693301059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zI3MgR1LXRyYEK7UHlSxA4reZwr5ug/du2XE/mti7jk=;
        b=khyvXxUFO523zkQYiAnT5nDsilCeLi/EH+bHe8RZfETTspSimNLq6iWbWx5M/HgIfR
         WhiNsCK7mRAOXC5B+82L3JLSP+XCLo4NLN2e+QbEhvep3hcn7cUnS1j3c+Q/Q9w20J7o
         GrBajaauq4sMPZG7y3WRXg5x4d+HwMJXOuaHjQ/2ceGRVJRpj5gHLPif9cfyaGHDgKot
         ZrqqQ2d3YwPhZsL+4cLmB9hGFvShDPhrGbrw2YD2wiqd1W+jOtzhtWic4ZZ82OuChvxd
         v7kn+AGL9gNXcvAMuimRiUU1J3DShIAHJBK5KsNv2KQ8ggIE5DK8VNZLRwkyp7734waW
         8REQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692696259; x=1693301059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zI3MgR1LXRyYEK7UHlSxA4reZwr5ug/du2XE/mti7jk=;
        b=NUBhtEZeuHvsa+ywXoWbE8O9C7kkUO+EKmZQOKZwsI+u+5vHKN9j7Gacc50IbjtAHh
         HgDFDGSTJi1tXR4OAnU3vnxGXV/sAUkj4yogY56kL6KzIx+L6+bJ4uo0iuRxuiDZDPSk
         YMTCBr3vAXUkF4hqzT6+zBUAHCe2ur/T8uK4fCKtgMIcqQ2U9v5Pj2i3bt7BOeHqm1VU
         XIYBysfWAnsESFJBrt9gE0mbuPcgneLI+3VmgIeteOgmy7eo7gQA9sjZTBdkb9cpOJuh
         9j/USXXEmGyqpvmEFDI0sKNOO4MuAYXf3Yu6bOmuVgclrbpqhT5WIFldvcPhp6Nl/kmT
         /OiA==
X-Gm-Message-State: AOJu0Yx/FHL2uu+1IwyKf9wP0H+fAcpefwAA0FPod1P1YfhXS2G9PIzp
	fxH6YPNdm62fJn4nJGSNVEk=
X-Google-Smtp-Source: AGHT+IFgl1be/hZeWP4yJbdiroqhm01VYXbNSKEn50xeY1C5Tc/vVDIi451lfLVqFug/63K3oboHSA==
X-Received: by 2002:a05:6512:2029:b0:4fb:740a:81ae with SMTP id s9-20020a056512202900b004fb740a81aemr5613049lfs.16.1692696258484;
        Tue, 22 Aug 2023 02:24:18 -0700 (PDT)
Received: from localhost.localdomain ([2a05:3580:f312:6c00:826c:ae47:61a7:8af8])
        by smtp.gmail.com with ESMTPSA id j5-20020ac253a5000000b005007c6ea158sm1109372lfh.254.2023.08.22.02.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 02:24:17 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kees Cook <keescook@chromium.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Jarrah Gosbell <kernel@undef.tools>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>,
	Pavel Machek <pavel@ucw.cz>
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v2] arm64: dts: pinephone: Add pstore support for PinePhone A64
Date: Tue, 22 Aug 2023 12:23:58 +0300
Message-Id: <20230822092358.309835-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230821160817.GA2227@bug>
References: <20230821160817.GA2227@bug>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch reserves some memory in the DTS and sets up a
pstore device tree node to enable pstore support.

In general any DRAM address, that isn't overwritten during a boot is
suitable for pstore.

Range from 0x40000000 - 0x50000000 is heavily used by u-boot for
internal use and to load kernel, fdt, fdto, scripts, pxefile and ramdisk
later in the boot process. Ramdisk start address is 0x4FF00000,
initramfs for kernel with some hacking features and debug info enabled
can take more than 100Mb and final address will be around 0x58000000.
Address 0x61000000 will most likely not overlap with that.

Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
---

Changes in v2:
 - Update commit description with information about why this base address is used.

 .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 87847116ab6d..84f9410b0b70 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -19,6 +19,22 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		pstore_mem: ramoops@61000000 {
+			compatible = "ramoops";
+			reg = <0x61000000 0x100000>;
+			record-size = <0x20000>;
+			console-size = <0x20000>;
+			ftrace-size = <0x20000>;
+			pmsg-size = <0x20000>;
+			ecc-size = <16>;
+		};
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;
-- 
2.40.1

