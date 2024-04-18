Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B98A1779BA
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 18:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713464186; cv=none; b=YZjhqVDHef84jJxWPZVrR05VD1wFaa21DUjK3h38N3y1/K6Ktsn242fGjjvFrLQTQTxWTAbPUCZ19V9QUW6X0o+h5D1YXzqFZO3hNdszIj7ZcK+IarOacFZsKH1bUfJzkuFNtCvpQ8NhZJRGbbWjPRo/BOs75Kmtz147QbMCh6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713464186; c=relaxed/simple;
	bh=RzT85hTZeN5q66RZ4B6RgueToMFBVh5kpGMKsjlp1w0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gHdx2Mv1IKcS2iGfw6Qs+Ak3QsiMtj/18foJwHJ8v8fxFEgRBtMiPGEWUOH2ZfsVLIbqez9zWv6BmEu7jTZbkJmzNcYmsfNn9Zo0ZhLASLwLhOvFIgyTvIYh/ygHYFtM9KaSzikn0t+bepzXgRcsMdduSsSgll5RhX3JlzcrLdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D27QJqoB; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D27QJqoB"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5ac61cf3fffso719328eaf.3
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 11:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713464183; x=1714068983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHyhjFHfFHzvzihg5eoivzzLdrAJ2c6i2qTZ2T7TSG8=;
        b=D27QJqoBHcmwtFRr1W3L6F71HOfptqCgq2SxQ/InL/+ZSFD1NdCI+4hAzO2sUuvnyV
         cOs34+/iMMe8UoEY5NNtiMGAnhHPRPr02zx3gg620KZNq+Hh6AK20BftNpd59NbRynZJ
         JqsCjwyd3A6xSZErk6IENKhQhRuKrojpEHpRrjv+c+hRAPsPY+G+ejL1aX6balLHPNCZ
         DjIN3m5elpVIM6KP7yK8K5vcMI+PxzlQ423Snhm8p/5ZaPRPEuovp93aEPdJu86YBu/y
         bfzEwzTlvX8bMLtUKVY7r/Oir+hlxmIFFZSHymfIa2cUMkDhuFxUgZx/I5N6sRJjHGyq
         NSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713464183; x=1714068983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHyhjFHfFHzvzihg5eoivzzLdrAJ2c6i2qTZ2T7TSG8=;
        b=b/T7U8MhsRip+zklGOOIDvgGc3ZOr+ogvm0yuFzmZP8Dlpltz17SMZwspJ5xFewHGF
         aBdSDaAUSymiDjcV9kBdBrUG9gi9B3nCohovM0gTkxUrm0qrAi+SSQroIT87cH9JnDV2
         NSPOj48Kz5ZWaWaA83NxXny1iFhRU+NyM/2Dqm6tn2cOwuW9pXIm31YogYa0Tzuv5rPB
         csc1qry6pz12xjNixkk0o1u/VN6PTdj2pcMJdGsdCGr8eUdnGvOrhlqjRa6ZM+SmrStg
         30rpIA8TMBNOqzNtn+tsWRVEEsDMGs/lKiT6JscTGfsyEx22Y4DvszXB+oWStH5P75jg
         FZ0Q==
X-Gm-Message-State: AOJu0Yx9fVw2Qmi77Lq92Nw1zAAVy6KzIVcGo7CYjKzeDYYIclecLw22
	DP5RYRp14jYhpIYlAOw5x+uAoZ9OecJT8FiV4OPpA1oZijfN93ehHGx5Kg==
X-Google-Smtp-Source: AGHT+IF/xxsFAXOVULwipIHPYV5m8OTjxJDNGmnozeAK8EPa9oYeztB33aXPbh2kYtBBgWYsJJ7f6w==
X-Received: by 2002:a4a:5102:0:b0:5ac:bdc0:2bee with SMTP id s2-20020a4a5102000000b005acbdc02beemr3946595ooa.8.1713464183009;
        Thu, 18 Apr 2024 11:16:23 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id dh4-20020a0568201e0400b005aa77c0fe49sm483419oob.24.2024.04.18.11.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 11:16:22 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	Chris Morgan <macromorgan@hotmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH V2 2/2] arm64: dts: allwinner: h616: Add NMI device node
Date: Thu, 18 Apr 2024 13:16:15 -0500
Message-Id: <20240418181615.1370179-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418181615.1370179-1-macroalpha82@gmail.com>
References: <20240418181615.1370179-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add device node for the H616 Non Maskable Interrupt (NMI) controller.
This controller is present on all H616 boards and derivatives such as
the T507 and H700. Note that on the H616 no NMI pad is exposed.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index b2e85e52d1a1..1e066f3057be 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -775,6 +775,15 @@ r_ccu: clock@7010000 {
 			#reset-cells = <1>;
 		};
 
+		nmi_intc: interrupt-controller@7010320 {
+			compatible = "allwinner,sun50i-h616-nmi",
+				     "allwinner,sun9i-a80-nmi";
+			reg = <0x07010320 0xc>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		r_pio: pinctrl@7022000 {
 			compatible = "allwinner,sun50i-h616-r-pinctrl";
 			reg = <0x07022000 0x400>;
-- 
2.34.1

