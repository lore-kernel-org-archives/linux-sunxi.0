Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2113D4E06C2
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 17:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221176; cv=none; b=sPcG5rulTgat0Lgm6yywqCgQnUnYRrPWu9bZ6GGMbMjd9TAGMQPKsaZFUNFNmsbR7R7Qa2gSMeBhs5FAJSYjY1I0r5k68FnRdh11OK8TielnW3uBVqr+V9Y/y/P5nzUzV48gWybFEEapWpnt1WgIWejGCAP+sNQl4gcEsrZCiuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221176; c=relaxed/simple;
	bh=RteOrGLlQTXAnYWg5zjbSnYFrD1pgoJ54/qMOu/aInU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4iBSDMKwUHDR2Ph42xeGP4iWTxe6M66GkGeBWrBRq4WueffgXovYRaWToCfdixyGKLg0A7MVNVuKTHJPNOWJbBqp4IIe4s/3B7Lm6iFdTbMsjjoqnzcz8gpsCovOtLE+MYnkW1dxVeESkFQ2ORJdp3zhfgvQ3hq8gZkM0cfvYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETV9wHJ8; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETV9wHJ8"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8d881so1828361d50.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 10:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791221174; x=1791825974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcdQtERBvEEEhQkX7i6RjlhDSgKxE0CpVxD5Gi87UTw=;
        b=ETV9wHJ8mRP7DxaN01ZgbZRMRSpMruwEorQnb4Vhl4C6tP9nSqTmTmoB/LvHjQ0BOm
         rt7FAoa+UaAgMnYboxYa65Dt9eV2dCcaulGdTuNBq15ab8V+HpuCLGJ9IvH1s+HXozYb
         /E5QSJsbWOIhmLzhLjSnV7WkdR6WMDLl5nk5S4vM4J6t1Q9DrAY9uWc7C/SB2i3SoBDi
         11hmPykLuVLPuta43EeZ5gJeJrEKW5LJzeYe1EhpRJ/6BZGHEGcVEgr8/we/tmxmL04h
         pp9zFKG474yH3y3FPJc/r6qNGNTVuNhicB7tXnJQ22T3G689309Z2NWf5snbD2zLDmSS
         LJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791221174; x=1791825974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcdQtERBvEEEhQkX7i6RjlhDSgKxE0CpVxD5Gi87UTw=;
        b=h1hQBTuzCdnz5awx0AaIFy8BgjM+8bCS0i1r/HUs/X4Xcr20qqHLGnGP7JpvMht2Qq
         iuMi9LzwxXljScVCYbMfP5F5uJeT95j7lAvoP/XfXTCAzR7fS3eTKH0XyX+M6hpxHJyM
         x+ppL7l0VdocvpbDWUigQJXNBDK+uSgYSVTqTrpBTJtHa8wJgVMpUlPsnmjecISWS1gb
         XwExtWyAcdMsAT6qILtaddq0YfX7s89C25WNk4b+Ko2VkFYzuF18ecLS6IedWhI5b7RZ
         LPzne7y2VUucnDgS+xXgMgV/KL/NJfd9BIVqduUYai6rutNef++kE4fu/DWbX/qv3j3v
         utnw==
X-Forwarded-Encrypted: i=1; AKwUvBwI56CFRpM0BXVPcdibcp/jZSEhZL9Tes2gfcdzuiih5s5cp+wE3cGywyDiqGnDL2D1efHusAnPaa04WQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIkgMEtzoFJLXUbbFtybbeopp0eoJS97GCfOz2mPopdvk66llJ9
	wVuplDttGLUyPOpq/WSbcs70ptI3Q/cukb9JIlNpnJZzWDWUZidUn+MN
X-Gm-Gg: AYBFou1AgXiNnsnyBEBi1mWwTRO5XtzCbNrY1kMoqrn6uuI0v2ddsdOa+pDu/V5POS5
	ytO917zm38GzrJlPCsgvrv5hiUgRQvWPO1NsVEB5noPLFhtyHb5Jf0daq/8cBqPfkCObihivFIZ
	gx6qFz3RmLxq7YHZAZbrasI7+T3E2DQf2n9uiOM6auj4PBat8X5qd/Wo8twyUy8YHTXTFsIoqMw
	ylg33m4xdbHI29pbdeEljml2QUwqxd6YQ4PZ7WvSHrehPm5tU8VA897dmeb2tGzn8Lvzml1lHWS
	2je+2I6EwubZwU8jPxzsGOifhpunVaAp/VIO1sWJ05E9DyxdknGVc+Oq2Zpj4g4sKD2/DGjXdWP
	wyG1kUHG1gWWJEiQAakw0kRG0tiyRdyI3Y+rQvm+T7LjroeLpZVPpAjaDxjBm8xFjy/ykrNqogR
	3x69GMvyYMyxTV+2rYAUd5GxkY8KTDz34gr7mgYWx2FvSXvLhUDgLgaH7x9pFY6GZQ3hDaBZZZF
	Te6UDbXfuk7OT4p6X3V8a8hghHA3gGE1k+fPqywhTwn3+cXiIhUzKLt4JLHOXAGbTgjfzqPf183
	I0kVYQ==
X-Received: by 2002:a05:690e:11ca:b0:675:5ce8:f037 with SMTP id 956f58d0204a3-677abf9bb0cmr4946331d50.35.1791221173929;
        Mon, 05 Oct 2026 10:26:13 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1b585sm3449969d50.5.2026.10.05.10.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:26:13 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 2/3] dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
Date: Mon,  5 Oct 2026 14:25:37 -0300
Message-ID: <20261005172538.398522-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A733 UART is a DesignWare APB UART with two SoC-specific
differences. Its baud clock is the bus clock gate, which can't change
rate, and offset 0xc0 holds an RS485 control register instead of DLF.

Add a SoC-specific compatible, with "snps,dw-apb-uart" as the fallback.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 86dc25919311..aa8cab5ba3d3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -51,6 +51,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun60i-a733-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
-- 
2.43.0

