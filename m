Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D1522A7FC
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 08:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484468; cv=none; b=aKRUXFB3yAVQsYXs4s2ngEaH5F6Xad1clXWwnGsVyDMfFrPAWb2ncXJHi3BhE5UrYsmW/OlDy1NVKbkX40FCovZmlj9bGCwnJCKkSKBaghluI76vC32uiCheQ0h8eJ9k1d9JVKyunJ9EgsSYb5gW2XprynfTMivpAy/uLdsC7V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484468; c=relaxed/simple;
	bh=/Zg+SvYYhV8lAw93gW64NAyn68dIsXhG9VArVA4Apio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiY7bPLgI5Cw7Snmqe1/ohhqTAaKxum2gnTAy98pCc6NzkGNrPwLjBFf6QXtdC30n33iC8IlE99V2dFguWCP8kvDSxkdzSejNkAj4qEAHpSfb7J88fZCZ/5FNXqFWyYf9qveCJtRQg64hrp/iaKk6rUuuJpjgvFTUBnQE7sXBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkUwJL9M; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkUwJL9M"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7098af6fdso12805166b.2
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484464; x=1746089264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0naMJuU9gAe+qN+udfyQSJ+gDe9HTRKDpMwSOS1Ylc=;
        b=PkUwJL9MDpeOEYDMqGyWB3kQjWrDuIYqTRgrJFAQK0f77PP3MxR7mL1V3vnA+xB3hN
         zgIyhwVTbzd855ALQb4jx9F+1NXnE8L9yRw3Pa/Y0/CILalUEG605p47sqvL5m4AIQ86
         8y0jb5+N4tr/aqW5IrupltkZqifTTLCa4Z/ZHhKO2BhczSZ//C/zmoXRaM9y0AZbEBBb
         dOH7/m/pMOyAO02ad5znkdWNNeJuHtyhBH4fhB2OENR+QuupZpd/GoX8vafRPOZo1GIt
         FzxTO6W4acJTET66lQMh8ew7Xr7kYLAMvFcgebHUpY4xmvPTgkoiBLyKye0JJMkaWoV8
         zLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484464; x=1746089264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0naMJuU9gAe+qN+udfyQSJ+gDe9HTRKDpMwSOS1Ylc=;
        b=bdZJDEr5r6eK3KU9VT5cZsQChUgYEEgQNmxE97sX6VRyD3btvzStQihkOgxmt0tRjN
         Jg8DX0uA3RkBry7fjsrAagR9RYbKa4jHJrccUlEdWn0nUBWsqH05bXFEZ2vqMedqEtMJ
         L43vac6a1OGBDmfRmM1A6OpaYVCZyUVQ2gDsFJXWXVgykmQM5OAScHiLYHnrwEULlg+Y
         eRXnMx1xReGzBv/B/3OLWlGf5uDtYVBkjn0aDaRATeibX9m/gBk91TvuQLDmu8lxNSEv
         qrZzFDoucVZKEEAKbZNe5A173BsGcGfz8DZD1PiOXEuDwgtErtH+VjwaVdga8VLAQ8me
         AsQg==
X-Forwarded-Encrypted: i=1; AJvYcCWY0tMqFbFWT+7t+fXl24Ss0KbxrzcNIrswDX33mdMh8/EJzTbcIv2ZsMpVuAi1Vbuhr9E74+s0jgp2YQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/tOc2wdLPh5Bcxi26+V8SNwzcsOZ3frVXDWkI8Nf9Dx5KYySE
	JShYs+LDmClnwKqyCZhc7k20+2zjtXBkcZWTtbhP3BSfEU7sSb/TUS1gYav1LKg=
X-Gm-Gg: ASbGncu3q29Kv0YUTg3eZKaAgvsONcBQWMx/yy7zLJ9P0bDjJT8x5z8pHbYTjEK0YWr
	HiAMes8C8ipHSD7MrTxmoEdCFkPwUey4P58zGfR0swtBh67+st5fxhLkE9BbDi6rn/gTE45Ozen
	SEGKV6xEa7mUDJUZNt2Zp+rnm1VdbDfPoyDTdDaoFO6VmYhpzGMx0fUb2aPuicKCHFqXw+feaY5
	8qNP0RROw8PnNaFkyS26qDougKhcfJs84zDeVvW9VpVf4vErmYQkAel3pN48xBWPouJvVwIc9Dr
	5Y2mNwaXb04pd+CJogero58768cTRB9IhkwWUL75eqHgqWlEYw==
X-Google-Smtp-Source: AGHT+IEqtIDEk3bgbvlxAZRptnb7L3v+POmbybrom8KtYglKCBdm5DoZlFBkTfsuHhG8/g5OHyFgfg==
X-Received: by 2002:a17:907:3f0f:b0:acb:6464:5f9f with SMTP id a640c23a62f3a-ace57220445mr58086466b.3.1745484464256;
        Thu, 24 Apr 2025 01:47:44 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59830ff3sm71378866b.7.2025.04.24.01.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: allwinner: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:37 +0200
Message-ID: <20250424084737.105215-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
References: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  sun8i-h3-nanopi-neo-air.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
index 6d85370e04f1..9a2742363cd0 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
@@ -94,7 +94,7 @@ &mmc1 {
 	non-removable;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&pio>;
-- 
2.45.2

