Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A764113DDA3
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000230; cv=none; b=CMELGmXoySmG+CqTHQYNNLrO++/fqFR5xubSTRDvmyaqLRv4lLrOoec2iMeiMUzn04bz+2ayaC8eIt93IoZtMn4agKKV/P4PfbXjGNUTB+Qj5dr5Ne79+GVrikl2qOp5pvDV1Dx/Ib5I1tZH5zk90YuybSRowiQ15QBq0iBxjWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000230; c=relaxed/simple;
	bh=VN0dICtf8OggMFqtTebUKdDngD8onf6DYfmLlc+0d7I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=efDMzMKIgV9p7Tr3Jz2rpnJJS35GqljrW5rQ+d4fmMV3w1PigPomlXqo4o6XWndTgyxBnYtY/3YAdekUw8ILOid0t0xNMo3tn5f3h1tpNo8Dy4MnZ1vMqq+MWTc51Q9Z3RS5Tq4oIcBF9RqJiTXcnYwHcD0GKwZSpycXklUlaKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQy8Dwhv; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQy8Dwhv"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-58bac81f40bso2226514a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 02:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000227; x=1720605027; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9e5yaw2si1pKuwfLiF0RZK+Xace2dOoBphwXdFQGGKY=;
        b=DQy8Dwhvj4g5E5hMRe1wxrfQbsDkcnmM2NeEYfDNH5SYk4CbkhV132B+YZfA+o160i
         ofj1NxSUBMQsXxdWZpVpem/ZpjcxGLaMMZGkmd8WQqRdYl+2b39e+aMQ3dtTdyUSOdJp
         EOAKUdya0l3XYGANssil3JXirh9e1EA5+1J01xn7NokGhKNSbVjoe9Zb48dzbZN8YK2j
         X2Gdhi9hCXBhlGzwqZM3jZA/ujWIeQsBTn/pDMocg08Z8yeqb/nwCoJmLdEgS9dXfWEo
         jZjfKLUF8TkoqPCPvc+o9Z7SbMZhcZV13vAsOVbYudtxVaulzUdZALF9qKediRJ0Hkvh
         Cpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000227; x=1720605027;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9e5yaw2si1pKuwfLiF0RZK+Xace2dOoBphwXdFQGGKY=;
        b=TukKv1SSwnsTsFuOYP25bR7+kXg9diiFaPg9BZngWtjrduVA6Uvyf+2QQHFVUjNxOZ
         xbf5dyUH/zEQPlQngAIW8bUfASODpL4dxxow3Kn11ShHCo3srBxp6nDvhG7ZSkYv5fP3
         zycI5IUWhZGSobsGSX9oOftJdU41g2rNTd+53t1J8g0ZocGih7vql6O4ZewrZUA3PhHz
         CMKFUfaSh0b7D99pIuy0Dlr3CX4GiJEUqAi07i0apb81W5xzMhDAbrdJ7E7U+Odcmv8y
         AnL1jo1nG07PBd4TH2glLWn5uuUH/gHybQTNjzHmqMIZvdtl2RuNSA5Eqw5SBnqgIU55
         WAcw==
X-Forwarded-Encrypted: i=1; AJvYcCXG0Qvh9zrLSTpqsN90dqOJnOCO9yVbNqEtowQOXBV7c7lhth6t3qygcXBObaMAYVFVBdHWWA8BnIOkbmAycLpuzXazjOAO7Uxg5fQ=
X-Gm-Message-State: AOJu0Yy8YFWtNJfbm+LCPV+hr35xlzE4Uv1WDM/EefsVf4TOpPc7g6TK
	Q/lDHWNDyYAsA5Y/MnrjC1MQ7TcWz1Wi3nfrPW3UloL4Wz4GHZwY
X-Google-Smtp-Source: AGHT+IHy1ULwYKwABrtHwf7Z5gPXwJpCOZ7NAgyKtr9AsqNSUxedemwdLxYxMQEJeJr5NIPIwr+Zqw==
X-Received: by 2002:a05:6402:1cc1:b0:57a:33a5:9b78 with SMTP id 4fb4d7f45d1cf-587a0a0e64bmr6978095a12.34.1720000226723;
        Wed, 03 Jul 2024 02:50:26 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:26 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 00/10] clk: constify struct regmap_config
Date: Wed, 03 Jul 2024 11:50:13 +0200
Message-Id: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANUehWYC/x3MSwqAMAwA0atI1gbir6JXERfSxhrUKq2IIL27x
 eVbzLwQ2AsH6LMXPN8S5HAJRZ6BXiZnGcUkQ0llTS1VqLcV9eHChZ7tPp2oO9MootoYUpCy0/M
 sz78cxhg/ciwmdmIAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=1600;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=VN0dICtf8OggMFqtTebUKdDngD8onf6DYfmLlc+0d7I=;
 b=XjNDV3CyIMCkA6IMmQ3V+5Cn8hZiM6rJfa6KC5/HpmmPt7RVotWReIEvLZvcnBMUvuSlYQMYF
 9WN+/KkdNdhBJRjIsldFaqvySnS2npK1iWx7F4m12O6i+gta+F3kx/S
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series adds the const modifier to the remaining regmap_config
structs within the clk subsystem that are effectively used as const
(i.e., only read after their declaration), but kept ad writtable data.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (10):
      clk: meson: a1: peripherals: Constify struct regmap_config
      clk: meson: a1: pll: Constify struct regmap_config
      clk: meson: c3: peripherals: Constify struct regmap_config
      clk: meson: c3: pll: Constify struct regmap_config
      clk: meson: s4: peripherals: Constify struct regmap_config
      clk: meson: s4: pll: Constify struct regmap_config
      clk: lpc32xx: Constify struct regmap_config
      clk: qcom: lpasscc-sc8280xp: Constify struct regmap_config
      clk: sunxi-ng r40: Constify struct regmap_config
      clk: xilinx: Constify struct regmap_config

 drivers/clk/meson/a1-peripherals.c   | 2 +-
 drivers/clk/meson/a1-pll.c           | 2 +-
 drivers/clk/meson/c3-peripherals.c   | 2 +-
 drivers/clk/meson/c3-pll.c           | 2 +-
 drivers/clk/meson/s4-peripherals.c   | 2 +-
 drivers/clk/meson/s4-pll.c           | 2 +-
 drivers/clk/nxp/clk-lpc32xx.c        | 2 +-
 drivers/clk/qcom/lpasscc-sc8280xp.c  | 4 ++--
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 2 +-
 drivers/clk/xilinx/xlnx_vcu.c        | 2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-clk-const-regmap-c9d56004dd06

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

