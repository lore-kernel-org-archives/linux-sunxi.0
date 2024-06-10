Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A933F22EE5
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 04:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717994750; cv=none; b=PUs2nTZz+nEfvzPFCrc4jzXrwTJ2bcEnMn2hXla65BsxQ7I17VX703dovvYBfy3T4+2DIQUegYo1WgC6v+xxrylyKltGmYkeCLECzcYkkZ/IqVCM8YS7EKFcmoLdo7zEnN3ZJKlnf4owrqmiSLt1Iu0MT/P9QE7nE3Qr5hxGc+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717994750; c=relaxed/simple;
	bh=SMA++MELxtndsmlf2ltstvee/EM+yG8MF8KTMj9Ilaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k5QbojlIeP6BNtQI7Tb2CXaWUlFnxX9N+WGXgKFh7yHyTOgGo6KCk7aGgYMj38hOf3yeBOVucMBJyG2SJIkEygYiJmSPdMhSAhHyOpsh3jc4hRIONIzP6MR9EdLhCd6m6goEwW3WTJRa86hViJwycxisf+pC54C1K5pC8r1TdIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=NCI5deuY; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NCI5deuY"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f6f1677b26so8867425ad.0
        for <linux-sunxi@lists.linux.dev>; Sun, 09 Jun 2024 21:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994748; x=1718599548; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P240Gh/m4dWtpIWWlN8DjDnG2wL4gQcnQEBhQHOtafc=;
        b=NCI5deuYpr65MdCIqL3WgvG1b2XWfE8CjDGI976K74wZp8iBOQw5lKshCf8DBLGNPx
         w/66r0LmwsYcXW2p5nWFVoJJGrh79CMAERiJ34GTuS+MuJgtODSV6/jMT3Y/gGhSo/oK
         WlQ0yTtB6uav+YW78TkrWHm4/XjEAJ0TJ8VD/NBi02uypDN6iGe635+9HOuNdfWMmWgZ
         QuAYlrcPTu+76DPqsOMRS6qWvt9ZFRI5bYz+fMK3tvBEFozvN378aQMGlFchpIvUiJm+
         AdORRR6xYzrPQzrS20NG6qpzaGIhjM40rMzlBENw0AZ16Vg4+V7jmKYdG/oODMtjWarI
         mcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994748; x=1718599548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P240Gh/m4dWtpIWWlN8DjDnG2wL4gQcnQEBhQHOtafc=;
        b=Ma/13lvUdnA2izL2vtsyri7WxspTxUc6/b9cadfnZ+6nmeNs76zdhEKwMAgRHER2vt
         gKc2OuEhqzwK2e7tZjsdHp44hRRH4YT922Q3lKhnOsVDW+D+9OgWs1GFo4npS4YpVwKn
         nAurqkL4rYeY0HqFx6gyFpf0EsjzxY0exXQ04hHSIDANdkGTGnLzSNa967fUZa8cOZsS
         ovpJPsxSlHnoI7k/luUJnKPVKxTeE/4xQPoRpbfV5PHTQyDsy/GG8ZBIYpOnEezlqXNo
         jWMJ922TL0bcW+DjgcDJMWbf6fGIQWus62lB4HNlH/WyDbX6/yiZujcOasJJJkmS81NZ
         7DNw==
X-Forwarded-Encrypted: i=1; AJvYcCWULlAoqolYGLy6yUZXNboLeEYrh9A2IdP5NlO55EAoObMP82pL+VH4opRU11PX8shYCjvfXS1RGJ0qYrAHZdtw6Q+UxGzFN5r68EM=
X-Gm-Message-State: AOJu0YyhkF9AeLgsP8qnRSLiaPWrKhkFXeIOqBZwMVMGTHdsa6fP4wmT
	GqX9EGXriXbR/7gdk1F2dyrMuKjPgpsOFUvl8ZRd7KN3IHxp2DH07ureSMzrjac=
X-Google-Smtp-Source: AGHT+IHHYkPAFs7Wybfe87tVbgyhX6m7aNDjY0QvnrXxzXLixuWmYwWBPXRWWuSdJ8YBrBa1EGWvsA==
X-Received: by 2002:a17:902:db11:b0:1f3:7da:b0f5 with SMTP id d9443c01a7336-1f6d019efbfmr128910115ad.22.1717994747846;
        Sun, 09 Jun 2024 21:45:47 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:11 -0700
Subject: [PATCH 06/13] RISC-V: define the elements of the VCSR vector CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240609-xtheadvector-v1-6-3fe591d7f109@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=rl/YEju2Da4Y30TCSeGgcBJQ4jtog67tmUBEGN9KrFw=;
 b=P25QoGbkxEpsQPOS3fSEe2wHlcp/4ddwgnPBsbhgltAUD65AsllR2lgWJ6YD0KH6hvNU90zge
 uLCtEb1QxJACMtDDLFk1aJU3wAfZckqIcjUQQVTLYFFInUydCNoG4cP
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

