Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DE945FFD7
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830507; cv=none; b=IoDdzUwb+0pndfe17096dJkEoYo0PRYgd4D5GAcBbU6CNrsgBH1nJm4JXxOvrkZ3MJMoATLzqSqIrxOBsQ6rcGa+uLY+Jw7JeKDTdwlvWkVWov09hYZedkzLb1RPQMriucshGVlOogsePHe+Ar9EnAXUXMf2Y05lks2Ltyz4P9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830507; c=relaxed/simple;
	bh=OJr4F+tRV0On7Irv/rawfuCiJMAnPUX7BfkuP7XFgsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nCWJeyvHXBENVyYbu/K1QEeehAY2XiIwgRETV4s+X1D97U22uDJyvkhkh8Bk7+RYqRVpi3Kd/qK2YPKbbYU/2Sam1LAhtTKaGBTL/GwY9j+dD4UhxKbl4my9BFnmbRCEkQUVDfFijpKuwEl9/MzPacnNGfDarerdMTvIJwv7jG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpxOPLS3; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpxOPLS3"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-988d33f8fc1so1112687241.0
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 11:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830505; x=1792435305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GtUsq1L4Qu4E3puscbHWcsTT+wvRggcMU4K+GsQC9fU=;
        b=qpxOPLS3nHDtVjrLOZF0UTXNLvyDowXizhcWqFtlwnXIq/L4LkkZn6W++fO0o/Ei/o
         QAcwxxao1UuXNY+VEXxw4UF3lWNSk8b2nZtjIDmiqOwhsngpH2Dbg3gWREIjawTU9FhU
         pabEgvIt1jSm4N8KBrLz9vaB7dclT+jFCe8d4nMuD3Z+cl+C5FPV7e6rJdPfNY1Nx1u4
         zv9k2JPRvqCSDqxJfwIQmkFaUa4tISl/dLulJp8Vjbbsut2vXNy/7nwDa1Qo3njKwKl1
         Zr4+Wlfxr/GxE14GUjkhXyhkVH1afJGENxrMR+b1YjMlx7Oo8X6c0EWtPwWpOQ3hfkFT
         l+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830505; x=1792435305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GtUsq1L4Qu4E3puscbHWcsTT+wvRggcMU4K+GsQC9fU=;
        b=ewVRdXy1W3R55zs4w33o7wZLNIBU/gwPP1EQ/2k4RVcgHIFV0h8Ut25cP16l809Flk
         LTp2QfTXyz563Whv30yA8/tVLnULsJl4g9UHXc5zjzDER/iP8/s40RH0l6d/8Rz7By7W
         5V6weOaL7fn3EDeuH2sq3jWEGnr/kYXKKWWGGEdjAoe+TNhSE4lgxsZFNJhQoa4Zfm+u
         iVaeea9qvxd/Pr9itPF/t3H62Zkv6lx2AUDSnQ8+mW/TIpoJVP+6+T10JJ2CaVGmwAVJ
         ExdU60W8RrwgI+Wii4Bnz3TLCn/M/DQYxY5gocy/7c51VrptxPM0mHP3b8qECZvjJw2s
         hOKw==
X-Forwarded-Encrypted: i=1; AKwUvBwl7N/58iyZWz4txVlzAhlm6+0kTXVwIXy8BSWXY8eyYCHXTSgajHLI9bVZFj4jKADjzTMGZxvH2w2YPw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJVdxpBDPiTFK0cclsIOJOANDdHhbbUOD/mo3zmkFvROxj/yJ0w
	ad/bcfLHnVXGXNXXSaPxKng0/iowK+yC4iCl/zu5BZllKdNkAEKRr+HmKzM/cJiY2zQ=
X-Gm-Gg: AYBFou3gt6sfTNADpICQzkwg6blpCem6pIKtZuZU8bN8Iqz1ZYLDkfelpLdaNdprLhy
	rrFVfKTrU+8h4eToyUF5NYXR6jyLw/bVawxW13f7GdU0YyhT9wZBLcM/DRlzy8z0VJwGYNB35XX
	LJpSYXtH7v+Un7g7b5WJ7MAZKKx4TJiNkD8G2262LAdgBf0MDgMrZEoclPew7FmUS/ekmgJo1KO
	09qtZ0zgd5bxl5avrU4taPXpRVeIAAYudOba5WmV4/B/ddbkul7P+DuvNHBLuLCYBoMG1pv8cFJ
	d/EuSqsxigfwAYMLZ9tbOwSnLRRunrewdPjhoBFv7YD+Z3UOszHFRee6Lee2cz8oxbQGmfnGrEm
	5ospih4rGEk8boqxNPlrS4hBOMwVhNYsatM9MWiu5wQaAuZ6src8i7ZbwrLRkolL+03HCN02LzW
	xbkP3HhCOCRXJxrZuKZeHPe4Wvakiui2kwEOhAKcYdMi6cLzFcQuEDRpeJE59dDm16+O9P8Vjqr
	OnWUYIm3x3k2UW64ir+fOe9fTFHUg2rb2s1OuPc2FSXQdfDRrZK0eGQjNBCPFTqIGrZpsxVzZS/
	X0ng0cMtsAPShIjlMw==
X-Received: by 2002:a05:6102:80a3:b0:7a8:d959:bd76 with SMTP id ada2fe7eead31-7cb37405c7amr3420126137.33.1791830505277;
        Mon, 12 Oct 2026 11:41:45 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f230b8sm6830180241.8.2026.10.12.11.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:41:44 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: sunxi: A733: use the two-bit I/O voltage fields
Date: Mon, 12 Oct 2026 15:41:27 -0300
Message-ID: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this follows my question in [1]. Andre asked why not extend the A733 I/O
bias code to two bits instead of switching it off, so patch 1 does that
for the main PIO and patch 2 gives the A733-R its own descriptor, as it
cannot share the A523-R encoding.

I have not seen the board fail with the current code, and no A733 board
DT upstream uses these supplies yet. What I have is the old and the new
helper, copied from the driver, run on the host with register values
read (read-only) from a Cubie A7Z, silicon revision B:

  PIO SEL 0x01155550: a PJ request at 1.8 V gives 0x01155750 with the
  old code (PE goes from automatic to fixed 1.8 V), unchanged with the
  new one.

  R-PIO SEL 0x000aaaaa: a PL request at 3.3 V gives 0x000aaaab with the
  old code (fixed 1.8 V), plus a read-modify-write of +0x344 that the
  manual does not list. The new code leaves both alone.

With both patches the kernel boots on the A7Z (RAM boot of an rc6-based
kernel): UART0 and MMC0 work and the voltage selection registers are
unchanged.

PF and PI are not programmed, and neither is any silicon revision other
than B, as reported by SMCCC. The A523 variants behave as before.

I found nothing to change in the DT binding: the a733-r compatible has
no a523-r fallback and the schema checks pass for both controllers.
Andre, if you meant something else there, please tell me.

[1] https://lore.kernel.org/r/20261008194719.328146-1-vinicius.eduardo.pedrosa@gmail.com

Vinicius Pedrosa (2):
  pinctrl: sunxi: a733: program the two-bit I/O voltage fields
  pinctrl: sunxi: a733-r: use the A733 I/O voltage fields

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 26 ++++++++-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   | 15 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 57 +++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  6 ++
 4 files changed, 101 insertions(+), 3 deletions(-)


base-commit: bdacd2542f3c1b2b411fa86ee1f39de19cce6562
-- 
2.43.0

