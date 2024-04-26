Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C503C06B
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 21:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714167451; cv=none; b=Mz355DW7mCxRVOzwa/EvUWbNHp89Ux57LnYSmPz2mIigLjrKkkUMZsgM3Ar70WCN09w9l3uZFYVQepC94bOV7h81m2znIUXp0UxUWpBYoxyt+wgsWHFTX3iEmF0Uqe/BlaV0j45Ioq+yZdFDW21NsDMNEwsWf+hY+XdQaxPKjiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714167451; c=relaxed/simple;
	bh=VVos6nAzmHOy7EOA1ppaqJ4Dx+U57WxCTD6XuCvS0Gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svqTHY6dzvxddcU9iW7oqou0qiLENclW+iiy9q3FAXw30/qKrT9ClhFqkjje1SFTbChZ6JPt2LOALl2tYbB9xjzHqrEyHmQgSQO2Nhe59tb8KkSc0xLRThqCRFc8enr7YxKp+PF5263OqL6sJHK/xZXsWhSHLQtxYogRzGWAYNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=STxLRUeA; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="STxLRUeA"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso2284847b3a.1
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 14:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714167448; x=1714772248; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3SjbYRlfVLcKXzSMNjYRrKo8hPdxAu3bA3GNGrI0mQ=;
        b=STxLRUeAk1SWwkzw0Qd1nUvQ+dBCNuj4sdxw9rCxdNX9mCrM3iOWO/AeKsRJLPShv7
         W7kCvMnCD9ltP+LwMLLLFpdtkauShg4m/Jzrm+keypwYc++omXvPG89DD34Qf5kmEBVv
         SECx3Lv6LloN5/5h+9xEKNJOzfqbnQQ8jtgb9rXz/0F4KefwDaZ2EjQ5C4Th4Nya7j+U
         X9hOLACso7HKoFK217rA7KFhDadXOjT9lHvH++x9qHIDLSS97Ro44a1qoqkeHZAYa62k
         wO2wy2nCDG5psDb+VFufFe6vItUuugD2WPXpsA78ypob/4mYCLwVOjwHz2HYaVjXk+Fb
         0+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714167448; x=1714772248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3SjbYRlfVLcKXzSMNjYRrKo8hPdxAu3bA3GNGrI0mQ=;
        b=ixJ00Ph7sOdnE9BwhaGSuNOOnHDiAMJ1FM9RyjyDcXZ3vmTza77lYDqLtPeT1temYy
         2Tb0zNs4bBjn8y22RpwKpher2qVbqkEiE292gqwWP5FyvhOWAAczBHhQLAHVvTzhgwRu
         abMfqyEPepe3V5Y2f6wQzWuoWa0u8LsZaTAiudrayCDjOZVT+YvhFqhO6FeawLE8rAyF
         nPFJSnymRslrtfO8gB9UWySM3J79bOD9dJHn11rvVyFra3GRJWQ7liQDT1qkt3B23RLy
         bTXmvl9xOhnWHoPhuXYw2RO8xPeiQNzak8JseUYiDbez6aDq2aJT3ANWAYIgYLaPSiTC
         5Mpw==
X-Forwarded-Encrypted: i=1; AJvYcCXE0lKwiXXHbc7M+YI+j7LB6j0TzLfWj3g0kj+7LFhYeq8aXYUcMfln1GD4YA/AA5Trc+98v2KFGU7SL/YUDW+9nlsCoIe8+GqBMAo=
X-Gm-Message-State: AOJu0YwnoRMXRYIoDv7AV95LEaTlMFxXVzwlLAX8v+Q0cbujM6PYteGd
	kjyNSkdPCAnerk6qgEm2QI0INQhcYhpEfeMpXuyQZZVZc7wzpzQGqsSiysrPLurJ2SWEjYt658f
	e
X-Google-Smtp-Source: AGHT+IHm5zjW+ioSlduj4IUVa22zr9qzjWQiXQZ2Y/v/laULdkXJTWt9qYlN0WXsPxl/15hsWAapOw==
X-Received: by 2002:a05:6a20:b112:b0:1ad:6e6:b494 with SMTP id ed18-20020a056a20b11200b001ad06e6b494mr3747995pzb.54.1714167448210;
        Fri, 26 Apr 2024 14:37:28 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902760400b001e2936705b4sm15935701pll.243.2024.04.26.14.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:37:26 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:37:09 -0700
Subject: [PATCH v4 14/16] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-14-5cf53b5bc492@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714167425; l=1205;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VVos6nAzmHOy7EOA1ppaqJ4Dx+U57WxCTD6XuCvS0Gs=;
 b=e/cAGXYDWmxX50AQyo8xsB3J/G31Eq8eUDUhpDifz2FCc5Ho3O6JsuFEwtpQxetc2K8CMG6gP
 M9udTAsKA4wAkZkxbNvpvvFbbz4MRw/af9XgaK3F9Xx1+v4uG+N2dmN
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..b2bb305140aa 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -210,3 +210,13 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
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

