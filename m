Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F0938DD8
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737200751; cv=none; b=U8JGf3jRl700g41uYH6muDyPXCT1fZBqsAh43cW4OrAcgvqf1//W/ZRxwImtOstyFxynO28Xfgr7bKxG6SXAjtB+/y8qWt7I/RDbe6wzm+Udb+ObHkSAigzWi63Ps73HSXkkp10/kiuxgxAL64OS4slOKjf+JDodqrhOhOeRvTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737200751; c=relaxed/simple;
	bh=f4siNjxgX/mbNjfLS/32dwy0S7rCc9EgFpXIlQwRUq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AyZrtJGkjORwjwRO1gXt22xqHJmyAcNq2iRJCf2genn5387Ydt4CpWxWnlr9BDma9+1e2ajf/LQ3bRgqebG/mLZRr6qy06P0+PT7GogXOxYZWaQ5bT49rFtRxIUv++Ym12QGV/pvW6MpLxsuqEcz2L3umtSxX1jED6+hdhFQBCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpdY9ekd; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpdY9ekd"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so5172381a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 03:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737200748; x=1737805548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4siNjxgX/mbNjfLS/32dwy0S7rCc9EgFpXIlQwRUq0=;
        b=DpdY9ekdA9z6DmPhegRhRcSJ/9xrsfixk5q8i5rX/OK0Hn4l2b4xYakFomGi0Tro7H
         4Tv4z8lUfKOw08aFowgPs3efyrzXHSXQ20c/G0H3pcPP+gNxR9YZei9rbBkZCtrb9hLc
         a4nUmbLsm++LixtejQpp/AfyNwmTrcUei63uphAmw2gLjt69B42LIU25v3Y+ldsw9lM/
         2LhlrIskH4Dya50xgisafIXfdn5pLSemOyNSz8E+3Vwv3AdVaNvkoexzNctyt4xcRteU
         wMzffHjXpH8pR6/ypzvMMDB8Lca7yYuxTurf4S5QBuH76KyB11Q9yuoLDI8R7YA2BRDv
         kkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737200748; x=1737805548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4siNjxgX/mbNjfLS/32dwy0S7rCc9EgFpXIlQwRUq0=;
        b=tl+A1NfdYe591mUo4wbnVj0bvlrneoPesP5qXxnAlvSs/wn5mQYWuwyHOdWeRpFDry
         rOFu/Kl3fkA01/j4gd3k47Zg6eBfn9SFXzWKawmmtrvq05WSAk7+r2jAO2yFrcxGIb3K
         6APWQC1YbYGz4q9an42G/pcE3TIPVNMsNIxxMvHQ09bSKO5YjIHSO3wNGo0ta54En9vB
         ASrV8SdmdUrOA9fpMzBvzHfNDHK0119V6qfL12Z/+4AVhUJOrwj5d4zOjCjTjcNfnDx0
         AOQL5lkqvNR32eMAjL9c2/T+wVBM+Z2Kp0JJaI6c8FFjb/9EmYwVE8nxzOoIRxmMtaub
         q+5A==
X-Forwarded-Encrypted: i=1; AJvYcCXmjNRT9II7/GlOI+AMThVwWZ4gQCYWaH26D16DVDjhWWInaAZYzy1TgAfhTGfh1cZYyOwkU71uvPZVIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZiCq0FuVU1QHUddmuHxSqOoOXmt0bULfpJEqNJ84uZM5F8zSR
	gTUy/w+eGqOJbYFjnqKxUM89g4CA3j64eScHOz0v8J2Qrs1wiMa1
X-Gm-Gg: ASbGncv0M/RTQvVAeoaB/2uDoMqfQPcbot8MJ34UJgty0g0rY/3nsTvPgEnZDvpBPWi
	3wopIhQJfSVxKjhGpx4DPBBNww5E7umE9P7nxYLv/hyS0vKnGyQiZzo8IbRTb0Zb069zdVMDatG
	DCVNOw0wzWFpN/lxTK57TQ+A/hZ07AkKXkXBhguKJgGKCV3NCSv7Q1kzjGX5mN//bTOH8XHoLUe
	Un4Wfr7Mb8LwCCpbH7miryYcShZRJZ5U8lTVx0ribnrqrNCiLOhdlxw2gH6ScAk47z7BQDB1Llt
	7MbFKW2DYpvyVZg=
X-Google-Smtp-Source: AGHT+IEc/dxl1rTjiPZX3AO03wqpI1sxEn2EWC5g3utoZzcrir3URb2QTl/gt3l1bSP0pp4nc7Kr4Q==
X-Received: by 2002:a17:907:1c2a:b0:aac:832:9bf7 with SMTP id a640c23a62f3a-ab38b27be47mr527318766b.24.1737200747437;
        Sat, 18 Jan 2025 03:45:47 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fce6c6sm326568166b.179.2025.01.18.03.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 03:45:47 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 04/14] watchdog: sunxi_wdt: Add support for Allwinner A523
Date: Sat, 18 Jan 2025 12:45:45 +0100
Message-ID: <2417745.NG923GbCHz@jernej-laptop>
In-Reply-To: <20241111013033.22793-5-andre.przywara@arm.com>
References:
 <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. november 2024 ob 02:30:23 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> The Allwinner A523 SoC comes with a watchdog very similar to the ones in
> the previous Allwinner SoCs, but oddly enough moves the first half of its
> registers up by one word. Since we have different offsets for these
> registers across the other SoCs as well, this can simply be modelled by
> just stating the new offsets in our per-SoC struct.
> The rest of the IP is the same as in the D1, although the A523 moves its
> watchdog to a separate MMIO frame, so it's not embedded in the timer
> anymore. The driver can be ignorant of this, because the DT will take
> care of this.
>=20
> Add a new struct for the A523, specifying the SoC-specific details, and
> tie the new DT compatible string to it.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


