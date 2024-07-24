Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F089D171E73
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721848467; cv=none; b=HWA2+uzQxlRXM/vaE3eForz4NhLOKMNiYVxmVjt4BKK83AyMgVvLkOfOBQm507bsOm8WE4kUXQLHpQs1CW/tNEphTpNIU5VI1zcVEmUP3cfDB907yPLcyTU0XbAf13vOufcig2vQaW5wFW+JZCxDytyuwplysb+kzRgUVLQgKrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721848467; c=relaxed/simple;
	bh=2W48pS8YjVGGuKgFcdTY4JQ+czvhIHjQutLR0sMQn0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=evS+bRxtieycEmDbzeYM3otku3Q3pv+jK8mXhkjlZmpOZQEvdTWF2SB7ymdrwoXi42Rxbz3PYeBg5jWXyqZeaF6WYAA8UiYeit4ngokTQ9Hr72Pxr6yY4PPlqFiX/vNlDCcyOOsHId/+HQE1caz9Lne5Dw5U0WSnDbgDUUdZl4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1cDeF6q3; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1cDeF6q3"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-71871d5e087so111835a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 12:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721848464; x=1722453264; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFlUlKNClOcGHl95zNXTKC1SKxBdILei2erBqjtymyU=;
        b=1cDeF6q3H1qO66fVp6bq8ZxRNXXO3Kq/fwlxn6cTRmrlVyjwcexM5DCTAZcV40EvLo
         jOCq1QOwyX3pGmARwUhhtAIWLwTnZNkfZsUEgh/CPa/S9+6wulgK80/hM0DyX47I1LFv
         doCmObyY4Fjci1Hzk5+PrYdNvZla+9r33dFhKjxvTK4tNRH2I3CT1Ox0v1q58AajqHbd
         OoGLOiJx04zUAXY/Rpon3+yw8xbfFYzW5G5c8XBDixLtpgaCvo/gsZ4oNE1SDnzEjem3
         /cljxjh6IF5YO5jDax+fG35wkYcbCEbz0FjIVYj0C+VuJfTq5o/3Mj/2uI1ZGkV6kGfa
         FJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848464; x=1722453264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFlUlKNClOcGHl95zNXTKC1SKxBdILei2erBqjtymyU=;
        b=SHca22G9d1aE0R53kwIGmUtWsspU4O74u7SJcV4RebE+0HqdPv7M3JlpGwjir5JiMy
         HWPjE9j39AnqW0TbYyC0qcHuP2PDg62GzVb2qdpVpIIq3nnxv3MbTJx+hn2hzV4T9+qs
         OjdVjEy6kdzIJrSH3ChJf2AGLIHUKviByMOeyRPP2jv3f0Ou08D51XUD6Mh37YtyuPAS
         PCsSmW570BUTL9ZRqYNf5J41giGDEv6Z5xelQ3QSqtSB7J/6sfY8uZqfSQNCDwKQqZ1g
         uUNi+g77afISRWy7BZj/XBjes73XQ1RxWLkQRnmSTREfMBfgqAXHkUBqSUY6//L5pWgb
         DCVg==
X-Forwarded-Encrypted: i=1; AJvYcCUqRuCe1lLqIpqbs3WgwZrxKyIBBKNojoDcZVMSQXvay61XBHeuofrr/FckQAzsjh4cizujN+aAN/Qse5D21XtPJdjBcHiMzR4WILU=
X-Gm-Message-State: AOJu0YxG1G9GkfS3vqRTjqj+bh/eM9pNp4YGv+NTmgUjJjVYOwNdr5c/
	H+kpzXA8dKbFyWhQBW9VlBjTrKwnNDheawyQWyzKdVWkyGRY8Td6DIpBXwHdqBY=
X-Google-Smtp-Source: AGHT+IE0L0dz91okDpFVgmoSLSvgUbEJMqSFPJ0XA76IZlboi5kzsRGz9Y0ZVS4Z9LhoGM+6TQZj0w==
X-Received: by 2002:a05:6a21:3983:b0:1c3:fc87:3770 with SMTP id adf61e73a8af0-1c472ce5816mr1070905637.36.1721848464456;
        Wed, 24 Jul 2024 12:14:24 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73edecesm2022359a91.32.2024.07.24.12.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 12:14:23 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 12:14:02 -0700
Subject: [PATCH v7 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-xtheadvector-v7-11-b741910ada3e@rivosinc.com>
References: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721848437; l=1260;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2W48pS8YjVGGuKgFcdTY4JQ+czvhIHjQutLR0sMQn0M=;
 b=of4BBZLZnpVGOBP7eX+ywM0MTSJgSJI9OT7n6xCj4kUhzVsYsjRs6A+6BfAF+cCfhBKnqjW0k
 cIac05GFBfxDNGR4geMLqiNV+3fp8t/Y4yl8dXtE7WppGiqLnJSBVfZ
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

