Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401BC15A4BC
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 18:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760347; cv=none; b=bBhBk+wUW0//XehKnQ+4Uqo6ATq6zYmDoQfQt3mp8jKdrZTKM2TX4mq91F4ILgwpGKUiZQbrIpF30lKYau3KwdUtg4JWS63Aa8tSFbDnxNCUvtzo6D7yKdQIkvHkrh2mvFtDMDLqbpcV+8ba6frNFkhE/FjIxtIf1sw6m/HvRD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760347; c=relaxed/simple;
	bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GqcDJ5jHkXTrXjzN/zy/iYXy6PgarCsqlxJH8iDisjB83OT7ksEmDPPE6VHg1tPDot/u4WixKJJfulcX3/9MuryIJcrNCCVbXo8ec4+BbLg8EYorSBoUe/UOb56/UGVf/SoRxid3ajlABYV9gs45dxfXIlVBhEZSYxMtt0YBFHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=xp+k/Ts5; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="xp+k/Ts5"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5e4f79007ffso6151397a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 11:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760345; x=1715365145; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=xp+k/Ts5MQiSkCY9C5mMODsq3e7/PSm39HZTXUNqc9OAs/E4SEDGJn3AiFuJpf7Rrq
         z2esCWhb1eYuV1OAnhUC+DiHoEI/PXqtivFI9MUMyilj/6FMsW1OA9eNkwlOqMlAShUi
         wZscxLYBd0LZRTkcM2/ybuJ7qGj95098lm3oG/devgEmoZKwGVfTzuOMPYoOPP+tUtuY
         SAFgGVh/HNOGSZIiyw5ut7+3CLLjYnzREPlmx/NlGHUI/Z2WgZB3um6MiEagE6QiE6RC
         4yXx0LvJc0CieJSymHKT6MivmYFrJLTwtxN9p1n6epGG0mPa5fOGZ1nk0+GmfkLIoImL
         qq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760345; x=1715365145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=rEuctgpFylZGfwDbr1HoZqyQVUfqhOoDyuy41hQ2uM+7eaAxGkYNhM4dNz0cPjwBWo
         q2pzcmCVqdnKZ+Cs2uUQOYS0njQSty/iWh8eTySRwNNIrSUB81bpkTcAc/FYqxmf4vn6
         NpcX5IB/wGb+NUg5/f+X1EE/u358Y2HnquCXEqO99Fu9zWXoDapX7g/EayiRqGWmhgdd
         UFY65lh7Zv125Tk7Owm217qD0o4BzRt+T76X4/Rfhh/8b8sRLTiOvdfO1OBPuP0vr2GD
         Mc4Qg3ttEwNCmJA8W5cY2BWuKDJ3GuImbDwXZn1a2gW3pCkAjUUtQLZePxxFQrG/mOLL
         mw6Q==
X-Forwarded-Encrypted: i=1; AJvYcCULcF6InMeoycB2XHF772wVzGMZj4Byk+sCduWAHLriJ3jJ8KBFL0pqmSNJHy8hzNlnEWtQEZs7d6AZquWQ/J/Dt6XNxbTq0NSYoSE=
X-Gm-Message-State: AOJu0YwlMWiFMHBWyc4OhVKNiVL27E96dJaMpk8QcReih9zTK5hmayoy
	2d5IzZ44bRaBRi5DHZtlI0+keYxJ80yBXKK5Qfvrgc+2maeDnTydRU+vd3sV6b4=
X-Google-Smtp-Source: AGHT+IEECXDZSf9I/4Q4n/a/t5WUm0gDjrNDmbYOkTcO7Anz+US34Ny/ZTMIDCzrSKUNOSSeVGrVKQ==
X-Received: by 2002:a05:6a21:4847:b0:1af:41d1:7334 with SMTP id au7-20020a056a21484700b001af41d17334mr3513429pzc.27.1714760345646;
        Fri, 03 May 2024 11:19:05 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:19:05 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:26 -0700
Subject: [PATCH v6 11/17] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-11-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760319; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
 b=jO0upAGaW4yuaVS+QlmhSO1SYHS4tq4RK3E0NqLTsJFEwtmVkVPPV6aSesGjkRDdJkKI3AOlD
 MqQ3qvdB+I6CCD8RbUq5POKhniZRS/torEK3drvyLlOJzCwBIrIBFcL
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 13bc99c995d1..e5a35efd56e0 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -219,6 +219,8 @@
 #define VCSR_VXRM_MASK			3
 #define VCSR_VXRM_SHIFT			1
 #define VCSR_VXSAT_MASK			1
+#define VCSR_VXSAT			0x9
+#define VCSR_VXRM			0xa
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.44.0

