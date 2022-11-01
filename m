Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300B07C
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Nov 2022 12:32:24 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z14so19885286wrn.7
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Nov 2022 05:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg/tq8mc0td21VxYxjkcP/FxMATVdKN1/vdE4yipxA4=;
        b=HxeTSKDytWdqrppMzJdUt6sgSoPymV2VPF26TP9Fb6CbFx1c6fwS+7sIjbaXRiElTF
         z8xNpSFX/UhK5KGmYuGfrE46MteZvRiB8x0x1XQEuJCDOvNVnSwXofX3WT5jLpnoaVSQ
         0e4N1cTpNSVfW7dOnWcHGzQIUf99gBKLzj+uumXJE2yIQzl+VIv3QeUzFaDsW+HYC5mX
         qrauECSAzW4hTsTffwmzeqX0VvmI4ptrWv/v6+jr749d26InGtVdHUsUIiv+3o92j5X/
         W9dEUJNnPYtjfHoM5FRDg6FeYvcop+2hTgVZ7OL/nYg0otMRZkWfvqxP5asvKT2umaTR
         rFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bg/tq8mc0td21VxYxjkcP/FxMATVdKN1/vdE4yipxA4=;
        b=qWtFQiQGvE8F4x6l3R1xYXpYvQlZlsA4TxkIfY1DlLQb9ejsAczockc30Z407SkfuL
         sOR0hqe+fO/NZFecyHb2qMequTCT6VVaNu9BxlAf2LoebV5RayjFo5NbHR9CzVQIB7DN
         2N8bf2oaXAajlOZpDGjyCpOmk5HJUmVxwnGe22DbgvRb7fkHD3fTlyJuJK3Hlapi50Vz
         aS3P5A41R65yf3AAUwj/JvQ8fi3gje//tqshvyCt4TVJ2sQP4hA2mM5W5TpxbKFzTvKJ
         6bm/Bd7Ur41QLZS9u6Hd7mp8uOx3/BzcN6CsfG+uE29n9WiI7GBxIWLUXYzvleUlDBkD
         1KFQ==
X-Gm-Message-State: ACrzQf3UrxqjCkXbiNigAvzYVXanQdVOn859sAtX0BPOHQk1bmcgr1Aa
	kMlf4Gq8pxr1jGkkktV+rmw=
X-Google-Smtp-Source: AMsMyM67xgqrFvdCk92DmG+pXdrUp6p+i6JO/9O/Gv6lDJmfmGTlKfueosAa4DWo4K9KaX+dYjCDZw==
X-Received: by 2002:a05:6000:42:b0:236:6c52:bc22 with SMTP id k2-20020a056000004200b002366c52bc22mr11585644wrx.692.1667305942512;
        Tue, 01 Nov 2022 05:32:22 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id f18-20020a1cc912000000b003cf5ec79bf9sm10404176wmb.40.2022.11.01.05.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:32:22 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/3] arm64: dts: allwinner: h6: Add deinterlace node
Date: Tue,  1 Nov 2022 13:32:01 +0100
Message-Id: <20221101123201.3021129-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101123201.3021129-1-jernej.skrabec@gmail.com>
References: <20221101123201.3021129-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

H6 has deinterlace core. Add a node for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 0aa6dfafc197..badc6afd6941 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -154,6 +154,18 @@ mixer0_out_tcon_top_mixer0: endpoint {
 			};
 		};
 
+		deinterlace@1420000 {
+			compatible = "allwinner,sun50i-h6-deinterlace";
+			reg = <0x01420000 0x2000>;
+			clocks = <&ccu CLK_BUS_DEINTERLACE>,
+				 <&ccu CLK_DEINTERLACE>,
+				 <&ccu CLK_MBUS_DEINTERLACE>;
+			clock-names = "bus", "mod", "ram";
+			resets = <&ccu RST_BUS_DEINTERLACE>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&iommu 2>;
+		};
+
 		video-codec-g2@1c00000 {
 			compatible = "allwinner,sun50i-h6-vpu-g2";
 			reg = <0x01c00000 0x1000>;
-- 
2.38.1

