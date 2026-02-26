Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CA8395DBA
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095749; cv=none; b=XgPLi/uy8gJOeQM3b7Y03jHsw6/W/r1++Jdm81M/wqAI6YZqzBZe+wniFwPTRHRLI4+tcI2WBZ2vh9NCiMnVMh1D9tVkYgKgiCwARO8osS2mf4Vyy5nP1VjmYcVXholIvB+y0qOhbQxUvfEVBn14cz5iDwM6doUN9YvtxAB7k98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095749; c=relaxed/simple;
	bh=J+cfXIcPGCf4iyDA3lyicBLgipFLT90/RT9Ydsh52BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KzzvNW/blUDxp5sC9GBHJE3v7LMUi7u/FJzdHi9FqqM47h5yCgFK7guO5YtlqyPGIjMaSbIBroPerYPQdtFKnPW6uq5/yZiKAB0qwaWYG17fnlSV5gTaIMtHikK8v8NRZo97Jux9RjX3vzaU071jEOSiXa1acpXokVaqostJMRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZL8jM6b; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZL8jM6b"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c6e77ace76aso216907a12.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 00:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772095745; x=1772700545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Me6/gMTEz3PAlgU521S5bAkTbmNg6yXoSMbtj++gb3k=;
        b=LZL8jM6ba6DEiXCcMMhdwD+c79dmV3HQSq95gnr0h9se+dx0UDh1COZQbDf3XpKeX4
         IigWcUP0xvKNf6hnw+Cmp8+Jj+LE5ZrfAuXBahLCZ1A9rz+CEBxUvFYRfx0oavdLSBei
         5wHOrlfyjCt0Qp+S1g857RuF7PxhU2n0eWroCxBG+TAIkLy0CrrJYKcHwiVC7TrwNrZc
         H/FtR5V5KReQy5kx0HWwekWOcTXobKzUK869/T8Br5rLRtqZ5W699PGp+WzEfmGipBvU
         oMUS4R6w3Q6SluZckuvpaYAwgJokmYv5gcEmYyxANUYHGYmxwzVbMISQbslUvamqkRc5
         E9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772095745; x=1772700545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Me6/gMTEz3PAlgU521S5bAkTbmNg6yXoSMbtj++gb3k=;
        b=qU2zCYVoNh+4wuD48WEw0ftEy5cdoNr2unr65g81+KdmDFyzI+csbjemTdHHtPpnKy
         20rNqHmjDyE76M+3hlfOuAeH3pP/jd2sl0896if4v0kKNzQaj1UYE2L7X4r8jY30Jvw+
         0hKIAvc/F1hG3O3mKK8QSnkn0qRoF9hYFQxyQYRoiXA2DpBVT8VhpulBlkLSwiH6qXZe
         1gUP8LUlnLkETvZ1WFErthlk2yZ8aYUfeeBrWNbtvpLRHvX58SIlG5D4BrQPHCihafMh
         zv/6+0KdZdHf/kp8rUkYzfgTUMBbzfa/iow8BybbOrOs3KFGfoY/yg/xo7KIvftLCs1y
         dyug==
X-Forwarded-Encrypted: i=1; AJvYcCWqEc0MZzrqELNof57RFoN0e4QjbUz+qOvOZbeHAc9aaqgy/UNcVaHo9C9WKfWnvIYFQGkGPqpYFxLAnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YywlXZFFw1bZyeYk4nTK1PObPcXz9LuM7le3S0D0HDnkfH25rXm
	9wvfGwuw3xoJa9BR/M0expu9SGGTfFZlCQZ+9SEKcZpkf/Tbuyk4NgOBaOjstmrAJHA=
X-Gm-Gg: ATEYQzxWdf4Ns0dxZz8DPVa5QnMJAfO5cTDJlNoIvVNT0EziShsyA9UScjU19tguOOZ
	8Mu3Y5REiehqEkSEW0LU4cXDK8uQxoCm0e8+GoFaep88xgZ4oGhIkolGvUPtvn7TaWT5/hQUSM9
	9tOb+40S3yW4ThNlRNZfpfHC/Dy9ctmwFqJfWmGiFuU5lH9VTcLFH3ooefdNaXtjaIQJNcbTMPl
	VhSOPBYwFAfM6m9ha+QN/JTqaIJY6C9Dl+/P/dyW1hjgYMDXzCddayAKc3YVQN/nsw1HiWfqQMO
	HC36O4tTdVXvZCDcsl/frFKHDhAU0Xh4y6QgkeuB0fMWkwvFGj/QkZYZqj+qahF6n8MoOpqOwyl
	YjdFAtTIyaMVyZj7tuDVExh3+K9uKgqcXZkFZQro8A+Wpbf8d9Pf9F9Nnpb71zpNncDQG0VyvZ7
	R5CSQ0lMfuWCAajwYrKvk6Dr9U7vdqtNjoF8NI
X-Received: by 2002:a05:6a21:998c:b0:38d:ebdc:3558 with SMTP id adf61e73a8af0-39545e2f265mr18580124637.6.1772095745577;
        Thu, 26 Feb 2026 00:49:05 -0800 (PST)
Received: from arch.localdomain ([117.147.91.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm1342441a12.30.2026.02.26.00.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:49:05 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Date: Thu, 26 Feb 2026 16:48:46 +0800
Message-ID: <20260226084850.417731-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226084850.417731-1-jerrysteve1101@gmail.com>
References: <20260226084850.417731-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
infrared input.

It was released by UQsoft as a blockchain-based terminal and is
now discontinued and no longer supported.

  https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 9e4627f97d7e..8f6f30f683df 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -901,6 +901,11 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: TaiqiCat A01
+        items:
+          - const: uqsoft,taiqicat-a01
+          - const: allwinner,sun50i-h6
+
       - description: Tanix TX1
         items:
           - const: oranth,tanix-tx1
-- 
2.53.0

