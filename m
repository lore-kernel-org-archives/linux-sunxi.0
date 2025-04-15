Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749661EF380
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Apr 2025 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725373; cv=none; b=H8j5RTYQZ3kqatj7Sn2N7YTv6bUOsbdhNV4jprt/gK3bt3Gc5oJ6BE+XsmvCtlp9f+GKbeIjdyGKy3TCBVUZ+VWEOaLJUAhx0nrdZLaMzXPEwkwkwSeq+eB62AyqqQs3WO2DRHdUA2toNySjO7Cb3QBD7J3n2z4/LoL846ITjYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725373; c=relaxed/simple;
	bh=cAwldG+WfTv4qB+i7KsZorXEPkOdDQ+GoiASy+G6LZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyJ/+9mFwc889vZLEa0s1/xIdjLcpDkaqheibSeNBbXzd+8gwK32c2Y6qvbdQzhH4LPp/nsfWQpXiT1REHvctWHjs/OUwSKx+oXZPxWgYjSaxzXjZuKiBLvmqNCRLFBwJ3vjdSwCyiEC5Uy/9Ml9fiX/0u0xT3y37a+cqQkc6DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC3+PJFc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC3+PJFc"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso7276388f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Apr 2025 06:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744725370; x=1745330170; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f7Ug76I8PBqsVyX7451rWvT3DCckR1pFD90rVI4kapk=;
        b=AC3+PJFcIu8l+tbGWj8M3AaAx1IMKiQOLaU4mBW4XsOpg4taB/HdnCwjj60T+nZyQe
         a7ubsStK/7+lbcpOvq8e2JHtN8U89LAbcaLpJs5hAUNWBy8WlvIVb+VTvQPS+0d4QHzK
         gDq1RmIEkgeIFfXLeb2QGDIqmxsAY+gCpvIGSFfJrVnHrP8GD7XSTSrNaQLC5WjMlPML
         ZkmbpUlCWPwW3P+yH8ps/Xt7h8wJCX8PBp5PUX/jXMc4qol/eiJB0ZNuh69yQxepsTWr
         GxVRbyxY8i5+odU61pijppOYlmIUKt43IpTypSrQZiPxx7YUnoCl30QxVEBcvYl4Vl1w
         c10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725370; x=1745330170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7Ug76I8PBqsVyX7451rWvT3DCckR1pFD90rVI4kapk=;
        b=cZOQYUpeNdLtriymi4esW/qn7RxjaUP5IFES1dVWKyelvi4ZgF8wuG4aNC+RUTa5Uq
         WDfy28bidKwkTb80Z0eiUA4hsNrYkG278o0tmV0HuSTNH3xMvRwMS7tJseT3F3VQ3R3s
         9jO6IUVdICguVd2KXZtpEaub5zQw2ffamQk26pHFNJCzcchAiKUsUCwuDWgMouBC/0Ez
         wnvsLDdDiXkf/1Kxw9/HUaS9qrOlAhkQ7OVji0VzdLNXk1/mwbtgZoHr1i/FsEytaacR
         ny6R0C5J+dpdlP3Wvp3BXiNsF9YmTPYLX4tubEnP2PVPCvIyl7wbrHZankYdElhFXi+w
         vFrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzOhE6bZ4nDAnOJjvErZFMIxCimQnelI+yK60WGyqiN4gafFjEH/OzUBgX31Z+3ORGAZspy/8XJAih3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEkkRvKwBlhj5Vl3XY4zAVjxWVdIahdqQ4DRnFWR3a5JotH2GA
	wZZpQGEYK/EckLFVnGM85YItevd9+oUOcxhYCupYpd+DAvMvICH6
X-Gm-Gg: ASbGnct74Dg1nTkiJKMsRPKVuQHQh5OzeMwQPRdhfuKayPSAo5tB9Xxmk7lWh0yx16h
	JvsQik33ZlLtH5vgUd+E6t/U5X+MyiHAJPOKknOtcJ4nIRns1J1uS7nGD9G/HpsacoLBDdy7IXy
	aVl/3WcQNPMTHcRKQIxMjKWlYu7k/kV8C/S2Xf7twaJSGTJb2wekliowVVklWtA3jTNQiCEFMNb
	XBmqbWFZpsl9eNW2tY33WTZAlR4SZF8kiLoC0wMT/c8WZQC+HSVuTOHjESjDKwtTeaGC5UoApVo
	gHTh2aM0JEsutr4/kcP9PYkqczuZBal4L8Wn1QY2OA==
X-Google-Smtp-Source: AGHT+IEUc51u2H2A2sXDUuHdbW0oUHYeFA2HCqNohoAXTGQXycwn5Mca0dijghzNDofByf9HiAEEYQ==
X-Received: by 2002:a05:6000:381:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39ea521206bmr13186409f8f.31.1744725369575;
        Tue, 15 Apr 2025 06:56:09 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39eaf445515sm13993745f8f.89.2025.04.15.06.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:56:09 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:56:07 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH net-next] net: stmmac: sun8i: use stmmac_pltfr_probe()
Message-ID: <Z_5ld6D1Yyo7Ysur@Red>
References: <E1u4dKb-000dV7-3B@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1u4dKb-000dV7-3B@rmk-PC.armlinux.org.uk>

Le Tue, Apr 15, 2025 at 11:15:53AM +0100, Russell King (Oracle) a écrit :
> Using stmmac_pltfr_probe() simplifies the probe function. This will not
> only call plat_dat->init (sun8i_dwmac_init), but also plat_dat->exit
> (sun8i_dwmac_exit) appropriately if stmmac_dvr_probe() fails. This
> results in an overall simplification of the glue driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 

Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-on: sun50i-h6-pine-h64
Tested-on: sun8i-a83t-bananapi-m3

Thanks
