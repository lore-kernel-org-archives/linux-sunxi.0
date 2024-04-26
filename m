Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888136AE4
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714167440; cv=none; b=WG0V5PIr7aGT3tpUKAONmzQpj7SsHBdicgs6c6VPXjenRlfEmFCPb8ms0OAEkAAO/UB5PCFSZMDEyRbWiSY9YRHc769719kDr2zMLp4l48GZwSow9Iyi/Kh7LWaKcgcoxqi0rTjQWMwdUy10or5nHDoRzgf+7vxxtlGOngz0U/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714167440; c=relaxed/simple;
	bh=/S5mXvNckx5pf6RsnXH2juTR+JzZCbCosBXwMflqUFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=So6+IXNrmX1GMrqQ250f12ZSCHJ7TpW4hwFUCmZg89FpoG5lnNWJiFIYI8mXb4ZBvaxza9IAM9eaM/QAbnpu8XMXmvJW9htdgRtrCUL5/g/2xsbyxQg4vCSehCJLWDdXGnPJBk5giVT3lxA2mlB30zsbXaNf4tlE1Fb2VPEb3nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2CTD+qXT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2CTD+qXT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1eac92f7c74so18059775ad.3
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 14:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714167436; x=1714772236; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7WZZ9B05w7yOdiDdmOf8xUgYc+IvuHvU5nr8Ugv9mw=;
        b=2CTD+qXTuXj7U40QkKkFHhuHgzjT+Ch9EanysZtRJLqooCNl0cAUeWAvWYWP6ZaBvy
         TvZNVRobk7WN+TdwUsKYdye2wmdUSSz338smSjykel0dyu8BBzHbJgWVY+t/80UeM63C
         2QxG+q0DHK5QYGs4CCVkJtfgIKDva07r+lmzX7QIatyTTk/YQn858X4lVtIg88UxVlZ2
         54iIsAForpJNCYOC0Aj30BomW6mUh2gCwCMCCKBEkbe7b2tH9TndHR91jRc4jJ8y3F0V
         6MqK5yhbWB0rWTQ2t6fp+26nNJNUP/4nNtIdu3h2pFhG621nbJT5kx3cg6xq9dWT/hoQ
         yEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714167436; x=1714772236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7WZZ9B05w7yOdiDdmOf8xUgYc+IvuHvU5nr8Ugv9mw=;
        b=KaLQxatb1pOcO8m9flM7draRyYABPw902ysAzx7Qv1eFddiGBhcXVf1uvOGh4lU0Mk
         ouUu9LUbmJYcYDVyqQWdkGzG5X2at7ERm+WsJC75QM2D9RBnrdoNFFaRlULsmHEqFzt/
         g+C4+5m2B5S6V4fgQzvp7SUfCQ0y1QIM9kRWCo8T1x+IWb2nLYGNffXcP0FuVPDV19wM
         uECO2rcQTu3GUBbcEDigIZfUrKJiBftQSZtzkj8arwMW0WR9XyXGMUIoA1atklFtga9K
         JUqzmkXz5RckeJdsl/iEs5rSCv4z3jHQ35OvCa+pKzbpjGdACmZUY9EuJ6XQuAqHUAUv
         JkmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCjA0pT1xijXlfXFc34aTW26QNfEy+SuT4y51+L3lNhmYyyCaCmE9uuc5vPs6Gce0zvEHItqZ1FFDsuaPsnSh5Tv62jKKqtn432pw=
X-Gm-Message-State: AOJu0Yy93PdVNAmB3nB0xawgSGvkMZb7z9ctCnFyBJqppL0WUH4JXiNj
	n0F51yImE4ugJ3R/qdWwPMyPWa+zPtF97uD1nCZf4q21uujhutlVd7vp+A0BNQnW7g+wWYvK8L/
	D
X-Google-Smtp-Source: AGHT+IEmTz6F3urwdNc3upHPp7xuNjToyMXKR0+MXW/PS19so8SBqwqQD842Cobd1kOR7Dc18se9dw==
X-Received: by 2002:a17:903:1208:b0:1e3:dfdc:6972 with SMTP id l8-20020a170903120800b001e3dfdc6972mr5045246plh.9.1714167436618;
        Fri, 26 Apr 2024 14:37:16 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902760400b001e2936705b4sm15935701pll.243.2024.04.26.14.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:37:14 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:37:06 -0700
Subject: [PATCH v4 11/16] riscv: Add xtheadvector instruction definitions
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-11-5cf53b5bc492@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714167425; l=1914;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/S5mXvNckx5pf6RsnXH2juTR+JzZCbCosBXwMflqUFg=;
 b=PCrymv44Z3fiRwZ4pYJZPOoFnaXXtTTpJLu/OUgNMcdouUs0msGnlr9zseM1KUD6drfrqa5Xy
 APyv+dooJWrBYOFJl5QFRlu8s4tC+mzcad1gaHapng5GB3Q7qMS3fwV
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

xtheadvector uses different encodings than standard vector for
vsetvli and vector loads/stores. Write the instruction formats to be
used in assembly code.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 92eec729888d..6e3c85351f82 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -16,4 +16,30 @@
 
 extern const struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
+/* Extension specific helpers */
+
+/*
+ * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
+ * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
+ * vsetvli	t4, x0, e8, m8, d1
+ */
+#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
+#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
+
+/*
+ * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
+ * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
+ * the call resulting in a different encoding and then using a value for
+ * the "mop" field that is not part of vector-0.7.1
+ * So encode specific variants for vstate_save and _restore.
+ */
+#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
+#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
+#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
+#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
+#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
+#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
+#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
+#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
+
 #endif

-- 
2.44.0

