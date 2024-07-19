Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044591494BF
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Jul 2024 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721405967; cv=none; b=PS+KlNRM1QYGMSS081cQ6nF19b1JUi+OJ2PWP01+ZLPDzAo8zXar1rt+560isSIoNYx4OyRKlaklnAa0xVSzf9a5J8KjGrZECgsNPtUy7ORG7shzI4e+DKWv7tdKBHxMZ0YrB2YLT2ZBezlH6gwKl15fQm2jvc5lX92hTK2anXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721405967; c=relaxed/simple;
	bh=2W48pS8YjVGGuKgFcdTY4JQ+czvhIHjQutLR0sMQn0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bpKyXCa4ezTrRK0DSSckJ2DmZ8xqAIzE3A+Q/wsATsBn58VhHdUndk/777czPkvYUmmPxRv1p3jyWCy7FGtom9XQr2BAyTfNThyPD56Juc8KeZ/O1nlxC/Q0uDLNzhxCTbD4H3zK1qJUZvecc07P5xAdZh3qHxwuIVQFbwrJp5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=uV6NFFhs; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="uV6NFFhs"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-79110d8e459so1487647a12.0
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Jul 2024 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405965; x=1722010765; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFlUlKNClOcGHl95zNXTKC1SKxBdILei2erBqjtymyU=;
        b=uV6NFFhs3nye80hgZP5Dgw2VC8daSHU4KCM7S3Vh79IXGbCkIQJVvW83spzPjhGZJ7
         Wx158SeOwIydx4hV4klHAILM65zTh+fsgRhMrgGcdZJoveOx+zUBGmit/0bu4r9ImtmR
         76PtlnztaD1rUlgo6iOGLrmQNip9eM73l0zQVkUrqbtHDumJOmf1gakqiCD7Y5Iw0j2T
         sB1cLlVScmH98yjDctlP6S9r/S/sg69pPVBvwtdjW/S5ltaM2iK1U4AxaYe9joNzNkck
         +4EibvTmkXvUn/hq+f9cFyWalawYpYCsjqOHgjJbQ4QXu1sGkWhmw0d6QjZ2NQzqK7yQ
         uCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405965; x=1722010765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFlUlKNClOcGHl95zNXTKC1SKxBdILei2erBqjtymyU=;
        b=frQf8h5KgQUK9sX8KdgxpPao2oq+MBsTQBeeqOeMM2T/IFJ2CZ8hCDhNj2EF5mEZbI
         +IuzB/y1EdjEIbZNv093t2PAA/UVYETYIgn8yjKBCHVpxTiFIx859W+imtO5NoFFGOfh
         aWCO+T5o7VXnHB8JQMAjY/YQ9dZ56pYxM4ztwuOarVYS1vqDKWiC5T8vc4r2oDFWlU12
         EnJmjgeIf7aEnmoWI44dGCyN9d5W5j6iAVrm3Ois+KZk6+Gjo6igD775MAHENP+Z0zUw
         T1PcQN9I0okqXX4bLsnkwVgXnl4hYK7402Fg8bzgXYJZr8CxU0D3YHDEXN0hlZIUq8OU
         su6A==
X-Forwarded-Encrypted: i=1; AJvYcCXnY3JqBmv8XFnEfHEa8Oq+UjQbVbByOR0fyBt+PPUY5OsLpQ4k4bcXWhQWzB1S1PceXMNUCMxQsXlwf5+jlwqWi3OF5ZdGLm+tjW8=
X-Gm-Message-State: AOJu0Ywas64ozW0o7rkB6f5oWoF5wDGZ5kujZjHzfWI0jrapdSulAJvy
	hQnqedLziQYAaH0WvN3nInVm/LvfwI4Z/jLREyUd+9YCzyoo1p4H7Xw8dx1/N/8=
X-Google-Smtp-Source: AGHT+IG+HB2jI/StGSr1RNoXn3VLStcFpRF57Fl88HYhdj4U0L5ilYL3NbTS5IfVnDvuqFD3dzZ+cg==
X-Received: by 2002:a05:6a21:99a0:b0:1c4:17e1:14df with SMTP id adf61e73a8af0-1c417e116f0mr3471831637.48.1721405965448;
        Fri, 19 Jul 2024 09:19:25 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:24 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:19:06 -0700
Subject: [PATCH v5 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-xtheadvector-v5-11-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=1260;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2W48pS8YjVGGuKgFcdTY4JQ+czvhIHjQutLR0sMQn0M=;
 b=b83pN5cReLz65nLlW1uCxPTq92FYXBW2GeKe7Fpuvsl6LxGyKXlFlAxAXBwI4XgnBGKqCgHTD
 rGs33ThNbkIBx9DcZJKtD9WQGIoUh6HL3J3yb5Xn9Bv0sGlcUfNgfXU
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

