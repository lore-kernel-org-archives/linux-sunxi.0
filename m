Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4766339ACC
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731342332; cv=none; b=J3yN/DVVTi69mPZwucsaEBpD3txS/6QME5W6wZRjDc91fX5TjIAYTX5DRuRoE8r0OFXw2rZmkYf0EzL2RDnDt+ife5aJa1zIUnXX0E/k0Jy8tWeAU2J49ak/rh0fUIlY+U+AUz9T72XdzyzIti9IjanNvEY8M+pEh5ARVRD+sE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731342332; c=relaxed/simple;
	bh=DJ313fDENl0JgB5FAz3WnAA5Duu1nh+i9fiImloQmyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUI8E/dWYHPKBfM5gSnzeVxAZu2UT2Qib5oVYSBeT2MneqhCQ/vdxQ29cPrWl0cBPY3O4dss0K7L7b2h4rHzJtMEUd1u5bjdiddT43EXDBw3R+Y+zAD4WhwRoX57oWoJsfutbzAQu3tLVYoO2wZa3OLLhew8yUCwElNW2IaT008=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SECJN2lR; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SECJN2lR"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e59dadebso5580173e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 08:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731342328; x=1731947128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhXjNqSXoRdIfCPBb/HfVY/vAkKO6vctDzwv5YqBTt0=;
        b=SECJN2lR35myZ79GGwwxZgjv+rfVamBp3HG9dNuLztUdwepUy+PIh7+MGOdydP1rdJ
         7EO94HKLBE0NAh6bSQX/uGLqF3mrKhVBhFEeeCNh171VrMjSC1REjH7cmH5E+qPpc0x3
         Ko5M3Ps5XurnaC6XfcihfBmezWr2t5R+6qT2kGIqEYNPyhLuTe3zChUVaWJra2gaBirr
         RIRH28txAmsLTmpbJeIUQUwzO+ngOqJzpK/1UROYPcT2/lwoMBt7K/ZTaeqDJmmYU2VB
         QpDhNUo+bAnlgPDfqx/kqv2mtTg5FPK+/7o+fRFKbDtkqXaKPCL3G6MVgw2fw9BrCNmU
         7SJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731342328; x=1731947128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhXjNqSXoRdIfCPBb/HfVY/vAkKO6vctDzwv5YqBTt0=;
        b=mgThHV/qagiAOSCqYyt3+Z+By5S84zHVxZQYZT16+BiI6IXkvpOrV5LB2GjK65wbMK
         ZR73g2qRaxuky9+9/daZnTsAhWGan8QJ7V5H/kyoJH5IKZzVkMGZLeWUfPdtPn+r6Jtz
         3YyoI4B2ZO3xt/WreP962VnIRvO2lMVTB+tOdCwyyQYb1gaF7anWjdQtlOz7J5ut+6hu
         pV/Iw66zFhqcfDLG8KNLZvXP2tq+u2uuTz6v0TsYP5PO1PBeVHWlDGFMvAAhPpnr0wBq
         oN3knBHJRHL+BqF908cMcHWlZVBMa+bck1zpwU2+JUDHeycDJ25aII5rLeBVoLXvMsyS
         CEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUdHmLhqN84s3qsVAoj27mZkwwtpUX9Ac7WFCo6f5m/x+AuCrMWfTS6ntZ1f4U85gggQT08aOOHTkENw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyydIDRtYhdSnSxzavOeA7ARSPvL9znIrOG4O62+dbnvrCOfYKs
	EBR7pRbLptWUakF4BVCbhhpHmer2/EWm91je9fF1kXWAV6xxvmOV
X-Google-Smtp-Source: AGHT+IE8lADm3Koa8wSOM2pmOJkyhFbfA+291g3DqJ1bGrffuE46v3znJyw708eMa+G1yTH10ozkPw==
X-Received: by 2002:a05:6512:3ca5:b0:539:fcb7:8d53 with SMTP id 2adb3069b0e04-53d862ebe27mr7026301e87.46.1731342328261;
        Mon, 11 Nov 2024 08:25:28 -0800 (PST)
Received: from localhost.localdomain (c90-142-33-119.bredband.tele2.se. [90.142.33.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826786acsm1622926e87.30.2024.11.11.08.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 08:25:27 -0800 (PST)
From: codekipper@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	wens@csie.org,
	macromorgan@hotmail.com,
	jszhang@kernel.org,
	uwu@icenowy.me,
	ryan@testtoast.com,
	dsimic@manjaro.org,
	mripard@kernel.org,
	Marcus Cooper <codekipper@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: sunxi: Add the X96Q Pro board name
Date: Mon, 11 Nov 2024 17:25:05 +0100
Message-ID: <20241111162524.46812-2-codekipper@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241111162524.46812-1-codekipper@gmail.com>
References: <20241111162524.46812-1-codekipper@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marcus Cooper <codekipper@gmail.com>

The X96Q-Pro TV box is a Chinese Android TV box, using the
Allwinner H313 SoC. It is sold under the X96mini brand which
is a subsidiary of the Shenzhen Amedia Technology Co., Ltd

Add the board/SoC compatible string pair to the list of known
boards. Since the H313 does not look different from a software
point of view, we keep the H616 compatible string.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 046536d02706f..8905e51deb0e6 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -51,6 +51,11 @@ properties:
           - const: allwinner,parrot
           - const: allwinner,sun8i-a33
 
+      - description: Amediatech X96Q Pro
+        items:
+          - const: amediatech,x96q-pro
+          - const: allwinner,sun50i-h616
+
       - description: Anbernic RG-Nano
         items:
           - const: anbernic,rg-nano
-- 
2.47.0

