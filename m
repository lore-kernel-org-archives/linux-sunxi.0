Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7B715FD19
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 23:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718841460; cv=none; b=SyKLsTp52nA+7sQgGoDNg19DiY17PZ1g40MLIAP7Wgxr/AsjsOJObx8IHZqluSnkSxIHeYeaQPOIKL/ENat4Xnpr/OTVgZaniKuhspY/g1107/z+Ps4vupWDVp8mCi2+J8aaVOcWzddE3dAkZHPGiI0VDBwVGmDf2uPkTNj/S0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718841460; c=relaxed/simple;
	bh=iVhHTovdfTsoH2OEOycIDBjVgs031JyJ35lxs4Fwvjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GmF/BgeTpJIoq3CONrWmMCSli3PCG10T9Sz2j+0ZBrZQgAhM7RlS1CDZxNUM64lQDT3b8Sc5kBrmj29ZIFSWOjKPavL6Oqum3hdWzNb7MaEBb5kHsUkUpDwQrfhuZdt1veQB6TrWkwOhn8n16teB7plh07m0YXQ96RKRzpKRGNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YibQEFY7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YibQEFY7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f9b52ef481so2779175ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 16:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841458; x=1719446258; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTwy8+5rnzy3gl73dMXkjs3dSWWWtlQ/UyJt8IClQYA=;
        b=YibQEFY7EF8nc4xWlTJUYo4IupFdGMnHduOzfbhIYEK3r2M9OdleeqNHJ8spCoXXeb
         T6oqAGIVeQ0MYw/Ut5L6j6dIvjv1TqVAUAZC2R4+sjvKzGhKy8DuYlQDZ9zVUbvCIrwx
         EzoiEVG2wVQ3aH5BEh6u8PJdspEFYyyHyH0ijyWAkBEtvD45V4UYYedAYlA5m1VyyYDH
         +nKR+1QzzvBoxyoRFiDXZheMMjnllQjUAWaRa5NYkQQsyWyyFKyq0uLFLge51lrUPJWj
         WJreM+OO73fCDfJ67hR3ka/p2IoaWFpfoh+S9VU4xyuUUAn9EGWlDlShr8zNyyGYaBCr
         QT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841458; x=1719446258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTwy8+5rnzy3gl73dMXkjs3dSWWWtlQ/UyJt8IClQYA=;
        b=Jf6SP8RzfP8fVWMTDJ7l4dXEkY9J3ScMIT6OnxaJi2b5k9m0hsGOE44f2+iN4tBjyC
         hEL76Hl2ezEcu6nx7+8geg7AzW9vGQ9ySt/iTZ8ViWgdRC8fDAVmZPTiq/QnAWrGgsuZ
         waAlAQ9c4VqUirgxbONtOwF9jmLlxcUkaNx+jtuN8bhy4OtllCmed8+dYZE/6CCsM3KO
         wQVE59byJioiVbMpz7x0OvPSmpK39ijtqSciCTkiBIIay95CaZ3NGdn2WpFN/W3yrV4Q
         rbHY2pjmeuR1oc4q5xD2fgIWVSd8Hhgsd8Rc/2f26fqkRNuNkzAzxxbT8a3qfnKKaQIc
         47Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUdjt9Qpst/HpyaP/kSfAsxh7nVuzPFfIMIHxJpyAywki6D8tws6LgfQ3ClcGHcKVvJXtSBfFnpNVGSZ/gEo/40wXEK/J/Q6g5G118=
X-Gm-Message-State: AOJu0Yx2vr8ogKaVY5xwFWfC5+aEz5XSUJc+5OkQcR2E9EgX77GquWYq
	rojSKzjttXm+G016EX+P/eWU25hQ10aDBDBtAiXKBkNJ4VZVLLUlQJ5BhowRIUc=
X-Google-Smtp-Source: AGHT+IE5GxcCbYVUqRQAYZB2fGalRM1/KcCVgJ4MPIDeYCRSoNUOvqpKzENG3PJ5PkMVuBWcY7ClxA==
X-Received: by 2002:a17:903:41c7:b0:1f9:aa05:879a with SMTP id d9443c01a7336-1f9aa461e71mr43504705ad.43.1718841457808;
        Wed, 19 Jun 2024 16:57:37 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:37 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Jun 2024 16:57:19 -0700
Subject: [PATCH v3 06/13] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-xtheadvector-v3-6-bff39eb9668e@rivosinc.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=UncKWDVsLq8cp22oK+C6VrFrX0H9dgX4jkpq4hmlQlw=;
 b=WbT1KOfNMU+zDjaO9lUICJklFM+CBWd14ygVC0UvezCEX23pEA8YTxFkTdvkWoeBTPH4UfPSH
 QPKAbtQJEsYD2JPv8TzVdBwyR2ZgJW/8on5XEWLAtlUAP34WCF85qPz
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
index 25966995da04..18e178d83401 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -216,6 +216,11 @@
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
2.34.1

