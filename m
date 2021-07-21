Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8EC72
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Jul 2021 20:08:56 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id n4so2032507wms.1
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Jul 2021 13:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Axto6lQ2+nrph0X1bVranPKMH1bIvsVkx0NZvngC7c=;
        b=FGd5xGSWm0HOZejRS1CKbRrRfp4f9OHkviymUztPGVbz8lkVywuQ7yhPIRWCEZpgMZ
         a7Ds/jC9ijZdOXK8sSDPMWNa3mTlb7Qm9XCuszQABm/J1XwZ1f3vjPYYUfYOSTe32Dhi
         7vIRno6xrQc6v+a0RDvfAm4Qc1hdjD98etLR2K0ydNSAKFVKxUQyQTBj0D9KRWfHDbwm
         +UFsh+smhf8xmlElCwoQgwchFZV3mgzQ3I+lcUWPoiMsduK240RGJMRHzs8bCPHxX7Ew
         jVigodWydTAnkGJhcZAM96eMq6QLeonxEl46oInEw6TdJe851er/Ic8848iiDAojuQKR
         z9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Axto6lQ2+nrph0X1bVranPKMH1bIvsVkx0NZvngC7c=;
        b=jsGnMIydrOa8eW0aB+gQOeyP61enAoJxxLe2GdDFCOIf/9+eidP4PSawocbQWaN5Dc
         Aok1PVYcBSTKKXgJ6anVuZ3r/k0aiEOf1EYn9nBH4N8x6bjV0xIQOd9IgtO80UOSfWRU
         gHELZuM+XZqYaRd93Oc/+eyHDt655ufXsJ4NCBHizvhcCVMkcc7L5XGlDFXtrZqXv2HX
         YsoKICHFOLAxqTxXqSg40NlEb1hk5HltFHUNWOro/l/4FGC2EbXUUtN98M6Jl+uP3aJe
         A1DqHCDK0yqYciWgZwEPJmfO/1h+Y2fcjp4EfoEIff36TcUdvvNSMBlnMegRqi67jQpk
         AbXQ==
X-Gm-Message-State: AOAM533cXZYZEYd3IF7P5a7ZzdiaD8aN7+qmwS0um8EnqHpq2jUilTKq
	2MTc2kBsGLOp2QJnJ56C5UA=
X-Google-Smtp-Source: ABdhPJxRAR2ME7BbdLUxY5mKNVXe30C/6s/O5OXZ4H9yrWvG9+kuPhZAAzOgl/uqFIZxl0lirjWmtA==
X-Received: by 2002:a05:600c:b47:: with SMTP id k7mr40127576wmr.155.1626898135054;
        Wed, 21 Jul 2021 13:08:55 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id k24sm28927162wrh.30.2021.07.21.13.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 13:08:54 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	jernej.skrabec@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: allwinner: h6: tanix-tx6: enable emmc
Date: Wed, 21 Jul 2021 22:08:32 +0200
Message-Id: <20210721200832.916644-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721200832.916644-1-jernej.skrabec@gmail.com>
References: <20210721200832.916644-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tanix TX6 has 32 GiB eMMC. Add a node for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
index a1dd8f472cc8..c23b7c37406b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
@@ -98,6 +98,16 @@ &mmc0 {
 	status = "okay";
 };
 
+&mmc2 {
+	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc1v8>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+
 &ohci0 {
 	status = "okay";
 };
-- 
2.32.0

