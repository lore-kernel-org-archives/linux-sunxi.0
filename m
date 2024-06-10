Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B9F1514E8
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 22:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060220; cv=none; b=EjKIgPpDR0gslh0iSmmVyM53Cc0dYzNjGiM9YFIWhQCS9zYI9K6HK/Ac/2S8kd5hQUzpPtNm8sUMIbVa+gcyH8YesxL4ZJGzNnS6ypRRje2tY1kFPSP2fbXjO/hcFj425anWJhP0uyjS8DqZN4T2UDmJtaoJ0xD1Ce5GM0sCe1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060220; c=relaxed/simple;
	bh=SMA++MELxtndsmlf2ltstvee/EM+yG8MF8KTMj9Ilaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ma/sfEkeEDYi4qfa7h2uGtizN+Rp58+hUPqlgFxVRt8RfGgTegH9aw4Vlp3SR3kaDMcjZ8eP73JrMCcl2EFROWjlwvoNHqxvm+IcJnSFz/BPcW4jP3GPt1/v2Jbbl1KylRETceWi6TEruUdZ464UpeFN6lE+vEchTvbR+ZcvuKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Eb31MLYQ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Eb31MLYQ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso4068046a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 15:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060218; x=1718665018; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P240Gh/m4dWtpIWWlN8DjDnG2wL4gQcnQEBhQHOtafc=;
        b=Eb31MLYQFDcPBWLUy6cp1LhmoSO2/TUrrnr1PDb4wg7d0LoeDVpbT8McQv5wXwP9s/
         qizgtcIW+OmbWO84Gawc0k0SEmiRYjvFl33SY1iuyvWckOL4/k92Lyu/MURaNMXcceMJ
         BXLvBuM7f8mojkMStzHnDuSJNrXGAtxYc1shhouHIJ6O33gq4Zwy66tDLDlc1GDdcnbB
         7eRvLu+lkiVpkNr22OiH+YBelHdNNypf6q3SlsAbdmVc5FClaUOquEQBQyeR6GP9a5cw
         mLvNRnwT8HqSQcPFwZy1iMq/EOkLaAijJ4olT3J8GqZP9kr0wF1f3um1rTo+uFp1YRVe
         UaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060218; x=1718665018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P240Gh/m4dWtpIWWlN8DjDnG2wL4gQcnQEBhQHOtafc=;
        b=BGshzkWS5hfh80n5qkZye4pjzcHmMHgvOVX+kx4dzf64ll7azDVY0yfOgMCMpm6V/c
         96c1LX27c0/caAseX7n5H4ncuiMpb5nssewF7GVcuSB5xpGC+Zh2C+2BIHwXUbWnnfFd
         XKQukRmLcxHAhVnEpZqBfp6dOOl3dH5qvJBTzYX4caqUJrTS3UgyCJWS4r00Rwn3ppDI
         OX9dBZkFuyNBUn58DT9l214XAaKai/9cyljA4zeCuy3pEILJ8Aet1S5H3tSu1aYR8hw6
         UwL/BIWGrvarHVVp0sGAQxDbAB08KaqwFykIpD/zN6h/AnLHA+zljyN2tZegf+6wse/1
         CnPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUZ+Ub87IvCBvR/1iFgEjiJphoqx/W9FK06M6WVVM5xhEGsMQloHwgqlqwd3GHLl7zytwqGVAtEXATr5OSgSMaJqSxhkzIx5fox8w=
X-Gm-Message-State: AOJu0YzbeACT4Yr3uh9Tm2N1Sg49BI8auYkmWlyIjoj25sk0DLTtb27H
	qzRS8sa7Nyn4DkNSeZweMg7+FGofH8RL6z8MzpokrgGa/prJt+6d2c7YAy0w9mAM9z0vUSwalX5
	K
X-Google-Smtp-Source: AGHT+IFseKGLwmj2osLDgxyS4P9gQTqGeoZhbSAjbr4fblHxFDjXaFSWzLh8Eh75n43SvPorzoMJnA==
X-Received: by 2002:a05:6a20:2d0e:b0:1b6:482e:b71a with SMTP id adf61e73a8af0-1b6482ff7bfmr6284268637.62.1718060218334;
        Mon, 10 Jun 2024 15:56:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:56:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Jun 2024 15:56:43 -0700
Subject: [PATCH v2 06/13] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-xtheadvector-v2-6-97a48613ad64@rivosinc.com>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=rl/YEju2Da4Y30TCSeGgcBJQ4jtog67tmUBEGN9KrFw=;
 b=IRhCPk4XbmkpRzK84lEWmQUutCnAIEIrCrTYoyF07vjrds3h/wdbdAbFu3f7IKtjrQbzVrH3b
 BQdDwVsjJq7D1QtIM9g/0505gvg5bTytwfowlYZHjPzLPpzNFKDydTs
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
2.44.0

