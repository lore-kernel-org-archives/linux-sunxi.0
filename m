Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99254202F65
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267726; cv=none; b=LOsh4O8ZMXgt9i3iPpR6Ar5C1mNjWk8uz6LsMX6e695ig3oD5HHDFxidVz6HdTwnIqYZtlyKKhnUQQUkLDTrywk5Kr69Gtu8/kxRdRvslasB7A/GZOiRlWXBJDmtz7cxAmeBbOzmQ7XGa/0zy9bNpIb5o9Crz7dAAsnmikQJsB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267726; c=relaxed/simple;
	bh=ilqpidFYgEuMqLONnUffz0dgi7GvDMyc5t8CFLHqIVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s61CB1ERw9ZoBIIvTnKw1sxldxy+ICxii2TVkZMfF/J6iq8dpWf1I+OoczLqYF+1Ow+yiRLHNBePiDiFyqvZC5NX02hrrvCBCuj30MmT+tXdeXG0nsB5WXIGymHx6/mhKA0O04WJFapcEFIWMrSy3ILkkFhFDNR7i0Q/5xRXY3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2d8mM+N; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2d8mM+N"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2872134c806so872140fac.3
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729267723; x=1729872523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcD50VkpupT7TzRNFRLFMjA7Fk6fhf3WDFKQwgJQXDg=;
        b=R2d8mM+N41hkDDqE+0gL05Se3DYJj6u22wetGB0RGDUyKhn9gNLh90PX4ZhThRCCiG
         zyfTfRafyPKZ8wqaPZx6LCwR+sQzNePtZTvA2Aa+3LVZWyZpneTmeGaAS02SWclyyvjh
         vHjUBvsuUgFPocGZmSE80WDurG1pPKv0imDGwn1svBimhl+tmj+hHoON69ks+Rxy6504
         9ciNuuyesPHRr4+uqo/u6HneYHuiH5sYD0XdsPck4Rkt5o4TzDocM2a2JqRiFRpL95+D
         v4oLvMt+1e5grts95ntYTXP3ArgXSWLkLXkHYoepgvuoUyik09gDobvP/knm8vUybSlF
         oEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267723; x=1729872523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcD50VkpupT7TzRNFRLFMjA7Fk6fhf3WDFKQwgJQXDg=;
        b=CaJJ37h4YASCRvUjBXAaXIaEC1Ep6dr9hvADDyXFJFj9N/S6ePbYwGDW+p3hNPrdkm
         hQPdhLfkBvOrRKCFbVKNOFy8r6lL8Ke3No5O/itUiMCSdMHJwDRzt2rSTg6GbKL8PVAa
         G1o6aa1Az89X9TdtR5dvaHEcKz2/62EFI2ymDgOUUXY73KSMPWXmUNsXcoqdbRPHp3F1
         QlNQO1z/nyGnFkIt+ami9mQQAeaKgSXpeTcl+0/sZgAPYaW6lPynwBmYCH0Trg2MHyHa
         xW6zlZcmw58+7jYX4Ka7t0/IXolG/uF5pfbRLh4tBWooBSkmoY88MCsHHaEKR1baIUQF
         ONEw==
X-Gm-Message-State: AOJu0Yx7p0XCGYirGxE0e2b2cVmtaX3YAaGAKl8v0uXicKbJyZSuY6cq
	ETnQQFmFxna6R0o2f0/uxkm6JSPJ1QvJgpMfpy3ZH4mgKM+OdEusOT6Esw==
X-Google-Smtp-Source: AGHT+IGFU/VBdQMOprmAG+miCx1xCs7xV3Wyu0mv3RTWGQylWYTNaaCBSJRnGD8XGx1oDEmXgL3v4g==
X-Received: by 2002:a05:6870:8a0f:b0:277:fdce:6759 with SMTP id 586e51a60fabf-2892c527f7emr3032394fac.31.1729267723170;
        Fri, 18 Oct 2024 09:08:43 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2892afb01ebsm507350fac.50.2024.10.18.09.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:08:42 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/4] arm64: dts: allwinner: h700: Add LED1 for Anbernic RG35XX
Date: Fri, 18 Oct 2024 11:06:16 -0500
Message-ID: <20241018160617.157083-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018160617.157083-1-macroalpha82@gmail.com>
References: <20241018160617.157083-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the second LED (red) to the Anbernic RG35XX series. The RG35XX has
3 LEDs: an orange one that is controlled directly by the PMIC; and a
green and red one that are controlled by GPIOs.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 2896d51cec7d..ba554c019e88 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -170,6 +170,12 @@ led-0 {
 			gpios = <&pio 8 12 GPIO_ACTIVE_HIGH>; /* PI12 */
 			default-state = "on";
 		};
+
+		led-1 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pio 8 11 GPIO_ACTIVE_HIGH>; /* PI11 */
+		};
 	};
 
 	reg_vcc5v: regulator-vcc5v { /* USB-C power input */
-- 
2.43.0

