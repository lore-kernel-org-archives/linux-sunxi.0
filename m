Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A1950A93
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 04:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895126; cv=none; b=jddwdnHuNt/4W99kX0E5maTHvLjEM0BfEyM2dhRgwV41HMh/yI61yLpgwYuFaWPzuGupOxHJrWhVv4upqeR3Jx+sh5kOivzNQwvRiqnZ2UC5L9VCa5oRTtZCHpLi28HDHnRZnNkHuCuLN33I9Q8t4jA4iA0DYojOmGbKaEXhCZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895126; c=relaxed/simple;
	bh=t4tv2YhM1MolJnYPmx3+B/R7xn5gYh3VtunEyUIwVAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2ZmQr3lN4U5TnA4ex2cw6KTHxH7mxvmJBHzF6DIlESqEgYpOZAejOD41zu3MWGbAVpdg2Qs0/Rjyxmem9ouVkTPb8NNW4vXms+A3pr0dJBMxKMgzsIcKm5ut7MT2bOtjrxr1Mwl6zNMN8BJVJkuUFCdlYvSxONgAencS97FtW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gUUmuhkB; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gUUmuhkB"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-22ed72b0082so338283fac.3
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Apr 2024 21:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895123; x=1713499923; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCqKMMvpjdMx8mqL5GwN/rt+g7kii5wG+xB+75rraRY=;
        b=gUUmuhkBa11xiUxPOb7VYmIpMgn5McvPfievdO7eHlrJ0XsAwh4d6Hux9/eLbPD1/5
         CkA9sqhxSZv/8MSTQZwkRVzy0U4uXxU3rVIHe9UCMWFTzm/9pyMM3Icx/de6Bf8fkalI
         UUOrtsoCuXJMwwoV/u2+VAWhsii9N27M2YBBbiA6588maTVZ7PX8rk4uNOBgH+uODkLi
         cYir2FgxnYGQGk0WABw4aEz9bhT7Vxz0tFldaQO0icMyY1GDMQi5yBCs5LGzJ2oH+Z8P
         d9bXyG50he1ZtMppK2XQQ3Qid6WvRkKHdXW4DgDxSatNiEWxTovlyZSptN9Y6EgEZigW
         iUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895123; x=1713499923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCqKMMvpjdMx8mqL5GwN/rt+g7kii5wG+xB+75rraRY=;
        b=FgSf9MnVkeZ3WzM2ehT7xj9EEdeQPRHWRvs4TJZ22Ip5lH5tycnXXlWJgfKmVM6F4f
         Amj8n2N/aZqvTYzef8t++EVvyZdm1HpMt14owqBCB94ocuTRalgjgKOINfzn9v+cf+rN
         Tj5bos4L0Sjh/unAmRC57f2Flc3TsbENwLStILNqEWpLs8/tpK0vZc5hKloizHtgmpj5
         FFzsf5+QvSilTa3zwAzHWvj3ZV466gHh8sbLto5C+9JWEWVDDt7hM9IyS7pz0cPGmcG0
         pfL+t6RxLpZv1heILOvpEiypLY3ObHrYgNlERoZwci69auk6oeaJ78zq/NCBMP5Puc6g
         POrA==
X-Forwarded-Encrypted: i=1; AJvYcCUYihcKe8Nt5hyTC1I7OBLY2Wd1nuZRWTcZXQk/w43qXZuHAZhUOp5pd4pETxBu2g5YYkucat+yzoFRtV6Sb7ak6rMWk/kAjUzxRSs=
X-Gm-Message-State: AOJu0YwWMmuQNNN0hj/mIZ5iWTmbxSpA7aRyfrhCzyDs1JicQSHuTX4z
	3prBRjS0cwZzMmwXk8cEOOrEpcmqWUkLW8KupojFwGA9MYSSYBf++93RkHH0Kuk=
X-Google-Smtp-Source: AGHT+IHY3yirk4jX9cMXtaF98jtTfUbpKOv+CODCxv0iWIStL6fUZfoLpzSjdgQJtBdDqv3RCGYZ3Q==
X-Received: by 2002:a05:6871:5314:b0:221:8a03:6de7 with SMTP id hx20-20020a056871531400b002218a036de7mr1825489oac.32.1712895123342;
        Thu, 11 Apr 2024 21:12:03 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:12:02 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:23 -0700
Subject: [PATCH 17/19] riscv: hwprobe: Document vendor extensions and
 xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-17-4af9815ec746@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=1314;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=t4tv2YhM1MolJnYPmx3+B/R7xn5gYh3VtunEyUIwVAA=;
 b=Z4LgpsK6Y6OJvIVl61GAR3j9FIxHWvGkBhRPZ4DETyx4FdNnrNJAGGqYj86rnsakgjClK/luR
 oXhBD/8IaVzDn2iAyaUVP0kpGgWHWoI+hy4jtykxh3ZbjrZ13vpa8kd
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Document support for vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_0 and xtheadvector extension using the key
RISCV_ISA_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..38e1b0c7c38c 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -210,3 +210,15 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_0`: A bitmask containing the vendor
+  extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior. A set of
+  CPUs is only compatible with a vendor extension if all CPUs in the set have
+  the same mvendorid and support the extension.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_ISA_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.44.0

