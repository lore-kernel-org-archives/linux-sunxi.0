Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0186DF43
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717613626; cv=none; b=ouriAAYnlRgfhqFQRSC5yPV6IkLQS6SGCV74P06bM1vNzv3Y67jqWnTAfbOeAoRcqth3xgczV+laD4vQjVrij+UkzZW5Ut+aOK930lCfsd8/jlpGFoTC3WI26H7pH2R9KsUHy6vd1B5k6g9QBCF52S5EYNqQPoGqOg8uqeKycjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717613626; c=relaxed/simple;
	bh=Q1HUZVz4p1ozI3U704h2eey+eiXul/YK515+3JzrWjE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JFgCXJ4xc/m9DSRTlhUHvUodvk7fE9wZTpSCRxf/71cAyYDFMV1mXbJCqnk6pACsY1fkAKNGqOWNiCOj2+EAcJoT2k1ou12lgvxX3LcoR8q1o6kxOqa7NClXc0ffSvniLY+WnPdVpXLqAgr1hv0krvgT38LRH8bOHOMJfJGM2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vb2JQTMZ; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vb2JQTMZ"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3d206a85082so59519b6e.1
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717613624; x=1718218424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rkYuIXr6MTp+AP4kp9JC4PD2ibEBFF8+Uy7EKgtY1A0=;
        b=Vb2JQTMZl9Wd2PC6zrWNOIwIIBPW+bCKYyHRFA1GRuyS4nsINxlKzjtodLWC6n8iO+
         FVYYlMVG5q53AewQpv5fcRq09tOMUX4Q7HfNYSPLxZJsJllwLKr4hoWPAIKK2F2f5Oco
         krqkx5mgXrLVBnrzlYTMdDeP32ZNUo5k1fRDDbeeOy/+Mh/UwTNqctr0qnGwwI224evg
         CrCpQOkgd4ar0ymcwAFIC0kZi68M9ZRqMQIkXptLos8m5NXUti/cmU+VMJdNmNmQwGxX
         NXM8N0bvdX44MXQoVceh2Md+KSfkqzHgEJfKUgeZGpxEsMCSBOMIVepySjNeemG7h7lE
         xoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717613624; x=1718218424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkYuIXr6MTp+AP4kp9JC4PD2ibEBFF8+Uy7EKgtY1A0=;
        b=TE6lapGHekF35OYFXvh0a9TFef8gmVw2pTvhfCbbGZ1y7nYA98znmn2OzyxrDkNww7
         7Ioi42azbZoOl9a92jnVReCsXp+R28L97fbzXxLG8hItZgBRH53wOhPZ7revaror7aM1
         idPVo5Txoz56B43JU7kXbtAyaeLqBpyyG/SHXqsjswVM7OgfLoYCcvoIh7Ofo9DBj0Pr
         6IDgXp40hV0Nm3SLQ8UWgFyWJ+PFaVpzMmcca82uAB9UVqz79kiZ4sJp6Ip5KDJPTBoi
         fWQ7guj/W6grIJ6hHmZNTRPCx2zvODvFUeQowssdLnlV2iIqfJr+/T1TjIgtODFilNdY
         Z7bA==
X-Gm-Message-State: AOJu0Yx1LJY75U9bi0DhSdhYAbmV7/BaR6klUcgUd4zDbx9IA2W3anNA
	PXprdOmOWIajRDglNdl//ibO4+rbXNbqdZtELs1ugJ8eFApziXErpTv5uw==
X-Google-Smtp-Source: AGHT+IGSoTI1pK54RCYlafymqJqjf77YgnYNdsMjkPx9ZztVUKuCkDSn2LaPF667npg1ks2E2P3h/w==
X-Received: by 2002:a05:6808:146:b0:3c8:6551:8125 with SMTP id 5614622812f47-3d20425aeb0mr3121843b6e.6.1717613623904;
        Wed, 05 Jun 2024 11:53:43 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d20a7a37a1sm29684b6e.4.2024.06.05.11.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 11:53:43 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	ryan@testtoast.com,
	andre.przywara@arm.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/2] Add Anbernic RG35XX-SP
Date: Wed,  5 Jun 2024 13:53:37 -0500
Message-Id: <20240605185339.266833-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG35XX-SP handheld gaming device. The
Anbernic RG35XX-SP is a clamshell device, but hardware wise is very
similar to the RG35XX-Plus. The RG35XX-SP has a lid-switch and an
external RTC that necessitate a distinct device tree.

Chris Morgan (2):
  dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
  arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP

 .../devicetree/bindings/arm/sunxi.yaml        |  24 ++-
 arch/arm64/boot/dts/allwinner/Makefile        |   3 +-
 .../sun50i-h700-anbernic-rg35xx-sp.dts        | 145 ++++++++++++++++++
 3 files changed, 156 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts

-- 
2.34.1

