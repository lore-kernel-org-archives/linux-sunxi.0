Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE5D382298
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 20:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786565710; cv=none; b=BFthKbA3XOmVFwNaSyDFZDn7p2NZ0rHw+0I80cIGLSoRghabUfmzrG/PHkv9HmPsmQPJ6TgaCIMFUF+HuGG4gIV+KjiUXPBQ7qOrJRq46bBq6fMnzK1gJbN1PDkpsDrM+azx5mw5bPa9aO+fChu1XQU17NVK0jO43KRnILF2RhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786565710; c=relaxed/simple;
	bh=rKcEzLrWHwOrPGnoX2RCStfIvnAY/kKQWHUNvFbq6Pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kPmofyqlGuhJroxylQaWF9uGHLWRHnA21yJ6zph1BqLST6kqHvR1eU5IZlnv9t+IePmdVjUB9OdXjwekhphrOzRxzmA3P2aAZIDdizO236pCNAIf2gHuvfwHdOSc+9mmDzfdo8vxe2xEOEklgDLucL5amGqwZy7hIHCupQopqx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qOQSKrpv; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qOQSKrpv"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7ee4399c423so1060810a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 13:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786565707; x=1787170507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xCetfRdT1kQP0+GZObnmMEaJzYFwf/S5fuBWuhlhps=;
        b=qOQSKrpv5XPYrl9ORdPNeQFsaaQXNxVOY0k7i2Ts7Od/mlzB6Ii15nMxpI2tG1P5qV
         Bv2qJsg6ncCGHCj5P0+FGbKXBJ23oLYzxYbkvJMujcDc8bS2LUuSyWAhoJA0zXbvi2kE
         JVTyLEx33vRtwatpnNd6T5mYjfSGY5TpUvseyu18Hl9aHZBTcIPdFTs3Cmz1xhd9q/T/
         cMHUtj/CbSu33fnB2YClOxYMgOnakwpHuSRGXWuZVvACeMRIqsOtyfm1tAqgeL4mlquf
         I1Sr1ScP6HL52rXRbUVDyhdMqo8f+u+9+sX1vV9R+94sPnE+VIEHaXDQWvQkdaG8ijW3
         Tq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786565707; x=1787170507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xCetfRdT1kQP0+GZObnmMEaJzYFwf/S5fuBWuhlhps=;
        b=ARk4vBY2d5N3SaCTU5c7LTV6q5wXwUFVXnYN4PYtktqKGyANWVPkV6wyjgRYnNkxW3
         /o8QBaoCjWCLG7I7dDY4+sKcdruMotKwVisFJ3wfrfDFJrtBuxk7ghlW/9c/EoWvd7fR
         b6ThRsnEX6Nso9LyfTw8QlUkfiHwy4whEMfyLXLfNvoHj5IIX4ejzxEeT8ZiUewovXHz
         9Fo/3rI+bsfL0kijT0RIvwKpYYQ4xfIXSAbt7okFgCs0Ym566z23Z6KCE3B7yhlPzhfP
         5gxZdEcWCT/0lve3XON+L0qxB14xMxsJFbABFDLJY7UOpmCALiT98nu+b7nwu2m1AXMs
         +/DA==
X-Forwarded-Encrypted: i=1; AHgh+Rr20DjLfA2UrN5gNyU5rBD9+PJeDyRlgHW8yTBXQ93jeVnODIEtlqMHeihpmvs69tGLT/pwhEu2ggApmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXDWfEAdYNbk8v5mWwrzFxhrIIXQkfYHz7wHm/ExVBJ/t0qw64
	AjROR312SGPaCIWeLKUOVKOUEFUA0WWN3Xu48mn4SrJWoSOxBDwj9DdM
X-Gm-Gg: AR+sD11/jI93HCvxStz8/dQLAo8LG1Jeh9vR/EDdN6GfAAsYaGZt8gY5gMU5Qf4mAi0
	WQU+u06PXVsXLdAg8WEefp/WhtefwXNsouQ0wTEKXL+riKDCcDEaFOr/2wtFO3zmrSkvxQqoCF3
	YH2zFcYPsckjB9CMJhNMgYg3Sf9u0OpYUBhTLAXtJAU9UmjSmMfhpnBVXzBc1bYhhK9zDiW51Qm
	onm639iRfx9IvDcxZi4LSr5EMa6a1mQ6rVHQftyZc9i1Qxwak86ymrkQMd5EShy54LePhpkOMc1
	0r9U7vC/hxMfOTcu1ymiDHVu/zuxfw4PGm5cpQGWiDnZiIhLJHwf7S7iDhYygirkWG09JvN4IU3
	gXGK5ZUKztJWJX+GyoJ9iLXGV8g4kxrhUgDCom3SodM4YuSK1oHetmPCBlBYI6+0EgrdHK6nUAQ
	BJzF1PDy1N3Www4L6UsGbqBSHQr5IoraZHNS9Cnd06+P812kib2DnHvS1agrT5UBp4nrspmUtQW
	AqTZPWPLm5dXWTiQXZksbcDzB9VHmzLPvzNpdXE
X-Received: by 2002:a05:6820:4b8b:b0:6b0:449e:5d15 with SMTP id 006d021491bc7-6b0c41a23a2mr1073613eaf.4.1786565707024;
        Wed, 12 Aug 2026 13:15:07 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3c9cf3b0csm256006a34.21.2026.08.12.13.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:15:06 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH RFT 1/2] clk: sunxi-ng: add feature-aware M divider helper
Date: Wed, 12 Aug 2026 16:15:01 -0400
Message-ID: <20260812201502.264919-2-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
References: <20260723004856.55158e84@ryzen.lan>
 <20260812201502.264919-1-enzo.adriano.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow single M-divider clocks to retain common CCU features such as the
hardware update bit without using the two-divider MP class.

Assisted-by: Codex:gpt-5
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
not tested on A523/T527 hardware; testing on actual hardware is needed.

 drivers/clk/sunxi-ng/ccu_div.h | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e976f..fd222ef0b8af90 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -212,10 +212,10 @@ struct ccu_div {
 	SUNXI_CCU_M_WITH_GATE(_struct, _name, _parent, _reg,		\
 			      _mshift, _mwidth, 0, _flags)
 
-#define SUNXI_CCU_M_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
-				       _mshift, _mwidth,		\
-				       _muxshift, _muxwidth,		\
-				       _gate, _flags)			\
+#define SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents, _reg, \
+					    _mshift, _mwidth,		\
+					    _muxshift, _muxwidth,	\
+					    _gate, _flags, _features)	\
 	struct ccu_div _struct = {					\
 		.enable	= _gate,					\
 		.div	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
@@ -226,9 +226,19 @@ struct ccu_div {
 								   _parents, \
 								   &ccu_div_ops, \
 								   _flags), \
+			.features	= _features,			\
 		},							\
 	}
 
+#define SUNXI_CCU_M_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+				       _mshift, _mwidth,		\
+				       _muxshift, _muxwidth,		\
+				       _gate, _flags)			\
+	SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents,	\
+					    _reg, _mshift, _mwidth,	\
+					    _muxshift, _muxwidth,	\
+					    _gate, _flags, 0)
+
 #define SUNXI_CCU_M_DATA_WITH_MUX(_struct, _name, _parents, _reg,	\
 				  _mshift, _mwidth,			\
 				  _muxshift, _muxwidth,			\
-- 
2.53.0
