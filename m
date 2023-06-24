Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E3A1384
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Jun 2023 13:17:17 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fa70ec8d17so25068305e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jun 2023 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687612636; x=1690204636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAYPGxSTFPjM3RqhwW9I/u0fjI7Fx45EUbdLcf3Fbbk=;
        b=RTqZRv+kicZW7QzVJK3ZagJlTPPID3erCQjK8DbAaVPTMWw3b0mjuGV5SQVg3A7Hfp
         kTP3MO1AV9lx1/fyLW3WpWXj4HmKkLq3zsShiKr+AZkRpIUvDHPemFoM8d6lYuJBkhVf
         VwXLSS0PvzKxnzoIXhwxmKBAloifepGmC78ZDgEmk5MbVTY+UmUcnQs8jnP7jUKTgQ1t
         ovA2xPB5nkCELrRww6By/LY2lIhiGufo89h+gKofzrfcx/6CnBLsCo++cVmYMzLAiVW3
         P2v56HjmRyol/JePLMkvownV0cd+4jPAN3a3PkXbpyjqgTMgtriUwWMRfhDtyahMiisK
         i7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687612636; x=1690204636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAYPGxSTFPjM3RqhwW9I/u0fjI7Fx45EUbdLcf3Fbbk=;
        b=UGaNGv26oLsUmSffB7HI96lrco25F5nm9xxVJ1mkCHjwzB1sX5RFiWa1AHKNDxHGab
         y+rSLb6/iVH7Q8zlaNnxkAE/1zP98TVaZQxBCHAcU3T02Y32KH2PZsPIUsm31YtyqDtx
         I3yQtpHQuhZLFX3HEE2Jf6E8U+Za5iYNJE84OhSpR9goxYW/uHFf/SNHcyYGRyhFZ98Y
         aZ3SaKQd7lgQZnB+o1zrPj7j6szGDl+lzRA4Ze69Eu1D5R0tEjG4kzRphpd4uJaPMTEK
         REdJOlJxV6T6dY+J+pOhSx3SMBwoAnzZfn5evhppJkBoMI3uOj3TfKiGmk7TJbRwJCnq
         rjkw==
X-Gm-Message-State: AC+VfDw+Gr0Y1B/thTb4pInVDILvsHFBNZB7AqFrH4p5i2HV6ILHDvF3
	ZCGNurJJUlKdOo4OMM86O/TnEoSSuUK2qwIG
X-Google-Smtp-Source: ACHHUZ6AxRD4qR+dRoN7S7SE01tpvdTdIi7AeyJugnitjFY045wLn75ojjvOMv78elsfe85Qmldkag==
X-Received: by 2002:a05:600c:245:b0:3fa:838d:adbd with SMTP id 5-20020a05600c024500b003fa838dadbdmr1749644wmj.1.1687612635438;
        Sat, 24 Jun 2023 06:17:15 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id l1-20020a1ced01000000b003f9b0830107sm5107428wmh.41.2023.06.24.06.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 06:17:15 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] riscv: dts: allwinner: d1: Add QSPI pins node for pinmux PC port
Date: Sat, 24 Jun 2023 16:16:24 +0300
Message-Id: <20230624131632.2972546-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230624131632.2972546-1-bigunclemax@gmail.com>
References: <20230624131632.2972546-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pinmux node that describes pins on PC port which required for
QSPI mode.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 1bb1e5cae602..9f754dd03d85 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -131,6 +131,13 @@ uart3_pb_pins: uart3-pb-pins {
 				pins = "PB6", "PB7";
 				function = "uart3";
 			};
+
+			/omit-if-no-ref/
+			qspi0_pc_pins: qspi0-pc-pins {
+				pins = "PC2", "PC3", "PC4", "PC5", "PC6",
+				       "PC7";
+				function = "spi0";
+			};
 		};
 
 		ccu: clock-controller@2001000 {
-- 
2.39.2

