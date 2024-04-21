Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A9818044
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 01:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713661507; cv=none; b=czHGZdRMGaZ2jKk3Sxd+Bh+VdNsfVRgRXK3mfZwo2TVeZjEVQfSrS0lvTIL+B1DU57Doa4GdvFozZmzmo0fMkytitw0Dg42WtYQcwdtmYmYz6Pvq0nhNVIsmxLzshhjTaD9gMmBY3U7PhCQIklQhrkJ2LZJEfmgBPLQYFQ1VNXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713661507; c=relaxed/simple;
	bh=wcB/ebDhkfkPBVDQxoUt3AjUlhzpSXzz59SF5DkeLyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZV0nJSy6irMu7i7alOAxQFdxgG9BOlOjrAuHAepigE3xh0CxS3XW4dD0J4Tt33Pej0xM4kYODS7YTnx8+HKylGZu26OZY7mCMjdu1hrlivxW1VbBR+qRby5WscZMN8apsP5J1sMtwj4BHq3dB2jw94f50+sJgCB5NfG3ctMVhvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hhSS1ovN; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hhSS1ovN"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2338483dd76so2060366fac.2
        for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 18:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661505; x=1714266305; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=hhSS1ovNcKQmmTy0WQcK9FBTRBitgSThYKvTsoC0Q/YTruZPJQE1KFA+SB+NU4NIYH
         1fcyXhYQ5AUCSI425LZNnyOKyxUDQWr7vkehmBEsNYrqZWO/eb2Ch+jkFzh15A5KtWlF
         ErtNhRdBu5Vs/oQR/Zmt6j5Sl5R1y82GwQSwpACvL3ZJMuHubq1LMHBymAbxOyjTT0Va
         sknoUWsXJ5y8ylelJHnZaAB5JIWK1kuoDlCS8Ta1KU6UPP+MbNyDnCV65xJAWAw371ms
         L0k/SApxf/Opb5CQTM4VKgPFbmUGA1QkHHa+XRtoFIQwjoIlE+5CeUFmOGWfB4R7qg9i
         tfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661505; x=1714266305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=k+RYbApNpfz9C+Hxcv6LEr+xs6wAlnQ4vOReArZLfCH36wR9X49iXcaqOyQFogqwjM
         DIh+c+w4lmYCRElrJN9LnZVEWXBxAqSIfm3UWrjb3Ip36EW5Bp0JVQjbzX0Q4cbLlVtc
         VQU/J2LbNroqHKk+0s9gPb4jrtgg27A8GPIg1ahGtoHHdtqP50Ase8QRoRhR0xrjVUgi
         t22qzoFD/ohR/bvKR8bRzj8cWo9kL9O51NMMJ1e+4m0vAUCVT24cIcFbgXjtWqop5R8u
         +CTQ9Hp3Q5eVPlFPMW4+7AAGHtdFRFXn75Ed5zXh8SItSsguzZ+os7hlEZDV1DzUsu2Z
         4ZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgQNTKF+8X1usy4JyX5cGzOrZLQFCHLuqRTyLwc0EOexMXY8miRMdNTMGdbX1binUN3LT9SNErqPg2Wq1oaV2FGf9BOkdFawhad3s=
X-Gm-Message-State: AOJu0Yz/MqylWpt/teBAIezodUXbYLTtCLvWnoCHS+00bplvXeMaXeuv
	q+NrGygKv2zEFuPWHyfzjDRuXEkS0WIUKnSKnsJHUxsF9aTNhkXn4TH2cRmc5oc=
X-Google-Smtp-Source: AGHT+IGbQ/vxSg+SM01gknEBQRR/q49/3qC6z4/xjDMc4YZpeoH8/vtpKwa4//R2pCwzOVNHIa6iZA==
X-Received: by 2002:a05:6870:9a0f:b0:239:8e67:6f10 with SMTP id fo15-20020a0568709a0f00b002398e676f10mr5008737oab.30.1713661505412;
        Sat, 20 Apr 2024 18:05:05 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:05:04 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:42 -0700
Subject: [PATCH v3 10/17] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-10-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=C7F1c584ODJM4qF9TPT5kMoM8fDlOPYyEMw6010Mea8=;
 b=7jmS1W1m0Q0AzX4wBIry9EylCG+Y3NoCPBcfRTlo9XfCGTiKUGeLKVQZD0sKpe6MXP57BC0/G
 7k6iLclC9/sAQ0QerwrjVwujrLIbftuilh6gclJQQmbPMW8YDHcSlr5
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..13bc99c995d1 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -215,6 +215,11 @@
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
 
+/* VCSR flags */
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01

-- 
2.44.0

