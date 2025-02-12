Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9D2627F8
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739387617; cv=none; b=QM11mR9tKoorWOKAlocH5xjp7uraG3hPWC5VU96i2KkcJ/EqY7lcmtRyNf/CV2k0K/8+8XfSIPRkXJR0ajLrdPY3sxw+o90ZIOXkIHOnMqQYZtKBe63jLD6Jo6TEFoLo8p+zeBO8iEwBPW/S1uPMeLU30KIDf2PQxB0WwROyuiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739387617; c=relaxed/simple;
	bh=iu5S2qQhfIA+bGk7zgBLx2LsbfZVYXtbMqlErEDJfIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAIxkWYBj30q+fEkT/Iu3cZtVmrZKY8slw5iE15vnulM7aDKgtITksa+JDLAo+Xqxu/kdYZ3HCVumGqaJMQzexM6qK/jPoAMmPjt6cEk4rD+TZ6mZ0EsZzmTMWdMa3gmWB9CB0uYWlEWUL1A1JuRztQ7JH30QlSeviK3PQaD3sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3OsmQbC; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3OsmQbC"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-726f84bd6b5so57828a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 11:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387614; x=1739992414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4uvvNTCn69pMo/6V+tni3pi49kMJUjjGQzaJ92qEqLI=;
        b=R3OsmQbCUikHKes3du6PLxOjkdQbN0828DQhhFWqt2mAskmrjbo5oVgP7S7gNsw1lH
         nY515lyaSgacFB7/12NcvUX+UZzIoBFSupcR69iiSlreBmGsM3BVtvx+nvHm4ZHYJ3qy
         dFsO5oBCSukJhW8ttgfOsiP2FAy2HIGQpik0cDreOMDH556SVvWlukhOnKLBMBLOEcod
         w4eTQfWhD9BtP3AzYSN9Sq2hovu6KSsXoIb6F6SngfZQlDEIx0LqZn+uyveosUCNZwj6
         WFejm0cZyN/xg2/IdHEL43XdFOd3YnZQhIY0GZyph570VwKDBWc349PfFRJgRk3Oco8O
         df1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387614; x=1739992414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uvvNTCn69pMo/6V+tni3pi49kMJUjjGQzaJ92qEqLI=;
        b=Ctr/M/OqwgCxtjiJPc5YGrFYm1lVSSZScAsAR6h9VZqGzDZorvSFVy6qPsKRFLt2aP
         XZ5itsznu+iFRc/qBVqOxNL/C/mH3CJ74d1FME1cmRzVyHANe3Bd9POD+cNrBJ1D0XJL
         07sTX2q1k8rjBCJV6dAEcqYeTMb2kyU/O8kDcbirKKjAkje53Gz5+hE7AWSGNfeQ376r
         IOfEybbGVUMdOgqlwmOA2Ni+BUZHLRW2Fu/+NTGGw6y4SLn6ZE5bO1FWJHfKpJ5WTsdK
         Zy4ACubR2QcQLWTyYWSe1fv3Ui+kUAYsbALnkzw3jF3de1noBF9vBRgyHI3KdZ8PO4Yb
         1Ecw==
X-Gm-Message-State: AOJu0YyeENy0Ax3OHTmhQdON1+2ijNo7tAiJYQSpvoXfhxvi6Pz99Mks
	ykOWSAuBqeKGwYPbicLpomvPXjbz5t0I27N1MRQmnXsmgY5I/4immzp67Q==
X-Gm-Gg: ASbGncuho2gq2goO+BR6vYF+akzGOerPNZAgLGWQz4LpYdbIJriq9qt6CZylCml9ofO
	pPrmfgXYmw/lgr4DQDqXdZsJgOdg0TliCU4iv2p7YZCghx0y9Ab8q9v3yQfXPnAKh2m+xWyvg0w
	FHSXZ7HmukWHESrPnRslF3gzKJi3tzRtqPNddF2W4NGCuPiOcQ4Ixhbf7Ai7z1jM4i2jJS3+J6h
	PIzuvM5xNHMG1zcrgSVr8tEW+w2Q10UUhMqPPGZVakmLOTqmpNPS/rcOLHg4cabcGdm2OQ4lBZT
	cC9gLA80VftT1rnUepv9YC1L3z2R1+x9Hg==
X-Google-Smtp-Source: AGHT+IG2Pv7wZCojfRcIagqlwoNOupsL8ezR2SAwZJ+ouLoR02Cx6tYjcppbrON4JH6T8Sv6ArDRyA==
X-Received: by 2002:a05:6830:6483:b0:71e:7e4:c54e with SMTP id 46e09a7af769-726f1c33b3fmr3043630a34.3.1739387614229;
        Wed, 12 Feb 2025 11:13:34 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726fd014926sm356033a34.32.2025.02.12.11.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:13:34 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	p.zabel@pengutronix.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	ryan@testtoast.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/2] Add Clock and Reset for TCON LCD
Date: Wed, 12 Feb 2025 13:11:07 -0600
Message-ID: <20250212191109.156766-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the required resets and clocks used by the display engine TCON for
LCD output. This is required for LCD output for the DE33 which is
currently pending acceptance into mainline.

https://lore.kernel.org/linux-sunxi/67acd970.050a0220.1eb03a.101e@mx.google.com/

Chris Morgan (2):
  dt-bindings: clock: sun50i-h616-ccu: Add LCD TCON clk and reset
  clk: sunxi-ng: h616: Add clock/reset for LCD TCON

 drivers/clk/sunxi-ng/ccu-sun50i-h616.c      | 24 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h      |  2 +-
 include/dt-bindings/clock/sun50i-h616-ccu.h |  4 ++++
 include/dt-bindings/reset/sun50i-h616-ccu.h |  2 ++
 4 files changed, 31 insertions(+), 1 deletion(-)

-- 
2.43.0

