Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AC136AEC
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 21:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714167432; cv=none; b=MThOMYz45uFtwOdylEV2Z10mXMiTnOPE1kEYamJAfut4jXIXaNEJQaHM6SRucTfMAmKrnJQnokLHMfTKalcmeKUTsUUdPXOkuwq0cEBxTuEbKtB/eBmyLIviYYcQNHr82+OJNYJHWqpclZ6MjS2FiINyxmApWEyRIvbd4gq190Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714167432; c=relaxed/simple;
	bh=wcB/ebDhkfkPBVDQxoUt3AjUlhzpSXzz59SF5DkeLyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GrBHES6dC4RwmRBazDgeUd0U6aT3JgrG4kTZft4/yeLCKFAmb29+jMrap0RSgYarOj4EvPyQ3AwxB85Pne9dS72x7P5m6i+XwSDw6M/WW/r4paMmzcRy4m/a/S2Fk5hkhk1WLTv4gaA736sVFw/S1FbCQALHdgKtHPvKXFgFTtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0FIr4K3l; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0FIr4K3l"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e4f341330fso24774865ad.0
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 14:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714167429; x=1714772229; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=0FIr4K3l75UV4rnYDiKPC5qWnM5hantuOf6XmNGM5IYdq6pMb2KqsYchhN3t8YxUzW
         s9gSLZef4/vVgcKLqVK3ZJm1XufUi0CzaVHqSddaBCqZbamdt+98Qo0j4NEa/zFgy+LL
         9pTlfqBatNNu+P9Bpz9POJDtRkCn4vFmPsAClSDux5BoTh3h6VB4PDk8TVmf7TAgGaJc
         yJ4JrOHPs4h8TRhxv3ChASn6rikoTciDlPXT4kJ1hDSmG0PmqD1H6a5EV4pQn6QTUcVK
         TrnnMe+LBcfCrjmIdXrxVw7Ew8fqZ1BO9+JminPRB4dvxP/QhT8M9RCXGAZ6ZBJYysLt
         NnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714167429; x=1714772229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=KkMrhd12Dr0zHUoGOEsaZBNqYSXs7PI7N2l+qPqXpH8tKq8t/f/c2VQIQ10tjGblrD
         o4p/ZAfgyeIEbvIdfxMDT8fjcTU9scG8vgExIi+qXT/lz+ur3YsHeRMGXmyN6Yoo5qEe
         iRT43gjKofPiFtfy7jCxMKfzYPT2ys7O9XY8Woe5hMLHzjYg3PVaCwkpc7YFUPzfWT0x
         SWDbgZrQVAJsp527LGKjfgvYAXIREumIlfmnz0yl8+2QPQEZBerXa3d0IFT7Yx2zIBvA
         EFah5WEVjqJ7/D9nz/zKRIVRM9kbMKxXDUg4KcKTRWVKpkaJvT9/ngGkfnYsc6Wo1nsz
         4XUw==
X-Forwarded-Encrypted: i=1; AJvYcCX2ue1k1vt5SCRI/C0dO6+LxymSCbtyAADYN7SNqpLfGuLKVuPys8T7MNoV7LfcD4bI2R4CW/HJTJ4C7cgMvVmGlC1CO1En87PGR4I=
X-Gm-Message-State: AOJu0YyJDAl+DMFPLs+F9709lStWxU4DP+N48QxhgbY6B6VX4ciPxi/D
	UvZOdMBmXRyXUAQPeGHJ+1mbRS/4Z9mzcgaY4VWwJGYWXDL6++YnVTbefTSb+qaFSAaPlQ5Jyj8
	G
X-Google-Smtp-Source: AGHT+IHl0deFI+kKqJJSXtEo4lw1f4JLDe4eTcjXBFfcgornPJnmm+jN4W99Vb/Ph2g2fe8Xsa+lCQ==
X-Received: by 2002:a17:902:f684:b0:1eb:51a4:3685 with SMTP id l4-20020a170902f68400b001eb51a43685mr382124plg.52.1714167428813;
        Fri, 26 Apr 2024 14:37:08 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902760400b001e2936705b4sm15935701pll.243.2024.04.26.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:37:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:37:04 -0700
Subject: [PATCH v4 09/16] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-9-5cf53b5bc492@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714167425; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=C7F1c584ODJM4qF9TPT5kMoM8fDlOPYyEMw6010Mea8=;
 b=+Ym/PXnw1qoA/TfJUg74ll2FQ3kDna0sfz28N0zMDelkAV0Bsm9v3B7NR0DImwTgQCifbv+07
 7SqQy9BhbS9DwC8AiBlZXnX+89Wsr6daBED+F73ctZ18G6TF8mNQWu/
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

