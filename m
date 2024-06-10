Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD1822638
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 04:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717994752; cv=none; b=TmNowr4V35Z5S951U8xH+h1O9JANdFMg0GyKSl3tOQQID+2PI7Itui8JeNjRG0D/Fg+ktxhc5pVEZUqqbTx0FF6XI3qzGqFx1lvlh9qeBEsBilqAqfPWjzzE9I3LBbf9OuFcNNFcISIhN8Fbk2+Yl0/c5tccmKW+zdjDRZa9qfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717994752; c=relaxed/simple;
	bh=YRbwjAEMooOC1Wqfne0YGBAOlvdWm2exzND7IqGSDDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxhY80qbD7ZXyL3lbtDCupfMtOcO8djtEINAJniM77fGonpkKyYh8dW3ViiSjyeBYL7p/0jmjDFEAlQaNNUknnRZqx/akP2s5YpK1BqOEBNOgf/V4qJz0spVKk7SkCwaV70hBZtkbqhkYi5Nk0X5HMRhPXcEijT32t4owPxVDHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=NtTxUEBc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NtTxUEBc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f68834bfdfso29473225ad.3
        for <linux-sunxi@lists.linux.dev>; Sun, 09 Jun 2024 21:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994750; x=1718599550; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HBSOfNpcERRo+IfFfSUzbZmQ8OANKCSab29OA8NgQg=;
        b=NtTxUEBcPX/cmdnXqwa82LfJhW2u1GvS9C68sKnziFdzw6E4DbCfnQ9/PzBTn1cFHh
         YLRw072KZ/IRF0abbBx+TlyUVtfVO7+KpiRVVth7ZztDOjlJ4dXXiGMjgh5T+X+Cancs
         o82fLt1me9I2AHZK0sB8I6sRScOevSGYEOI/ruzymABhbmW7aCu9ygjZK+oHuLdOnD97
         FRPdn5kcAYb7AhWU7tOgSHSZsmSRVU7gUqRkq6sjkx0BVq7BZdmSJS2afOEIcD8EAeCB
         NlgTtfmdRF5l0Mu/FjQFBkWvfaNayZXf8apgGjhFsgzy3SpYixDn0xXZqo9NKl+Jl521
         aLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994750; x=1718599550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HBSOfNpcERRo+IfFfSUzbZmQ8OANKCSab29OA8NgQg=;
        b=cedNubkJeXdN3RbWHmfZJDhBVrM2/be9KLbP19+th1HNbswRYPCY24OIG8k/QKudPL
         wCXL1j5eiC6FNzDCpMS7ugr7EB60MOJL9xRWjSH7je//HQpHR7THysWTrF+xht6IRe3I
         73p9TjfZlZgdB3tDdznqATDLc+kMA/f7PtjU+fGI2iyoKN3qdU48zJhr/mSiVMeceKte
         +cUbI4MbqLS4zWQp40doJmo9dPil9wBO+friVF65iAyt7dJc0OE6CvYd5PS3/udQsQvP
         3flZgaojy6qpzzFKChF7Bmyb0a5xdMR2SetYGkJ1kB0XCBN1w5TYMxya4kRQ8wv1QZxK
         wGSw==
X-Forwarded-Encrypted: i=1; AJvYcCWscaNH0W9GoQOj1JEkdNMZz+x1KpfaEykFKcmtWRMWU/blJcQh+2R8aqSVXMtQYfsVAe7UOj1/WXhzDpniSGd+zxj8qjUZZXvkOK8=
X-Gm-Message-State: AOJu0YyaPvGUrS9ySC4RRvAb6naRsX8Wh+rQc9nPeR5+lmMtKNTGzpDY
	jRB98mk4yShaD1n94fShwRQwJFNYZ+gyjGPWsmzJp/oRd3TukVfmkY/PZYmm6oQ=
X-Google-Smtp-Source: AGHT+IFokGlovp2IkNoCK67wcj7YPJ3AH98Sp2QxsCqsaBawuDAm3x3I7E9iE5QWcbZgk110G1+MgQ==
X-Received: by 2002:a17:902:d4c3:b0:1f6:326b:cde0 with SMTP id d9443c01a7336-1f6d02f98ebmr107670705ad.31.1717994749999;
        Sun, 09 Jun 2024 21:45:49 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:12 -0700
Subject: [PATCH 07/13] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240609-xtheadvector-v1-7-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=YRbwjAEMooOC1Wqfne0YGBAOlvdWm2exzND7IqGSDDM=;
 b=99wn/niA0cQScW2RZHdAYs/G3d+6fucqbAlEziDCOsNFlslIJ1kTJdSJRonbVlLwckEyjZYSv
 oLpqsYahmVoCslt9Y6Si3QOPyFQR5kdwcQuHfdy3fJPz51XrWIzyAzd
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
2.44.0

