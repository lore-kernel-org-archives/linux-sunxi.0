Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EB645A2B3
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 23:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763382; cv=none; b=AMpjLuULH4BH/lOp2IcBa3DceaggebbLxGKgI+2GE5H3Hj30Kk9IugqhZUfJfHKV6w0GUU+I+zYJktrL8phQ1P9oz52Afyu7+wW/ubKVeJMcVMKb0UTH/KEYy1o+Me/poANJmB9Phc3KYE7/4cjLUzUhGoZMGiejWPO35DxRVoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763382; c=relaxed/simple;
	bh=/QV/a2X9l1SRCZ0f0eQqmAxS/D1oWuZ8tyi8t+tP54I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k0SqqfFX2/RlJDqDGzDkSzdp3O0eUGbRxWdeUiWdXs5lEz56US29mQftg0XvfG9E89yQ7QGiNdwFUptWzJRFV9px2s4yWRCZvStefqfpw071UmMdxsBHpKRmc3S1mVuP55hmkg6LMwbXAORvWfyyzLNw+U8XXzfL3BZAjVLVqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eP3qJDUK; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eP3qJDUK"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-80a123ef90aso176557b3.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 16:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763379; x=1785368179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9smGZPIePSsY0cU9QHa9y4DXLJagF50l0voTZ623s+g=;
        b=eP3qJDUKKHoEMdzMjJqfU4bJ7S4l+BZB2+9FtrlzZWNuIGKKdMVMQtd4R0ZeK225Z8
         V5LfZgBJyQwAuGslhqu4tgWhwNtHhjlBNTEZP2qZTiZxONDnXH6aPd0WP71J9O4BO4ap
         txsrVd5B8dBscbWdNy2xJhWsRCE5RbMfbTv8ReZWP86kCERO5AiHHTRXkDuo5wCJxRSW
         4k+B65XmxgYFZCpnNKBsZ+h4XWZVDI1yM6Z4A7PlY/GbpPD1J5wJ+6VE6uXkDjZoCxC9
         vCpp9Ryy0uzZxF+vqdBNfVU4TvC9tBFgyXTKa+XLr7aQsGP3RdkccI70oweuZl13xWAh
         b5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763379; x=1785368179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9smGZPIePSsY0cU9QHa9y4DXLJagF50l0voTZ623s+g=;
        b=ndNjbyC/45X3HFNqTl+QiDRu2y6VK8XpoOYaU2NIhCgfaERcYGdj+aj0YrKhQtj1Ui
         p13eF8sI3Gjo2Yzp3c5X4RiPS7AafsO8wJXqSxzbyRogrD4wybG80SYuBinEEK0uvvuy
         +aZXxn/xm+gfogXGL7IaKQkfkPwxlstjuuyB+vns/s+xRhpU0WvI6dwdFHEDmy1OWEaC
         NssHQNqbQ2KYrJapAH6lpwkfKECGpOwVfPJk71DO4KI30Dm12ur0xBpKaG42I+TAsfTD
         3+BUjYtnLI2DN8c3pkXAAFlf6IU6HyMe5c9Gmnd71NT66Ofv5/0Har8JmV0fKcK3KWMa
         vkCw==
X-Forwarded-Encrypted: i=1; AHgh+RqUzHAaB1yzJZKJkpyOUszPq7IunjyaYBTiIETvIXMlIW8ikPoZh9kUwFv+CJR+cSWkG8CB6ajIXW61JA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXARtqz8/uwJ65d/NfmjgpE+2z0izXhpCQvIXGIxNOp4yWbw5A
	z12Vfxunt+jJnC3sUYJ8zF+b+oeZ7mvQ6rU7LLL8bevY5moIZIIRpGPJ
X-Gm-Gg: AR+sD108DEoYQhZb1nxhjgforGavitpB8M+Rsb6dAYbnXHgqXMKzNBjWfrXAQi2cbVG
	GIVhJnntkGv9fBkTJMrvheL++HI+1QWD4AM+ehqJOZibpFzlDDA4IjRp3Y5Jc+oCHJwDRuiD2pU
	sE89828BnCwpz5myLf4xW48yKKhrySC76MNkFYNeupUozSqx9k/0MBl6XeMr2LUBkokN8M8OABa
	qj7oSeBJ7d1Gkq+NqOGYgB9FFF5GONWhowswBsID/5RjISXBeov54jDFHaLcIKgUQ+3C0VWHMr6
	E0S+EEP/15r9ky4p1ifEP6bDowNQRAR0ZFYCKGUWMv//j2NiH0TVqOoTKqnYUZ2Q8IdaIO0jHRu
	rDF+zTCdJi+dM8IrM/qzGr/cQWK+Dnx4ukKj381m7JzwTODyA8G/4agYaCBKx6u4W+saFgy0VI0
	oM8GHlwmSusWEZdXHPcG9bN2K+/Dw5JdT6JJNsCXncH2X2AP4=
X-Received: by 2002:a05:690c:6e89:b0:812:9e6d:d47c with SMTP id 00721157ae682-81f4d3b498emr1003157b3.10.1784763379557;
        Wed, 22 Jul 2026 16:36:19 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:19 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 3/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Wed, 22 Jul 2026 19:36:03 -0400
Message-ID: <20260722233604.3001063-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver in the RTC power domain and mux its RX
signal to PL11.

Tested on an X96 Pro+ with ir-keytable and nec keybindings with
the remote that it came with in the box.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..1eaee20acaab 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,12 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_ir_rx_pin>;
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0

