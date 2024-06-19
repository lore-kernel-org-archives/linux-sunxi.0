Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707B91607B9
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 23:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718841461; cv=none; b=ilGBj632SXqcpxreSac/6tFMFV6W5lIpwdgo/XhyozYsyJWmgLXUiZaZCUYYiSDUmWmYV+uKc/9G3QuhlZeW7Yz28lxsr85SH2tIjRBLFpDTVm0kI7y1ZBcYGw+dcAxuro74A3G4XZAR4RPahRA2LCp97P198Lmlz68R3ZuuIRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718841461; c=relaxed/simple;
	bh=AO/P99EqLjRLr+XZCKwsGlMw4bGAY6x2AzplV863nPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CNR9kXXWhiWhNmPVLjF1aN9zhgj+zKqtgH16ZY5/xLh7J+6cj5qHuFVxXU21PzjX7U3jfiHDOnJW4Ctv7393RfNuQh+zamjFdX7uWxVAc0tsRlJRL+OQvPEdzkjf80cN8iPb1hF3HwPaGesLTcSma1x1Y7bG437cUmsAB23jSG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rJ6+UMgI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rJ6+UMgI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f480624d0dso2544645ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 16:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841460; x=1719446260; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGm9bR48fQZKrjgDMB8aJbhbPwJ34IXCq2RfsHXoLZI=;
        b=rJ6+UMgIujUOtSfglOnmu/jB8RHExgha7681p+X43DQW+//CFxZ1xTSvPvoseovK+d
         CiWEmIQCtX4MbDbNlmnH3K9iRMohQtWBplWuFqla1cT4fVo4w4z855jOo61Tw1qUwCFp
         GGu4wF5TrD3Lg+IKPeChvjp8L9f8b+35D/gnSPmUblTcgCWQ+EXJ9xorTSPp7X7zqC9e
         fVZF5MCMVCctS5l9OjQphq25W+k9H68wMDw6r21cYoatVEosl1TeIHfm8yBdM69GhBmG
         11rDny4d1JD7hoWvnZ5EYrqvMV4owvp9umOD5GBXxfhz60SPspKHZA+WsEftqJVLeTi0
         BcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841460; x=1719446260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGm9bR48fQZKrjgDMB8aJbhbPwJ34IXCq2RfsHXoLZI=;
        b=a1GQWSwumy7MvZtQ8SJup39P/6FWiQfnAeUfHj6xGpAqpJUUzTAeh9pinn/JtuHHZA
         XLpB5IExs6ikmwi8bcz8g8l5v42xSjsbkQY+gcX52XmlUK9ayoT95nSBTLPrjF+1Jngr
         FEU8OOidGudDzHMI6yp9Zr5k4GLo1Pda8oMuJiKsJMCioKIC41GTDz42lKWEgpZIqLn9
         zgzzWE2W9gnsdTMtHd2/+qZIPm25+eJV8NPWTCvcHGeGXVe7jUfe4IX/pd2nUKqlDaX9
         Dnogx0zgLOKFGiKrsfvrZa5AgROuCEmkc+xj+OsZV2FFwwgtHMkiwiLhJVF3DWO0GVif
         gcTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsxtO+7OKxryJM7sbcgQDMPQLidutgYU20Z0Egil+83pxwjgJKHCAuaWgHivh9Cw1hK0lmqrGUclrVygXvaJyB1KpZqAGxfjah3/Q=
X-Gm-Message-State: AOJu0Yx50PzCPlIpy2sQpmAIbdBjh4/5lYuFZQvyipUI/IMECVrWAyUz
	ubJDMYxqR5EFq57uPQolh+KCmbdcPWrgO4ijOHIaDpkm6SVEuaaD02Or0JB1Rjc=
X-Google-Smtp-Source: AGHT+IGZe6+GX7Bjo6+EdbnkSSMv0ycmgYSf0lOtQV9jqcllSY9oN2x7oysal0+JtdKkvzepk85+Ag==
X-Received: by 2002:a17:902:a503:b0:1f8:393e:8b9a with SMTP id d9443c01a7336-1f9aa3faf67mr36989385ad.33.1718841459802;
        Wed, 19 Jun 2024 16:57:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:39 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Jun 2024 16:57:20 -0700
Subject: [PATCH v3 07/13] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-xtheadvector-v3-7-bff39eb9668e@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=755;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=AO/P99EqLjRLr+XZCKwsGlMw4bGAY6x2AzplV863nPM=;
 b=zhlgALb4EtAKwwNl6/SMtNUUGYnH1C52UqTG3+qHZUZP33vF3PwPV5WduUrw+JoeyKIcO9QR+
 RACEkaXfrmZBz9gFsj9GClo/uIZ0WJqc4L96CkCti6fvsaufYtXGxmS
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 18e178d83401..9086639a3dde 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -220,6 +220,8 @@
 #define VCSR_VXRM_MASK			3
 #define VCSR_VXRM_SHIFT			1
 #define VCSR_VXSAT_MASK			1
+#define VCSR_VXSAT			0x9
+#define VCSR_VXRM			0xa
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.34.1

