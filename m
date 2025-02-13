Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C6156677
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Feb 2025 17:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467517; cv=none; b=cdKgWH6lYhV6Yh/obPQwYAvmWVCA0ToPLlgec/n9MdccSPRkFCG4jKYirgYi3Q1vHtQ2cqq0ffhttztT04NswBH0aONGWlw3OObyemTQLrkqgioLwaF2WJ1fX8s3Tztl+71PaU37/wDs/4ESVKmRSbouKiEGFSjONxhzkC+CNcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467517; c=relaxed/simple;
	bh=VMYWSsH8QrPxZbFQtUpelBA46x5+bWjvZ2r99Z1W3HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TtjmcvCdQ7oF/Lhkfp1jd6Z0mIY1p4hVuPmuzyIXxJtuG1K7on8hX1Nx6mmMUNYKBRKky7sClkPFBzgMjF223Jzao2p9S7QdHpJdR0DEzOIfQKO8zYxrLbIWKcysYoR/t8XNlGkXNo5wijOtTZO8nV1hV6x4bKR02mR8BgKEGR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgAyuaNS; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgAyuaNS"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5fcad5ee945so497840eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Feb 2025 09:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739467514; x=1740072314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NC0gjVnxt4O15p2NxkemDQxdl3X7+EfnLKcG4TwVy48=;
        b=fgAyuaNSE5Apw8/R9QyAp13rGJyNPGIhgj79Ec2yTT9tzPR3RnhFUoH574ZRi1aaJk
         Gzn+yv+8RYX4IIPcYp5iJlQktzmZT2vjIOT6ah4wqmD7IKt3j8cf3c8G6o709YwjLXGe
         /L0ANhpLb+XOnRH+2oxAdra48zdQXOeoJ31kBcV2rxATW9iNDYouioCRbPx7n5FarCmU
         oFSm2LmA34BUC6ZT7B/0Exx8KCwfbXdtk16oeeob51jXFdXTrNA9pty0LWjIZD1hFjsg
         Sy9eZq12Eoq4j4F7A11235mz658zvNjvZRgTKpPkrP85AWDHLxzuB8UeixeFmiFNsms6
         I/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467514; x=1740072314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NC0gjVnxt4O15p2NxkemDQxdl3X7+EfnLKcG4TwVy48=;
        b=pcS36AWpb8nq58Jzvcz0x7zI5bPYTJlgUQ5+EXBAfS0S3jNzYjT8/MesWNErVD4Lwl
         ZacrTZsqmwHRx2uODQ2ymcwElqdZ0mBcjeXSb/FVgehl3ZuejpPHFkvrUK0yPJ7BnuPC
         O4f45sXgGojI3cyIevffWz3oeNNEf19QO3hqeM/ObyNA1xARxsz7qG3XGHF+yRR1r3hk
         FCGJj79Dh1Z+TJYsfkvt03kEWxAc37C20JjTN7DwQL90i5ADaP4lxND6nRYiVqIstVCO
         1IOmGhIBRfS1TOaj57osCnHjbV41HkOsjh9+FXhoD4MAH3wJ6MYVjhTrWO6qQdG7e4nu
         ZElQ==
X-Gm-Message-State: AOJu0YxzpKhC0H3wsFzS127ld+131eW+dd4vEN+3si32qG0or0Llg13+
	A5hccxYplOeTK/DcLfAdnA/D9Xq2Oq7XBM3QAM51TAC63DumGFaRHqMEsw==
X-Gm-Gg: ASbGncsnWpsILbKd+jRgkWpU+u40htG9mkvz4XtwBks0ZZFQXs1O8cP5eafXfbjV2yW
	tgBfKN7OX1ziFO1e8US3Lj/ebuw0PJ/mPRnGGPGmZcn51eUG3l+VbtB6bKxCha/gSZ3Cg/APIAO
	x+ieiJmM88pRmc8Otr+IWzAf+7cQp9UqnD5A4EDFJc0NNeyPYDFbqAJv00BBg2KU0udrpNo8GOm
	KLtAB3GufZwIqJTn3laL1abxA9bhPisCsqUCHkUYQ+aBAnLWz7Bk7ztgPkCa9cB/7bnp+ZyQFRz
	eawwtSeB9UztnWRorRojy4xdVpaGFYgiZ1g=
X-Google-Smtp-Source: AGHT+IHMPb5bBBC/1QDSYybmG+VaVkuaJ/TpwRYu/tD+Ot2X4QRdZ62tgboTYHD4NCXnaisKyPW16g==
X-Received: by 2002:a4a:e849:0:b0:5fa:61a7:16b8 with SMTP id 006d021491bc7-5fcb08fb8e1mr2213914eaf.2.1739467514552;
        Thu, 13 Feb 2025 09:25:14 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:2d58:1e06:61bd:218e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb155b77dsm680358eaf.0.2025.02.13.09.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:25:14 -0800 (PST)
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
Subject: [PATCH V2 0/2] Add Clock and Reset for TCON LCD
Date: Thu, 13 Feb 2025 11:22:46 -0600
Message-ID: <20250213172248.158447-1-macroalpha82@gmail.com>
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

Note that while the clock is exposed on the T507, H616, and H700 the
H616 does not expose the LCD controller that requires these clocks.

https://lore.kernel.org/linux-sunxi/67acd970.050a0220.1eb03a.101e@mx.google.com/

Changes since V1:
 - Updated commit message to note that the H616 has this clock, but not
   the LCD controller that uses this clock.

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

