Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E092FB0
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 16:12:31 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id c15so6528228wrs.5
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 09:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0bqMHX1s5ON0P7G769ywkrdppi3QjEs9pnjlyttXWnc=;
        b=RXwkYkexQEKkLCXsqRryuyPidSJ+VOWO/PGQdljrghi5ZDOAFYv2W3wQtJH5zpT+AX
         4QPeETEkT0omWmfD5GAIL4bUm5HPaTtlgJ4vdOZ69mKKiKiBhto9ZDaCNHv31qRuvLCq
         27g0cGUHOjIfjINu7EfhLPBkegXxlIaBcZoPyGIyJKf4AhFmcI6SlgQ4RXUFOtdMzNJK
         NcG85ptmXPoQwyQMDBhsgpgId6+LsqlO2IRf9SvocG+QzSPepLBP/RixTDFWD9/8j+4J
         VqxKO3XAYHPr6OBKnMAnwwsGbsVSo/dKceOilV2R+MisanFecvHKQzqKnfbP3qNmkwkL
         kjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0bqMHX1s5ON0P7G769ywkrdppi3QjEs9pnjlyttXWnc=;
        b=p21vF64U0ZbjOAO3qjE71zG0K0GBMDdHbOScvySRR6qtUBQdNptZhvAp0Gr7KDyoCo
         j2jesq1lDbVJB2BGdm2Vqa7rLUjp6tTW0FbS0ItY93KpUDkMbQusZlVhTZX4k9Fh74U8
         hNRh+yGl24W6y+VDyQiKMULSetEIGMc/HSPO/eSKtdz4ocb1sjjuRio1Fs6vEmsddngs
         dyoZcNMMow0fKiM+60/QbT67pLN2Y3d7E/9MdCPdYMzgn9KxGQMhE3wQOeWo1Xn507WJ
         1NUBPv+12LlqsbKwpYLnwI8Y18qtwjV0uBKt8IqSHUkt0BdnaRDSsqn4aJH57QkaqrKB
         MaeA==
X-Gm-Message-State: AOAM531+DHEE6LnnEfRT5Qf9Ow2LcOWNVuUmlVHpi0fwBOB100GAtHH7
	zNN5T0Z3h34j0CLNVNxow0g=
X-Google-Smtp-Source: ABdhPJzdIlGt7hRUSmmIIGbdzgB8uOb7SBIsZVTfRdyRalx7H7ANG9HEXZMzxgR29SzoxNaiLfp8Yg==
X-Received: by 2002:a5d:4010:: with SMTP id n16mr768096wrp.142.1626970349607;
        Thu, 22 Jul 2021 09:12:29 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id z6sm3585363wmp.1.2021.07.22.09.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 09:12:29 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	jernej.skrabec@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: allwinner: h6: tanix-tx6: enable emmc
Date: Thu, 22 Jul 2021 18:12:20 +0200
Message-Id: <20210722161220.51181-4-jernej.skrabec@gmail.com>
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

Tanix TX6 has 32 GiB eMMC. Add a node for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts
index cf9721ca6370..8f2a80f128de 100644
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

