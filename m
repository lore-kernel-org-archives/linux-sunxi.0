Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5513216F82C
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 19:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721848455; cv=none; b=KqZN4zieBCc0wqUtbu78L2yvmOVjSgutNJMTXqKGhd0crwuiI5c8I3J+nJ6v/Qct/QRajJp7visYFwaVoDYRoNy/bc+aT+EVUMR1sARHOsfrnU+IEHnvbAEl8YSxREiyLlkWVFShgNQhhsbrtLVhRBBXTjUctJlayvFJd+oiuIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721848455; c=relaxed/simple;
	bh=wrX0uryyy89vYlAinvVr2O6QBZz257uuEBuSnzas59I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FlGWXDSrN/iEtiFpDJ/gEYTNhQ1fYPB5vn2j4MLEiZqAc31mIiKHNn85b/wzsjMc0CMrZ26Z2HtvvkoAO3MQt+AvwdDcitmvmQc8G9QkuzmZ2xdkEmr58V2mdxARmZ001hBaF+7fGpNVpoqmpg8Pfsa561JdNGJAOAbFLKM8Vt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=R3Ko0MAt; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="R3Ko0MAt"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7928d2abe0aso956549a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 12:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721848454; x=1722453254; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=R3Ko0MAtqHUpdWQR3GnYVVY45MyjBBCLxYovgHJhC7ioNvEKHMdpuKPG9x/4rcdIU6
         0203XCnhiOabosIfSp6koOJbcy/gsPpxoPSTGWl+czDdzfyEVIkiaH6hM1a74Hmp90sc
         zE3EoEt9UGppieLLmTR9PmyJr376W/rmsT5TyexPaaeVk0sIlGrgc0HGHHmOSr8C+7lZ
         2bvOeqeX/xlH/WofiKY/IGrxwvmNuwqZYKqPjoIO3kgZs/GtT/NkgMl0AdUZNo28NmK6
         8L5Mq0orNYfAG5DvNk9fLkl4JZ+KoBBTw9atSxCNnC8DG5TK+X6hkc+333E6jUjBdmIU
         uQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848454; x=1722453254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=bJXAZW77yp743EH3etxR5sqeKdQErNFih3G0tyVsTjYUB+O5/JJHZDOiUdDjZ7WCO8
         dD+DXHj7WrlOz8Soo59ghL38pfePk5n0jXPv4YIIt73kxApyiiihfStXP5oh97hgcn0o
         kpiswxUOz2gtHJT+C8JUc+sxMI0Gb1t5MIf95FC2Egx6U7j2ncOvRXv2XEYNEGAknsIB
         YCKDceQbosAMSfv6ax7jLD8RqXnsNkhp1nmgpEv94Ka6LiTEuma15Y3e9265E+0GHces
         S2ZYyUkaDMtu0d5TVHIJovnZenK7fWBmNnh94h38WQMHlBXdzKKn4palhd63fLK34grz
         hxGA==
X-Forwarded-Encrypted: i=1; AJvYcCUnczFrnpHiqY2ei72W6yGGMCs0vUM/HOCzm0n8BIq7fIADFENKwZEJwi1IzX8FyifXWuTsaoivszTz7ubW+j5OGum1/3Es+hd2+yM=
X-Gm-Message-State: AOJu0Yy+u+5dnqLTD2Rt3FmpCgGSj2xW9Tr/cnf58enw1Cliqv/MzpB4
	VK4CEMd+YYuCEp5uxhi90w8idpzUMBBacrZWMG9mKlgPpsNaPywaHAbLXDOWOMs=
X-Google-Smtp-Source: AGHT+IGVQ/7s5Uji8FwnkBAQuZA/qnOTv5FeMuP75J/li0AlUiYDJ2mhYeKo8pOgLH04he5+PNiRJw==
X-Received: by 2002:a17:90a:5d11:b0:2c9:63d3:1f20 with SMTP id 98e67ed59e1d1-2cf21f4adafmr940219a91.18.1721848453700;
        Wed, 24 Jul 2024 12:14:13 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73edecesm2022359a91.32.2024.07.24.12.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 12:14:13 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 12:13:57 -0700
Subject: [PATCH v7 06/13] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-xtheadvector-v7-6-b741910ada3e@rivosinc.com>
References: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721848437; l=930;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0jkC45FH0LUvSVfvCEJuCBZ027fqPbAipPAnc4zFoN4=;
 b=J/NcqcR2Zv8a6Q1N9svQLwZ8l2WXzaUXYG1n5aBRx93oI5TyD5lMzQmTpTt6lA8RjBCPTvqeU
 Ot5+T/1v3eABmYm8fvobV7OXx8xYRPHSVfU1an1UkyUyoh3so89Gi5b
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
 arch/riscv/include/asm/csr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..3eeb07d73065 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,6 +300,10 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151

-- 
2.44.0

