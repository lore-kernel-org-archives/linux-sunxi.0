Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EE9137C4C
	for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716230597; cv=none; b=Y2wLgyo3DMnHWs1p4lm4BZoW8ltj4heuGPTCO28bqqd/wUdXTCs7qLDNxWRMWDYPde5yqBSe7g549utdJyUU6q4vHUgReMGKJgf0nUNGyqhZS6sZmhqYP4xlJ2wQC1l6doQ0DsEsA5mL3chdE01Sa01NT6lGDPdP7lLTNJso1Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716230597; c=relaxed/simple;
	bh=HnSg3+8yvYDWyM1nLfi8rFvp5yUPrPDHA9iB7+b6vZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YhCC7ceaeaXeorGY0kAn+o9AbXr6nolviQ/MeLxW/r/aJPmYSCIo6vuIPGeAKzxqSAN0qnOE3q2PrbJYDMok1CmiFjcWEGAh27es2nLI0YgV/yRuryeAmEKWVrL6jvEgqu7tZUHwMilgKmZHUKLUJNPotc1xJhpekydrakPiuXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFcOvYjv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFcOvYjv"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f1bf83f06so5620579e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716230594; x=1716835394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0OurAq4gNaktjTguChGRH09zP44yFK+BI9ZEKeRFnI=;
        b=IFcOvYjv07MEpbtzNhPIsSeUJE4/IUppVFC5sAJwayJq9EjxbC+2yLWf2tHdct0moC
         2wLMGpEMZ1t+TWyLUeWJHy30e3+2xx8+d+hg0lR/fyA0sCNfxkRCxt48uPvLtaZ0VFuJ
         fUZPU641K+ssq/dkLQc9zQwyMs1olwoAiesdxohZVywSncmHqMEwgkl231S1RWNhVNAq
         KPA4IZ7dBqPSjTTU2lSE9Ha8rpJcES2umKmos8Zx+HFgAqxg9nOFmtlWJkCAPKgE0JU0
         5QCEe2EzihxPl0slE11Q3YJsfQsWPX8Kd1C5DEWurPVHYwimq4YH1xn452d44qINtWdy
         qm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716230594; x=1716835394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0OurAq4gNaktjTguChGRH09zP44yFK+BI9ZEKeRFnI=;
        b=jwvBSBGD4KUMg7c/uFh87KK0XutuertJYjY3NMXijEdPqiBdUZHClipRQWc/+Kkzh1
         RzaekjgphBfRdzvaW6czMBlF4BpV1F2NxyoAWmpGsfhFUVi77LPiMCeU887k8hA9sXFz
         vVtgD6KsrrFc7uluuFsOoBZTCfiiaPaDqt5SUqBAlU/wAibAA5ZJbu5hmRHVngJZDim8
         t/0fP4LcXUufxk9hLdEuht89cxemT/bZrsJDXULx/krIdbILyK7aZy+6BhQ9nqN5uXrr
         rSjA6MyUOc9BwN994C7h3bThOC86ELqQxnLcyH0VF8ux25Lc6r2pnLSuAPjWenqF9Oq4
         J0mA==
X-Forwarded-Encrypted: i=1; AJvYcCWsFGoMbFakhGoNsxlu9rNP1qmdEsNVZq9ypP5C2grDlrLhEgjeCm0/7veNfyxrk+9mCQGCm9EVyD33lRc+TJXecsuCiMTKpNaprn8=
X-Gm-Message-State: AOJu0YzIcFXbDhjgYiOJJxHd3fN/lZVSI6sNORYRZtYBtxriLNR6nTvb
	1AKty0+2pFOQg7+SLlCdGsuy19SZy0IA18reOMYj0To9KB6UVjg=
X-Google-Smtp-Source: AGHT+IES9MWPihMjZ9PvkU27cNvcpSz1C7H99avkgVPdGIM5+InFmh0mxe8lkpqCAW7BOcWJa45LqQ==
X-Received: by 2002:a05:6512:3a83:b0:51e:7fa6:d59f with SMTP id 2adb3069b0e04-52210074380mr22923108e87.53.1716230593937;
        Mon, 20 May 2024 11:43:13 -0700 (PDT)
Received: from localhost.localdomain ([188.162.49.81])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d335csm4368967e87.125.2024.05.20.11.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 11:43:13 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	John Watts <contact@jookia.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Mon, 20 May 2024 21:42:21 +0300
Message-Id: <20240520184227.120956-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240520184227.120956-1-privatesub2@gmail.com>
References: <20240520184227.120956-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 5a9d7f5a75b4..22821b21b9a2 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -145,6 +145,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&ccu CLK_BUS_PWM>,
+				 <&dcxo>,
+				 <&ccu CLK_APB0>;
+			clock-names = "bus", "hosc", "apb";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1

