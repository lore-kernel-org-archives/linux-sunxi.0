Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5188C439909
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Oct 2026 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627278; cv=none; b=lHzSxmIXQrM4G9K812oZ+v/R9uCPshXCGDZ3hfxU8tkHeL7S+PqaiTPgeOIRVoWkiSPhfy2FK+QNNN4nXFWSXohUdtHTxv2MONyMZUUidJvAAIJy909Y2nHVE9C+FlUHzLfYxkUxtUFJtunm569dCU+HS8mYq1oq/TA4mg6sa0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627278; c=relaxed/simple;
	bh=AuSrI/1XcdYrH7/21OOhHZlL43R1EquZmzSqr4kTbiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dt0u5aajgQGAgOaO6fs5YUhbMoqkvILTgWc977agBZd3d3zRCIIFUBvD2unybgWLdunKWq4yvYyMtvnzOcO9c/fPzp7SJcSNfy9x6bYN3P3ffoCth79VeHlrhu9i3KDZi5trELexJMc4sgMWgtlAXnH+riIIBuG2KspepQj9W8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHso27Ie; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHso27Ie"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5e507e778e4so170912e0c.1
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Oct 2026 03:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791627276; x=1792232076; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AuSrI/1XcdYrH7/21OOhHZlL43R1EquZmzSqr4kTbiw=;
        b=dHso27IeEb0PGg7a9hmOOAcrTXTch/SG0sBKlXeTLJFcfRp9ReK56lPfVJRqKP6P2d
         nnlpvyyoB/1HPW3kpc+v2lgsCEzA9ee21arD6g4/cSfO3dzTs4CdrDVdSmOmc0b6LIyE
         55ChDZjaPd1+KRe+cPjCbpzuAmFZgmOqMbVn7ce3mKBq84SI8Dm7vbBkoeVPQ0Mz6XJA
         qoBH114AcExW37aCf+h5WIB5St+ExmCy9/8X8GNAnWDz2U6bFYXgurvyQj6yT2i7Jsvu
         szewBfnJhowQm5pc04/lC+T6WIlkowUAUThhfFOC8TdLU2nmvZ8hqDWicmFfQ0pkxHVt
         qgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791627276; x=1792232076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AuSrI/1XcdYrH7/21OOhHZlL43R1EquZmzSqr4kTbiw=;
        b=HZDnR05K7Jida8FU28373PFbhXDDlXfz1b93WVvjYW27ortjsQeCVS6kuBghaThBqx
         JPXb/xdDpvLxAApjTNu0D/4QV92C6OEFoWNO9N/z64TX3yzdJDaZl0q/3mhw/cf45zd9
         ucC0QYfJsapvlPc0kqpPSKBbDPgZ60u3U14fJiqLx3BrbJmKzMUByd/tYqRlfrFqE3O9
         4GJEgQWQChtUEFRlrBGR8hgCR6cwaZlVkEgDcupq2JfiNbsG0TVc3Q0+xGCjM+QEonbe
         l1VDlX6snAqhW3Yk80E4KeInfjlAtyIojD5sI9C6sb+klxfSme0h+P7PgJFopuFhleZ2
         lrlQ==
X-Forwarded-Encrypted: i=1; AKwUvBymB2lubvslLNt15UnctdRnOK7pl+KCT7r8Weji/qarnmJKnAzNBdvr8a4f/WV0Y1lLafZv/Icq4QCovA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLjHtU21XSVwLspe1rChRKk08MsHIj2Maav4WRc349P1qzJhI8E
	ebV02X960w2fB+B3XvYb0u0eDsHl2aWpv+l82KmSPtOyMG45BsbYk0oA
X-Gm-Gg: AYBFou1619v2JeamFQAu3gjlaD1orUQaOXv8nQcyW0w4XQb2g4hVYuikPnAAzKQPf0B
	m1776bAn4aSS6qrcSOGUpAtAYYEZ2jIN8KoaK4lqI1Pz+/c2qlV0lgQ+cA/bxCrwEUNdzQNrlEo
	8B+AEjaSqTSIwXotKV3duwznMrvwa/qgzBB4vqyozjCy+MhILVjkEscPTVbdOtnePJgJ2IIYaXK
	KdVG4/6b6hS6ojAgkAkRteJvLw52VHXo4m4ZUGVJVBTYp3CapCLL47/K9SrGcuH02deD9P4Yhxj
	GRpqyzHDSV2QYuEkMl866Uk/uquDBl2JOoFIVTMOdzPR9k7KWDpPl4VLcK4JjwS4X0I/lkzFO7+
	4MPqpAEaZLaKjz/6K+c0qZj7rXdbh500Gz7hWnoaUT9AwkY0lVgmgB/V+ADYrHrh4J5fyp/R7G4
	N8N9gbgtFkwh2t9vEPHmBTecaKvPf9n03iJs0DBWi/+e97q2mVc4sTRc59Pnvk6xPWFckDjkONX
	t7aUMKxGto8m/zv+xd5n1MVYA5FuwpqHq9fiVlybUtIQm9KzShxYV72Hd1fD5shzWA/71UuzzH9
	3Gt4Tiyf
X-Received: by 2002:a05:6122:3c4e:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5e91f4ebf20mr1428237e0c.14.1791627275896;
        Sat, 10 Oct 2026 03:14:35 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91c841a45sm3662304e0c.2.2026.10.10.03.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:14:35 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Yixun Lan <dlan@gentoo.org>,
	u-boot@lists.u-boot-project.org,
	linux-sunxi@lists.linux.dev,
	Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 0/9] sunxi: Add support for A733 SoC
Date: Sat, 10 Oct 2026 07:14:17 -0300
Message-ID: <20261010101417.55385-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <277fbb28e539eb61d492b3d1c79db12d5eba6078.camel@d-silva.org>
References: <20260113-01-a733-soc-support-v3-0-f19dcd098f60@gentoo.org> <20261009120356.194364-1-vinicius.eduardo.pedrosa@gmail.com> <3f57db40-a604-4800-b15f-2d159a3a5ca7@arm.com> <277fbb28e539eb61d492b3d1c79db12d5eba6078.camel@d-silva.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Alastair,

On 10/10/26, Alastair D'Silva wrote:
> I would be very grateful to have someone help ensure the PMU firmware
> can successfully bring up a DDR4 board.

I have a Radxa Cubie A7Z (A733, 1 GiB LPDDR4, Nanya NT6AN256T32AV-J2),
which I assume is the DDR4 case you mean. I can test your clean-room
firmware on it when it's out, RAM only through FEL and serial, and send
you the logs.

I've analyzed the vendor boot0 DRAM code, so I'll keep out of your
firmware and only help with testing.

Thanks,
Vinicius
