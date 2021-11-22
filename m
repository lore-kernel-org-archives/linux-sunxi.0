Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477C568
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 21:34:35 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id y13so82781355edd.13
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 13:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OrAz2qSS0v6VrYhP03ydDVHSa28f05qdX2rEWeofBjI=;
        b=K215rzp9LK1Ef0esI9zQ303MZmdKQYXlhmUZ3qhkr6HQEokyuckEaeZXXAGglh77E+
         +HSbHXEjTgoQbZR0ytSzjiJ7RSBkpWiBP1/RyszA33WGeDKp1s01dQxEsrjd7UJuRKQq
         H87wzMWUOhKC6NCLw7wJ+V+O8zswFn71lmofspDNOTKv9vPjRRPA6OK4DReKCh3bXZlc
         LZomnxfeHk6dQreOqFOnv2y6Zwed9qlx0h+E5AWJ1/vkq8n5Q0XIo7+IakDV0OeMN4Wo
         adKm2tDaPkDpiN+vzYe30A7fL6OC1ZdJ17IJPYumq0ye8GNzH+eUZe9qM8NSSOJFvpP1
         CUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OrAz2qSS0v6VrYhP03ydDVHSa28f05qdX2rEWeofBjI=;
        b=0Kzjc+/0sB/tCing3CEQ9KJvdsMYCkuOZDL4sv8g4jt9I1WQgTi/0qqCLS8a0Kl/qB
         sHDSdFLcqc57La7lYTjz/80yP3obKnw6LtGdNFysT95pdKLbknfHoU7OLw0p5Tsyt92U
         mwZUB1PTnF7rK6xHjqXpK/LONmVopdIS6r9cVzGxte7jH0NYQk8wGxsqD/D3344wSerP
         vJ3rkCgKCZDA9Coq1TMd2GxSJM/2092SzU1w+9Qextm/GFCDHS3YhWaeQssEGmWO89bB
         z1+qxYDiAq2yMTaXftFzM79cCA8K1GPsdDMukhXcxacWeot12mW7/pYsHr6v/40Rz9W0
         3C3A==
X-Gm-Message-State: AOAM533xWVyiaFt006YHo2PoF0KdRSdemrjtY8HP9+YLP7/GXpVHh0h2
	+Y6ftWHkbvmG8OBMSf57tHE=
X-Google-Smtp-Source: ABdhPJxRWrON1ypXU/5yf9g86BJvKtRrnf7u4KiFdwfv1C8JCjCkSNxtCIqYr3QPXJ7pZzJQUdiEWA==
X-Received: by 2002:a05:6402:280b:: with SMTP id h11mr264474ede.341.1637616873667;
        Mon, 22 Nov 2021 13:34:33 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id hq9sm4482933ejc.119.2021.11.22.13.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 13:34:33 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: h6: Add Hantro G2 node
Date: Mon, 22 Nov 2021 22:34:29 +0100
Message-Id: <20211122213429.921919-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

H6 SoC has a second VPU, dedicated to VP9 decoding. It's a slightly
older design, though.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 4c4547f7d0c7..878061e75098 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -153,6 +153,15 @@ mixer0_out_tcon_top_mixer0: endpoint {
 			};
 		};
 
+		video-codec-g2@1c00000 {
+			compatible = "allwinner,sun50i-h6-vpu-g2";
+			reg = <0x01c00000 0x1000>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_VP9>, <&ccu CLK_VP9>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_VP9>;
+		};
+
 		video-codec@1c0e000 {
 			compatible = "allwinner,sun50i-h6-video-engine";
 			reg = <0x01c0e000 0x2000>;
-- 
2.34.0

