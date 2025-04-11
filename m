Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908F22C80
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 16:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388124; cv=none; b=BSgKKKAPQJkqoDIGV4hg3mFvVF0+9NgBs9X9bDxDvXAa1G8lOYlKEs2YvW5uNDSNCY/p6njw2dqFk7e2okulNOCmEy93O8WAWKBIOAVafdQ9YkP39nq5D3GzNePG+c+neGrAnQX03xuQ0STCsf5HQbI+8p6+JZeEeG+E8mutDGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388124; c=relaxed/simple;
	bh=xSZagkeJUtCJLAzuHxb6u49WlBC5wou5l8GKco90FcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WyJ/7CtzB02Cw2S6arshw55fCzb6PEfTXHXwHFgJghjn1MoPwy+i1/lFNFJz39/W6+B3Q+DdEJ/BA3NInaSOLZIIxY3nmGPKDJimWCQ4kc8uKUq+q0/gLWeBCPew3z+TGdT/HPFe66nUGJ0kyYsZmWPxkevj0MxHT4YxWMshSYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBDEzyX9; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBDEzyX9"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso3970235a12.3
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744388121; x=1744992921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B82T6hTq1hpiLL619M0lvAUvNB79dDXvEfvWCAV78iU=;
        b=RBDEzyX9q3bLu/IXEUD4Q+OKzD1ijh5f7ajz2LdQt6Z9WEEf/PFXdNjRF3xMwvf6rI
         wiEjfUoLnpAMjFqInqpnUoghj9mNMhU+r6GemTfYpunDyUgLzOMZQr+bm2YUIqFUh19O
         No8qmxSgOX9Jwfp5IfDhzT6iwbv/Tv+hXSDa2Kne27UlTsJfg6gjcAiSsD6UTz8ZNvft
         7+ON/OLfby60pWo6tiBEIE3LBPLGuFBC29Y+Q9rlOpao3fxuCb2kiWTpToUqLkx/5FyF
         t/jADzjtwHbe3VXQR/YDBVOK+M/rMsd7ceSDISGOeuhWbdaKjPciINSi4qjlSDcf8AuT
         vjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744388121; x=1744992921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B82T6hTq1hpiLL619M0lvAUvNB79dDXvEfvWCAV78iU=;
        b=NumBjSBPYP9EIw6fScJCg4j/7TJyr18kunT6Zp2vPUOr5HNlQyB4Ln5p/MBhywItjV
         tka5linxdf5x9zj9ZrA6d6oF6qBVCXZrgxPNP8KrPTLTlnrbxJK2VHnaRPgAED32CeUo
         LcNxXA0Nfm9nJgUApIFrTCFxBfvJb+TUEh9wcCwpbWWuacehxpfboTMNZ39DPtl3RWAZ
         IrCbh4PBjt6sASlqN+UbcJAZ8C48eN5k20xc3oZgBiFXZXjA+TYhuR3/2cqrLIYh/r6E
         YB6skMigT3ZTDwK3R5Mih4i+VR0VurkRZhp+tS5fuVV+mlSOfHPVKGeLNMI8Os894vVJ
         8JfA==
X-Forwarded-Encrypted: i=1; AJvYcCXx/TcgIrJ8FTzt4YnNdKzFjEEZniqkalhg7LXAGh9A5N5JR65NoTI0Bq14QOCEr/l48+TBINVaLUDr4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOyYJQt/NQ/3EcQvPZ6s8e4qOvo447ICdARdaRBV6H5ZzXmyc7
	Xhygxg4SmDz0E2SDXj/sXvGoiralGwAYBeOVEXQw/TOOGIcWdkcL
X-Gm-Gg: ASbGncsfaTMjyX/lIAMfTnomX6JjrEF6MDGHLlkuXZEBUOFNPBUeC9XnaXujjzQMnmb
	8Xd+oWf1metJkRSXJg1uzcCtUrCUb74i0MOG1qtI8moeXVcfy/bxEC6+SBAgqLrdE+F4PI+7onc
	3zISFKYFo+qzqAms+ZCwfOivqVEnoq6FgtqXnzdBTYIQN6CAcodqYMXsKXukwW0Ko4imKFA3twE
	b1WkswvHHCbB8vpftVAJRZfnU+HWzBaOOkEC6zSGeGp5bvfgFSOUbb+Q5LkifTvEwXfot5vKDyd
	p1zhIGI9xd2zXKBATXyoH/B4Eg3EIKQ6LeNq3ZfoO9l6K3wYSboSS8fAzA==
X-Google-Smtp-Source: AGHT+IHZJViaxeqVafycWAgWlTemVq3b4nQ8w/rJUTay+2pLVM9l8CR+QSyv/Be/fCnA5kzma/FppQ==
X-Received: by 2002:a05:6402:42c2:b0:5ed:17d9:91db with SMTP id 4fb4d7f45d1cf-5f36fbaaeeemr2725083a12.12.1744388120556;
        Fri, 11 Apr 2025 09:15:20 -0700 (PDT)
Received: from localhost.localdomain ([80.90.89.143])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f526da3sm1136246a12.67.2025.04.11.09.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:15:20 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: trini@konsulko.com,
	macromorgan@hotmail.com,
	uwu@icenowy.me,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/5] sunxi: h6/h616: consolidate DRAM code
Date: Fri, 11 Apr 2025 18:14:34 +0200
Message-ID: <20250411161439.4743-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on A523 support, it became obvious that newer sunxi DRAM
drivers are similar in many ways, so it makes sense to share some code
between them. Let's start with DRAM size and ranks detection. There were
many fixes for it in H616 driver, so make sense to unify code interface
and split out h616 part into separate file and reuse it for h6 too. This
will probably solve some DRAM size detection issues on h6 reported
through the years.

Patch 1 adds more error reporting in case rows or column size is not
correctly detected.

Patches 2-4 bring h6 code close enough to h616 so code sharing is
possible.

Patch 5 splits out h616 code and reuse it on h6.

Note I'm currently not able test the code, so if anyone else could do it
I would appreciate very much.

There are further possibilities regarding code sharing in the future,
like:
- memory controller is pretty similar for H6, H616 and A523
- unify config and parameters structures

Best regards,
Jernej

Jernej Skrabec (5):
  sunxi: h616: Panic if DRAM size is not detected
  sunxi: H6: Remove useless DRAM timings parameter
  sunxi: H6: DRAM: Constify function parameters
  sunxi: h6: dram: split dram_para struct
  sunxi: h6/h616: Reuse common DRAM infrastructure

 .../include/asm/arch-sunxi/dram_dw_helpers.h  |  22 +++
 .../include/asm/arch-sunxi/dram_sun50i_h6.h   |   9 +-
 arch/arm/mach-sunxi/Makefile                  |   4 +-
 arch/arm/mach-sunxi/dram_dw_helpers.c         | 160 ++++++++++++++++
 arch/arm/mach-sunxi/dram_sun50i_h6.c          | 180 +++++-------------
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 145 +-------------
 .../mach-sunxi/dram_timings/h6_ddr3_1333.c    |   2 +-
 arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c  |   2 +-
 8 files changed, 247 insertions(+), 277 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h
 create mode 100644 arch/arm/mach-sunxi/dram_dw_helpers.c

-- 
2.49.0

