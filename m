Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2DEED8
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Aug 2023 03:21:15 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1bff2d2c141so911557fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 20:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692415274; x=1693020074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAWiVInAKzqGBVby1FaYIzHdUGUf09+39fdPYx5btro=;
        b=bYQeSQCbaYWSHd09XebwHUv+l1I1FH2pN/5X75qDYckyXvLxhFGJAXXmzAehlgtWCW
         j6EN285Jd1VZyDtx4Cy3poVb5g0U2CjBea/DSs/wYt5iwrJF+9GcR6YzQUfiXWY1JVMt
         gAMzWegYIwSxzo0PLLzaHxrLV1TArMW/VR/ve/lkRz0dKmm/BTaBCmy3nsB+0njZ3Do9
         tmWpWHTMAh0H2/EsOQUvFrGYEQafnSgTXfrSsrkrMDFR8nJk+FJhrud876yCwCythJEt
         +RowKx832ROffLiTbyK89q+OsxI/hbBYJhwHiTuPrxrvapoTXHqQsSnHKYnl4wfcchqr
         q2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692415274; x=1693020074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAWiVInAKzqGBVby1FaYIzHdUGUf09+39fdPYx5btro=;
        b=XLcQHEvbC4v8jnGYFqO1qbgwQt3A4p5/BuKMJRVoKwmftQgnI3ia0XIKOqjGxw/RC3
         FhHUtOvYOTKcXmkfHKj1jvywvZ2UIp66nJe+AVV3m+5yxv3gZ0B8r+oaygX5aZXyte6H
         /1fCoXM5yEU+EDwDqSTVv1Aq5XXO14yRDMF0MvXofRjMKqj8Qm+akpM3/vBQtT2KqLF0
         BPYEh5dbh9mHetVskY58cHFpaacoPbFn8jU6Fedh5sBlI92jAXPScBVUxjMmLyULecM/
         cUZsfBH+FkOCgITkcxSf7rCNM7sB5l5NW31dyGTcNZdyVkXcq5yMfVre9a3mtiR1UMoY
         0Xhg==
X-Gm-Message-State: AOJu0Yw2iRYH578ahW/ZSJNpStOmA7mz90gxiZ3bAgrnaNJZxTQG+V/4
	WkksoEsLpbJbAGr2RVWQFurf3lTujxc=
X-Google-Smtp-Source: AGHT+IFFJLGutK6XtXwAVSVazDKOH5tCGLYrJwKo7JUO7MBC16dR65lsZ8kiKKkbo8s31ky15qprlA==
X-Received: by 2002:a05:6870:14d4:b0:1bb:88f0:f41a with SMTP id l20-20020a05687014d400b001bb88f0f41amr1320486oab.26.1692415274708;
        Fri, 18 Aug 2023 20:21:14 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id ch16-20020a056871c41000b001c02f12abd0sm1728265oac.38.2023.08.18.20.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 20:21:14 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	me@crly.cz,
	uwu@icenowy.me,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 1/4] ARM: dts: sun8i: V3: add alias to cpu node
Date: Fri, 18 Aug 2023 22:21:02 -0500
Message-Id: <20230819032105.67978-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230819032105.67978-1-macroalpha82@gmail.com>
References: <20230819032105.67978-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add alias to CPU node to allow board specific CPU information to be
added.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index 3b9a282c2746..2b76a5b8ec19 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -71,7 +71,7 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0>;
-- 
2.34.1

