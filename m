Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE722C82
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Jan 2022 15:58:51 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id s13so27088492ejy.3
        for <linux-sunxi@lists.linux.dev>; Sat, 29 Jan 2022 07:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkL3yeWI65aNqv0mFW7wisjkbuVajidj9gNJJdccjVQ=;
        b=FwESwKhxufFbM4PtpzgcWWyiWQplBUN1tIUOlWKoaQhhPu5tzZj7Etv2vX/ld9AJqA
         Fchv7nf6BloMAMD2TSgAWfsIeOjNzzdxrQgTkO5CKE/ytEhalDpsY8b9UTM/ryTDuRk6
         KgbXv9OwFfrGe/GZ2qIURGmGP29ByEiXPg/vGnzvWCt42yj9m8xNZNaCKb5Q8m0UOxWj
         Qk+nS0mia/M6pEk6Re+x+MMAPHGtzuGqwrdxILJ8wpqG+JAJobzV3ZyR70AXFnhxzCx2
         /PIIcAXesPnIXP4LqBrSgiCEGVQU1qYbkmdbW/hwIuWGltpp0K+ngtPc5qNSzTAIp8uj
         xP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkL3yeWI65aNqv0mFW7wisjkbuVajidj9gNJJdccjVQ=;
        b=crszDgnMT0i0eLWEgpDMzu7A2RU2UA7bfloLIQIpwRwrsHklMC6mjBNZWFi4qgo2fT
         vp1M8A4jL9FY1E0yKq1MPdsswm57b1sHElkzet61LVM9r8xP+Ht1HnQUhEiKBQ+u5l4i
         obyL+JR3zTEGFdFx67Smre3giyZbvsBEkIV/f/iOmsK64THlq0qQffX9cKArxOmBx3Vi
         oWCfiynMTBwSzOKqKrsAqwcqjZN3HMe6gNUWWca90+mf213pS3weYPUqsvErD1OwbB5a
         hGiFeMNw0m/HkybpBVTBH8+OSUsH9gmzq/zyZqgeph7mOiyq3ryljr4XBiSi7VWc5GJq
         OSGg==
X-Gm-Message-State: AOAM530iWov4jbrgZgi83pgG6g+2ydvQr9q2HLjr7NBvTADEvn23otn6
	wmqvKhcNpXEdDlRnzb91uf0=
X-Google-Smtp-Source: ABdhPJz3Nj16yW/cpFgnH/+wOhruZz3BtOrNXbh7pkcJzJVtQhIqWzLHSqUFD1tIRx5HRPO5aANsHQ==
X-Received: by 2002:a17:906:a282:: with SMTP id i2mr10911715ejz.724.1643471929418;
        Sat, 29 Jan 2022 07:58:49 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id u17sm11164935ejb.31.2022.01.29.07.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 07:58:49 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] sunxi: Fix two H616 DRAM bugs
Date: Sat, 29 Jan 2022 16:58:41 +0100
Message-Id: <20220129155843.111741-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At closer inspection of H616 DRAM code I found two issues:
1. ODT is never configured due to missing CONFIG_ prefix in check
2. Dual rank read calibration never exits calibration mode

Only first issue is important to fix for currently supported boards.
Fixing second one is future proofing.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (2):
  sunxi: fix H616 DRAM ODT support
  sunxi: Fix H616 DRAM read calibration for dual rank

 arch/arm/mach-sunxi/dram_sun50i_h616.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.35.0

