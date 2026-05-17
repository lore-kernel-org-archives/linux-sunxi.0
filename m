Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346CC3D6CC9
	for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 23:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061294; cv=none; b=sFLRFP6cnzlgsN5kG9VOY9FBRuaK7kQAimd1V1pQoElHnQbvo829+xZSJcVo+boOGnO5TPatTgMB4E423eSb/cHNw30DWwwMQNJucQ1lzI0ZtAu7f+/i0PkRFWiDHQhlPWsXQdLxgTqq8CfZrnJomBqqUMtVRpvtmF0VXPUOm1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061294; c=relaxed/simple;
	bh=2u4td5jGQ8Ow5l6X1ajhmMrh6sEykCQG5upAuJ1gZDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLmg6DpY/IyZ7V8Vo7jzdjEDc+Bb9dTvsgt+gaxSaH00A06fA5RSczwqO1M/+u7OOIEhfiPcUBfip8TRtfNTWpQfZGkTTr3C57Fviu9vgO3RoAhpQ7kN3rjTLNXg8kZFcGeZ4AlM4Vf4/JxmyboQ6CQrcNISsFkAciBDLQUkp/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j92r3IyE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j92r3IyE"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so444531f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 16:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061290; x=1779666090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAFVp0sa+jSBvMKIktj8nBPRABJR9ywpSmKS0ZE52SQ=;
        b=j92r3IyEc2PQqpyNHXmeTgtGV69/5G1Mx+bBjFq24hxiDyN906fjKO3k3qf4M+m5+b
         NmN5mA4atjYoIycv795oMyB7JTL2ZzlJvXI+F9g6R0vc1qc8oFIKlMLWpyRx6feEHgHD
         MG0bZyGZdXB2q+VQNHJUcsXCzPk0vEkynFwBYpjHeN0gD+t0njER3b1uF5wOqU/vq9bK
         M/IOEo4dGiamqoofiWc7/NPR+H2/0Sp67ophstfbqtKlcXf4rfKq+rIL0KyEVptXPumN
         BNEbZgM4tuTEo0b4RjNOWChHNIwv6V3OgU/LMriGTrlVP7GATw6mbZwq74JI8R+H5hCc
         RdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061290; x=1779666090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gAFVp0sa+jSBvMKIktj8nBPRABJR9ywpSmKS0ZE52SQ=;
        b=FUvGL/fK3RsNUobKj5nNet9IZsbjFAovunYzBJGR38+thIBx9tkdvenArzzvvItHuN
         CwUF+i1hRZlfVq3HLT9mVK78IqOl2mBLZy4F1VZBv+YdQ8daTzTBWT15B5x02zhNDALa
         SY92xize5JkG9q43/Mk//iRIGrNS87Y+4ZisoPqLit3ZGJMFCCglUpaDDmnrFG3NnZJU
         i0zXhgIXgNooWrwCL4FqQoDRx9vckUSt2tvXcbuqMNGJ+d1flKHuAdwQEQm2L3pc9bA5
         GnNHNoDh/2VUixgGPFHO0p6l9/+e4GdxbyjLmWGkIV6IeAmRNdfrm28CDAv5TLgqjTgq
         EXDw==
X-Gm-Message-State: AOJu0YzigiZzulDDxbXW/Y7xLcKk7ali8lBNQCC54TIHlbkavm177SBc
	P/JnGBQf2iyMBYobojDyoE9LSr6BU9T1bLRLfJKBrD0kv59QMrWhdGf+OHK7hNt9
X-Gm-Gg: Acq92OHIBRxYB4fduLL8txtBZkinlEv28wKl5E1vHbksBYxQj8FwYIYi61l19Cxz8iy
	94YlsnNS0L5b9MCGaEkX/poOv3gspVeXa4mBRnxQe3xPDl0XRdmuwE8bblg/ZTSKPqjLUul7KGn
	wNj4DM20QNciBlch6wgMIrTv7s+bsmiXo9GhqE8u1kZaxxfSQpNzfdYNL4FgRHWnycBT0+AqN0/
	sDGXy7vzR3sH5OnGG72uMRvsKFe6yYZ/uwSq8yBlsevg0g9qDAoh38x4WHUJAPGCncNqVoF23rQ
	BbO+EoxIEx6TuM/XqpaXjprZa89ZMcaoQb+FURiZ3kraU9V2A36fv4DosKAAmG2mnXqGLUHUAwG
	bOiK/HmqyVCjfsydS8zJ0sTZA++xHn01wc3gmxyQFBToPurwcGm1/k3xtDiaK1EDxT27/nbHuZA
	Oe//XJLLknRnJdM53sCVJ5pF5isoflKhBO34ln0v44ecLwcbGb9PiIxgThOUqNnYSmRODR+jitK
	2e4ktCR5Io=
X-Received: by 2002:a05:6000:2383:b0:43f:dbbf:6d93 with SMTP id ffacd0b85a97d-45e5c5f2032mr18741752f8f.27.1779061289760;
        Sun, 17 May 2026 16:41:29 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:29 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] arm64: defconfig: Enable Allwinner LRADC input driver
Date: Mon, 18 May 2026 01:41:31 +0200
Message-ID: <20260517234134.2737320-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Allwinner LRADC input driver as module to support buttons on Baijie
HelperBoard A133.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 094bb9cd8764..570e84674029 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -524,6 +524,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_GPIO_POLLED=m
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
+CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
-- 
2.54.0

