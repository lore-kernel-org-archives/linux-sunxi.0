Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B23679ED
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 04:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240740; cv=none; b=C9M463mbhIeuRukYFMRDV33eL4o3IS6A4ouYF1EtAvFJfsJVPK9GmHYDBIz6o4Nz90+RNZBaMDifLRkSzRVumHoB2GI6KGOQRRhJsMBZ/j+6YKa1XcWIvBQvSgP4c+AfI7fZreUjU31VrUFTONE2qxB2EpYP1o2Sprt6/uJtlXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240740; c=relaxed/simple;
	bh=wcB/ebDhkfkPBVDQxoUt3AjUlhzpSXzz59SF5DkeLyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g8CjRZbUT+svWu5Eh+LH+6MdY9gLI4xn/bCAXjD+72GtAkNzynoB9wy9Mc9LUG/rGpMbdQ9W5f2M+3veO65zaeg/o32Jqf1sA2vWHQCxp2HpTfWgOpCtiIFNeWyau9VWyGPHgd4hheelfr3JxTtdTsoe1nIm6ibVB979eJdjOxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=NNpuS8SQ; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NNpuS8SQ"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5aa400b917dso2573885eaf.0
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240737; x=1713845537; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=NNpuS8SQYEJoHXazSnMaz3tsUY7/bTB1l1G9oinHTVzURR7t8ZVvn4D5rDCP4yTEY3
         S5BFoCsNAzLRS5+TaHSu8Qwl1bOtneJNqo8u4DgJq70kaNrNSWKIvg2MNV8yhwUfTeaR
         pKQ+TPKc8SRDUPhOq7tegU4cMoO/QFB3MrPN4KEp2ON1S3xHqZGZaPMt+FrTyXN7M7eQ
         0mb4ItSvZ96784pdD0ruragbxITDvYvjeDvf2RIo9lQ07dnnTFAnHP50DoDUYaJ5ErqD
         bNtBYtrIEx7+OSZaf0P0mrtntL3IeL1ZJYpJ8Q1eeACqBjC0i8R4cwwA84G1GZZK4zej
         ZnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240737; x=1713845537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=Ub5jZy02byNgJQD33pX5xqvi8C4j9NR/GKengazxJCIxtjyw57VAEvlhmzct6dpElC
         /kZ5qIWHT2HQlL6CIjAZl2UVUHEUC0JKPEVZdw3FdMLZh2daecTChQ8FyVQl+bqec7rW
         WKHTDgunCf3hRahi2y6SRLGKPfhicOZvYOwatC3LHRzCj0cjRwZY0i+5WHrLWP5GcPsS
         H0l/oI3AHleJ5/sDGMfckVzpxklrJo2Rb76fxAalWT9Dt2aMvEhhKM2ntD7ATgW2VS+l
         gWSM6nVkTEbvdzmoi6gFqdFTCVzQrRazUxgCyikpp870MCYcGAPyNOOXwN9zjjaOhE3m
         mBEw==
X-Forwarded-Encrypted: i=1; AJvYcCX/Iv2eHRzIzmgPu7y8A75G2sxQNzche7TFRcOAa77jvFNIGdDtAp39wZoiIapqf/JGDD0i8bU/FQmiruESwCNsJM5EUC/dCrf+fFg=
X-Gm-Message-State: AOJu0Ywt1neVNRfQilE7ixGlcKGkw2WH/RKrGnuF7SpmxuieCpcwJMtD
	BWyuVBpvSIL8hKs1SXS6P2UojOarCTdq40KNdH4W/R/4VfgK1RWMpmCjTy3ZsRI=
X-Google-Smtp-Source: AGHT+IHkqiMkVjxP3CYqN1RvGEvTVB4gtmkT8yxeTu0gT+YMQ6rgsqh73ctLt3AZ3AdSqqJmE2B/vA==
X-Received: by 2002:a05:6870:b293:b0:22d:f859:2225 with SMTP id c19-20020a056870b29300b0022df8592225mr15026805oao.6.1713240737601;
        Mon, 15 Apr 2024 21:12:17 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:16 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:07 -0700
Subject: [PATCH v2 10/17] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-10-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=C7F1c584ODJM4qF9TPT5kMoM8fDlOPYyEMw6010Mea8=;
 b=gL5a3gZt7YmAzdC8JCIo8MXcZ7fbdc6iO361KpgkRlf5taEU4xnmrghYwi1t5py6BJP8PyQO9
 P2I8p9MxL5KDfEXe96mXU4uz3Aeg9WWgIVAt+oJLRgmHkwkJ4xayrK0
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

