Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83966214805
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 16:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070384; cv=none; b=amSBIdmD4YafYDqpuOCxmLuUH6XKHSvCc4LBcsAkszTVd8WlvL8YtzBKRqdQXZboxohEtynZ/TBxs13p2L/LAXMiLsAjwaP4hxiVzAKzpEKWeWSc3BbmQ0ywlL6HixkYYzLBBZ0k3UxQFuGL32BMBWBFW9qaO30R3XiJZTAwGPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070384; c=relaxed/simple;
	bh=hDEFixl+l9nMHlgVrvE8KUVYJ48ccM0BlgIx4gFCi2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZSesDWtywIzz/+65U1aVAxjzfpt5ZusZtGy6dBH9SLud14ncTL770tBNjQcqifap+q/a92nGFmYhQY+BEYwLiceqqnakx8T+6HCBZHh/hefrB9On71AbcPZTCfWTnOwXg+yfZ67P3vrsvOpgGNwY6qU3VnPOSUbfewKdqMrjrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/z3rKcs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/z3rKcs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dd9b3419cso635688f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 08:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740070381; x=1740675181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDEFixl+l9nMHlgVrvE8KUVYJ48ccM0BlgIx4gFCi2U=;
        b=F/z3rKcsFhobcKWxG/LNaoEk9QihNCBtBLHyESxOhGJcgwZrsijnBRwKCGngb0bVm6
         ymHQ3EDRSars2JF8mtVz3aPPQzTN1o26aIWh2Luuop81Bey8eHXo/HbOMkwYajYegS+J
         vxGfIq6Zi19NnNlCqsH2HKwOP1zTMNgQYsxjXnRF26slRXTHsFeyaZHhV4qHWw3e6KzS
         AM9Ndqez8Jbnh+U+hXtMfXiZ8w/ei7Syz8mvG/kaTZ1883SYH2cOM7MtSGcdR+imXfMv
         Bh1YeIlAWW5NRndM3GSKscA0Cn50O/vafr2ti24TcJcnmWZFUwAzQSpsJgQJDTQylkHe
         q+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070381; x=1740675181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDEFixl+l9nMHlgVrvE8KUVYJ48ccM0BlgIx4gFCi2U=;
        b=pmlkrLtg+DtalxQSfpPvL81tMl+VG5N+wgXPV7nXgO/vNfYNTKhE7CP2yrg3DNww8S
         q98UiyYcMserOkirGylDXo4+NxZeyga1BtXYDquqPgELkCrawE877o+hIj1y1z/D8Bxg
         6PkrgsywcsrLFcTxaQIWLfntikyMS5cIvdp6qIEGryCXr2IB+L1n3NE9xVZ477G0a2Mf
         5dGUC8RXuvHK9hBByBBH+UU9t+Lz6ZZvpv7xd1ieUUiRwHSnLQg3ByuuFuCRwCv1Idv5
         m3Q3x/le+MTr7VYP7ZR9oWdASNOVobpO3Hr4hW1F3k03zelsCa/LRXGxXcb67Dako9x1
         MD0w==
X-Gm-Message-State: AOJu0YxM5D4Hajng3xdnTRGL2srTBP62mYEtg3eOf4hF1XP4LQdvLYon
	Uav775zwd4qLsnWX+3hIj/aRFTPVtMfod5C1SKSyAyH6f2RLQHJOWfu9KRfThzE=
X-Gm-Gg: ASbGncsR9PAiMT3iO/iuREcDZX1pmFGiK9XiWmqgn3FMHH1A8l05BVEP+VFU7os7Ual
	laS70nds7YugcHQRkOxOxj0FhsWtK1//TrOQf1eWMNwZY4tCVZYrS6yyxcae4eFDlG3RKyQ+AUa
	3FKHGmiiTl/juKDNAPWDx9NmryUmt3bzg65HQiIfLOWzUmAumFZg+ZdPbu0I+HCTcEDNy7TWrHf
	TTk6aAKtGvtp9JW/l+nQgi03IWxdOTKcoJMZqE4bR6zBCAot9oPFYC/k0aqe5EX8F8KwTTyqv6Z
	zYOPsI2yoILOA4jRbWkH50pg4+pn5mlcodcCQRLVKCfrTTdxyY/lHDctYVJgRvrYu3w=
X-Google-Smtp-Source: AGHT+IF9R1J2b9pOHg2R8OpZtKAYl6/Xzs9od8AZO07R+//Ei/HImVgNSFfaHKn5WXnx0agt9g5MPg==
X-Received: by 2002:a05:6000:401f:b0:38f:3ee5:fd36 with SMTP id ffacd0b85a97d-38f65171413mr3374554f8f.53.1740070380661;
        Thu, 20 Feb 2025 08:53:00 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f0597sm20815789f8f.42.2025.02.20.08.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:53:00 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, samuel@sholland.org, wens@csie.org, sboyd@kernel.org,
 mturquette@baylibre.com, ryan@testtoast.com,
 Chris Morgan <macromorgan@hotmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH V2 2/2] clk: sunxi-ng: h616: Add clock/reset for LCD TCON
Date: Thu, 20 Feb 2025 17:52:59 +0100
Message-ID: <38669808.XM6RcZxFsP@jernej-laptop>
In-Reply-To: <20250213172248.158447-3-macroalpha82@gmail.com>
References:
 <20250213172248.158447-1-macroalpha82@gmail.com>
 <20250213172248.158447-3-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 13. februar 2025 ob 18:22:48 Srednjeevropski standardni =
=C4=8Das je Chris Morgan napisal(a):
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add the required clock and reset which is used for the LCD TCON. Please
> note that these clocks are exposed on the T507, H616, and H700; however
> the H616 does not expose an LCD controller for which these clocks are
> needed.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Actually, also LVDS reset is missing, but it can be introduced with follow
up patch.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


