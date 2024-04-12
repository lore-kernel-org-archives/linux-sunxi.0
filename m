Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FC747A6A
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 04:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895113; cv=none; b=R9m2Gzl8Lt4/97GEseaz3LGPfM02Qgta15xwCJ1bE3561dTSQwxb9plb968pc+opY3s7Azz2vTr/qIsMm0sgdnQ+Kr6IVeh6K6ydXn9A2J+O4UVAJ1m8WnNx6DwIQxrj56hN+lB7Bc4/Uzy0hXS9ZR60GMg9c8rz6vqZkH2Uj8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895113; c=relaxed/simple;
	bh=Za48erR/9zmvplWXXS8ODcV1Z9QaGewR60ryl+Ilosg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufcEQ36ZjDzQ94qIrCsYqLhtfT395WGCVZe8TWBkCczV6brabOY1ASr1/r0AUZ0abTE6TzMDM4P3E5DR6ve2zZoM8jeFnWrXfLivaF0qvWH+CzsS/mKaY3NTo2/hWil3onfsAhY9t8tngFOLHaUQxUlY7WbUVNvBPfsdBOABLO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lcRC45kv; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lcRC45kv"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6eb5887f225so380053a34.2
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Apr 2024 21:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895111; x=1713499911; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/cX7KqBpjbvwnfweF/+d0sA0CANzzmggwTxwJIRs2g=;
        b=lcRC45kviFT2cEcDPOSqifH9HMt6iRDLAbid11DyVMLkfInSOoAJQrRZtryrdCuU4C
         AIH30Ct9ldfjRSjj5cLJvX1evei05MUNZdudXdnANQhPJWbGjalVJAyp3dEFOgxiNAKz
         JTTJZ63rFCfjpNxVqAlMor+2cx2JGXCwyVIgGaM97EBGfP8ai7038XxV6BLnPzroxir9
         gVmbhMX+IR8Aa14tcBXElxQ8F6wavlf3PZp7qUGKwTvrVBL7SRMXpqwcQOs6bt6Cm3sO
         vtXXetLM9T0dKAc27YLDenFo1Isl7PPpY3lUxCD6z3gzJfOaxmx1KuFEmpqW3yAbU5iu
         yChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895111; x=1713499911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/cX7KqBpjbvwnfweF/+d0sA0CANzzmggwTxwJIRs2g=;
        b=SeVQHY7QBT9Yv6G4GP2AEWOKOkMII8MK52MrDR+BVerG9iGciUWUDto6Qgfzk//kRe
         +dYoN3kPDRc1p0S3IZhv8Yf/fG+bxstmUT0uKg+9zFRvZvQWcqF6VdAPSnFIwk3PXbiq
         1vFtAyJcKM4NOD17qq13YhxMDSkZPHLfXOqajbLPyGaWMBAxU++Za4ayR4R8SdQGv2Mg
         P3ZE57yd7G2uqCNENlUjaH6YwDCO3+aVsl9VEw6WMKJLCbzq6NmFOYThE4hESyD9NB1t
         d3CWmNA1cHwn4+PUf/PcbJWTdJKcmSHQ+OmPShrMn6ptfJHM3OJpCO0P9zjOSKOkPhQ8
         dtqw==
X-Forwarded-Encrypted: i=1; AJvYcCWgO+iaJFIrmHU+cfLqnTyKp3SLfq2aHDdlKKLjVgxaNxz6U7P8oGz1/xq/8YwoXiNHtBdtfs2tZ8AZHe5fkVXSPMWS0FeQhKgvq5Y=
X-Gm-Message-State: AOJu0Yy46tClQJddT3OC4KlOjTeH10wp0pDXWdU0Agos/8l57KqYP42u
	fbSM74cB9TtK1TP+oBXLWoASAUQXxl7FMN9Kdx8mMcwra3DB3nj4mSr4RUgxHf8=
X-Google-Smtp-Source: AGHT+IG7xfdr9GM09kld+gpoTRj53E+tx3TX3WdgGh40cliYEBj/2eByASG+/EjGzkDhX2ZzYVRIWg==
X-Received: by 2002:a54:4781:0:b0:3c4:e208:b784 with SMTP id o1-20020a544781000000b003c4e208b784mr1726036oic.27.1712895111330;
        Thu, 11 Apr 2024 21:11:51 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:50 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:16 -0700
Subject: [PATCH 10/19] RISC-V: define the elements of the VCSR vector CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-10-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=899;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=TuSThplyvDtTVWqwUFhV/gX6CqguLjbnzElxxGAX5lI=;
 b=IoxQnX7xJtd3/O6TEZTN81ZKioZw5d0r4tz8jwxoksLzmt6rX3y60kHb1haJbdArKfd+lqIbO
 ic08kmN1+92DSy5wQJq3UBtk09zK5SOAjN41rNduYXhvK29guCQEHVa
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
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

