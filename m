Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3297312E1D4
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 21:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721685518; cv=none; b=JJJjArIl+6IMfLtagQOj+bzBozzjKO2mS1erfywa9m3t0Rmia5IiZsyvFgM73tQbSQEueoZ3SDZ5LAxgbsBdXRQAKSkfrXyeKHA/ZN9NGUKRY0Bem9/5dx1RQTo1P2vXzseXouhO+hmfbYqmBy/siK5NUsEKV2gSnngqvZ05lII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721685518; c=relaxed/simple;
	bh=2W48pS8YjVGGuKgFcdTY4JQ+czvhIHjQutLR0sMQn0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W7q1NVqbI6RjvG6LXXm3JtY0JF+WaybzuAA2pAT+ibtABG76uKRneH1ltW/VHB8qykLKOYzceF5Yz1dNOPLBK8i5IKGyTesZOFYKLTpkCw46feFWRiappg1LZZGDewy+1ucv4+tIUWyy0sS9CkV2CWuSNj+yVMw2ozP/EMTPeog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Di8Mf1Kc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Di8Mf1Kc"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fd6ed7688cso1051555ad.3
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 14:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721685514; x=1722290314; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFlUlKNClOcGHl95zNXTKC1SKxBdILei2erBqjtymyU=;
        b=Di8Mf1KcJNBvV2l34APlwjSMKFsiw+00TwU/mH0hE31BXqDjdC8pSHCkCYGYiiaRQD
         3aJ0RX7ds6F926McFtqYMw956fk4DXea/q3o3S62+ORdERTd7jt/QEHDVwFDmdVHbb31
         7wawRNV55f5DN8am6EE7k3blSsvHYbTvHvfkT9IrHOMI45ZwlByI0i3t7sEVsHqMG7ug
         LCxXO8YGdDEEGw9B2iJnp9oxxF3ZV+zXtVpla1i1/vTLLhep9UGMHBaksd7IkBmpTdcy
         31Y3MsM1uAbY1jzRi7y0R3tEdnYrvOQftLzrfTtGykwFRaN0QXxs9zwkJ3FPooTruN3S
         +hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685514; x=1722290314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFlUlKNClOcGHl95zNXTKC1SKxBdILei2erBqjtymyU=;
        b=NSXLJoYTb72m8t9LidsjZc7esWmS7LxspCWoUrJhe5MtBxzjSmp5axNZRQ4HC+/sUS
         mnSBDtfTK3lJtbFMr+MdvMPDq2iKWyRXbwH3jak2vakPd+egmw3EZnB3HHgUCjaEx3Rl
         +33J9MfUv2QaeSnAE6SnJLC2O9BnXwHzZns4dkD+zhvZt3oDaR30sZFispzEspjoH0V7
         zUUrcAziP3L2ffSu+CntExDXaFqUrKcug/v1079F0qUOFnfzojGAL5bahDpMXdjlRFzY
         XskImDuzOXhz50x3WaLLYEjOjKucL0kXkTg5eMZ3tbePvAQfgKpB9c0VRlh6gCmVCc/Z
         bjiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeWNKFn9MG9bQ1Ctz8zDAaxP/th449twl3SAk2GojZTlbk5cHbV66m/13WElo/27zqnq6FLnAotFCsKSGAHo4CQIgNVCtTVN8zpzY=
X-Gm-Message-State: AOJu0YxSNUHCh/nRr2tN2X+nuB9XBmHbrt0QU1fs9mnw9M+CJm02aJY9
	Z6nD4H4pQZvA0NAiOAxaYAebodBZEAnTkW3lGbiofAKgfeETBH+obAf5ruDrrjQ=
X-Google-Smtp-Source: AGHT+IFmou8rSkO/pXeWqn5Y08peXHpQQZJpzoyKzV+g8WtXw8VSsTRAbxkcuTo+xUK5I20cnMuzOQ==
X-Received: by 2002:a17:902:ec83:b0:1fc:2e38:d3de with SMTP id d9443c01a7336-1fdb5eb14a7mr13001095ad.7.1721685514562;
        Mon, 22 Jul 2024 14:58:34 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f0d4sm59997775ad.219.2024.07.22.14.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:58:33 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Jul 2024 14:58:15 -0700
Subject: [PATCH v6 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-xtheadvector-v6-11-c9af0130fa00@rivosinc.com>
References: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
In-Reply-To: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721685488; l=1260;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2W48pS8YjVGGuKgFcdTY4JQ+czvhIHjQutLR0sMQn0M=;
 b=RiMnA1+g5SPgw4LGch5qdpL5lwgJZjDhU+TTicDgiDFxBQRLn7rxsOmNZM3sDkGgoWCnfcU5S
 OXvLmirQIGQCTiByNpwWBWeN+HWIBf63huJ7QRj0Q5MhE6xaF+q7Esq
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 02eb4d98b7de..b48a06ef80e0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -264,3 +264,13 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS`: An unsigned long which
   represent the highest userspace virtual address usable.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.44.0

