Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584961353F2
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 17:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713114274; cv=none; b=XZucdHGYrL9bR7/z6wddcpRReUgO9H5YeewZWygo7FJ1Ger1Mvsmy6wUrB5tOU/wxnkLs1+6Mxj2NLk/WoS62p1Rq4NUv4Si9on98lYp+R28ujGFtSv70GQRRsQ9uJH3hVdv/LsZG/R6WTD2KuL2InBE6Ol+rzNXl4m+ezbCKf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713114274; c=relaxed/simple;
	bh=fK9vTqefiz87spHjVoNe2y31Rk6ywa/rRXAGJPmzllc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cL2U2+xrSxAEyEllYBkUk9a3nVol/gZPxQWJDHcf/W2hT3fxZFnhVQORKFUIk+fp9jN6KXsgwjdrIcvLVOY6ooUkDeJbHqgvg6dTfzLV4VttsKofnMJmQk+h2JEbnztRn/1O7ElXlADtfIC+DPLPNnJvcXvV2narinbR5Uz/5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDtr2EXQ; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDtr2EXQ"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-222a9eae9a7so1445662fac.3
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 10:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713114272; x=1713719072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtavPuQEEJLfIF/DFtWPLv6R+X8VYDtktb2584IW4/w=;
        b=UDtr2EXQkTZIPXDLpi8CLBIqeq8gU+vTyd4tODSaLAYICAlfNHDheEyWLkZOVOaqPl
         rXkktmESjuVxF8V3bpTBg8JOaAzuMCRlAgVfYqk5WtVIl4eJw6osyhxzY0iOki22hbJ4
         vDFiabXF4U37zgtbVD+T3lIvdQUwVF4pb2o5hNGsN8+PWzkzVIMLTvyPGwhINNCVqmWO
         DBr4W1mcKiu+6SgBnCueo5ebwPz8K95rqqr+CiZNyxmptqvcLgenEW/oujrypdJ0SWcA
         LT1jCYB1pciJsEajb92/m1ZurW1nyhA+RsAyZxoCG6B05TL9g5pbZTVDJG6mJbZhvtAv
         xJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713114272; x=1713719072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtavPuQEEJLfIF/DFtWPLv6R+X8VYDtktb2584IW4/w=;
        b=hW8B451ZuVPRj8GT7gFXmHwUq4/8Lq5q8ZY70aeUmAFxQwjnN8sdTzI9fmHJUTSGeI
         MaT5liyppZ7jP5lgPKsxelvHbnO/XNjoq5dNZBop9el/MIgkrJr5tHVNYBb4Zm3h+lCu
         WiX6eGAdo2KtO7TVqUMr+Xh8R3S7IHF3xtCcY7In2s0HU/T/En3PiqF/uTY9AuC4Kk4w
         8LQfYtjZS0fCeQNn3c/eF8UjLk0qw0d7rmCzAaTnHeliiya4MWUkpxqu6AJfu0WtULeA
         Ipxysd4nw8EIJiHNSZjveQvdXtbYsIRN6ipAiY2B1itczF3oTb3r6ZAflOCSCbQ52gXI
         talg==
X-Gm-Message-State: AOJu0YxVlMozTbn0k/Z1oVXhV5B4QEPStM2Esim9fWiqJR9kRYFrLjFl
	vnBzY4hK10plQ8a6BMVAcxkgS+B8EIDFvc719a2IdmWEfMyy7+TH7pvK7A==
X-Google-Smtp-Source: AGHT+IFrd412jjQpu7ty3S0yylUWd8IZ7LN+YY2dUfZKUwvlhV8W+mXRZ2RqNurgOKjL9jbwROrpTA==
X-Received: by 2002:a05:6871:646:b0:22e:caed:b1f with SMTP id x6-20020a056871064600b0022ecaed0b1fmr9169989oan.2.1713114272132;
        Sun, 14 Apr 2024 10:04:32 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id mv5-20020a056871d04500b002338e2146f8sm1585305oac.17.2024.04.14.10.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 10:04:31 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org,
	ryan@testtoast.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: h616: Add NMI device node
Date: Sun, 14 Apr 2024 12:04:24 -0500
Message-Id: <20240414170424.614921-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414170424.614921-1-macroalpha82@gmail.com>
References: <20240414170424.614921-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add device node for the H616 Non Maskable Interrupt (NMI) controller.

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

