Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3BB223DC5
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Apr 2025 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745402813; cv=none; b=sWfQc0/B34Wsi2+XXoyTXeM0KNUHKzJtP9W6Wz3TWrQbfbLz1e5CbYaxEnOHog2d9pRzcEViat52PK5tL5YpmFRhYR5qYqXYc/0BGWl5t7r3uj10Yv69X9SGVzWmxn9wRCI7aY00LMqVVbmx1sVOEP+sXlkEqwkwa8aCp+k6MA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745402813; c=relaxed/simple;
	bh=p1aeHbezR6P+B0RDIv5XMNvfkOFMi7yR6BnbDSgQIIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpV5CSKPOA8i8IF0olkZrILDBvcVdzXtgFFCvaAqEmtNQ9iai6PVeLe0ymxKwJ97/CeaIs3xNcQ6LTsZBDDv/Qb1epD5V6JPcE7dfnCDDHBiGtZ0E8fkp2fHxRzf4iPFRZYgXJs9xnHTeqhvOQT5cKkWxeByc6kmsgg1mDYC1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIYzcuEL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIYzcuEL"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso51049235e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Apr 2025 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745402810; x=1746007610; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yLF36sbTYK0KIWRbMmjLucJkeA+0T4TK0wNGl/x6x44=;
        b=NIYzcuELcCsnSw1xs6+NfKFtyNKRKKDmFfSGMd4yfT+xQhshcbNBoNlM9LuMXnth/q
         3SE3RZbbXxL6Xhf49GBHsm6efEdBpbAme2E6WLqUgMXQheEYDY0KJTNmpCb9r8QCsj9/
         +UxVt/sxeafzDXvj0Ub7jyg3Ur6Er8Kt6MB5tehD+jcpLlT3mVwE4is74olkX/H/OHXN
         qNj/3nDXJGVlovKiQdaASwkvSAPPovOICAeA/bp9OwloyKxK9Mh/SOGn3VBK4r/jqgDT
         Q1OZUsrQwFQ65LQc06o3NVcFUl110Nvn4bjXgHd0efsWcmOS2CO1cvZSyo8zORIpTg1D
         hPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745402810; x=1746007610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLF36sbTYK0KIWRbMmjLucJkeA+0T4TK0wNGl/x6x44=;
        b=hrTjP52597qIF+WKMjUUJJxtikl8yvTUYSomOLyYqmgsljznF4Wqw19GLo5gB0gHZB
         luts/7SgfwJTwuidqD6nCz4wYab24IY17+RZ1zsUP5BmFjMjz8X3RurKAHHJvRPIpkR0
         xnxNVSo2be2FwDwKd9JbvLOO6ocsx0lKMT5EvKv5G+tvRYOWZeNfc4hrG2uBF3luUCS4
         ZHx9Cqw3ZVNJ+wVou1chYyx1p24YFRlnkReGRi8sS3dO3yGPx+NI7l5uoe/hVwuTP41T
         Jfm8drqh69ZBtLkhd7GPMZpz4iI2j+z/7wl3XUg6ZWRIua2spVwUUnqy8rXN6A7YmCf5
         wtBA==
X-Forwarded-Encrypted: i=1; AJvYcCWRZe/zSfJMqGstRqjg72vx6Wbs1nTUrNxkdv/RFcUSuYMBNaQQR9FyTjbQJ28KKjpgQBU901L/RoNZWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyL1a5JcMYK+GyzChVmi+CxFQdU+dp4NZHQVHYMLyyq6/i6bIIW
	Z8RD7nMOixsYtTOkL8X7RdC+22WQSiTFsQdmC6TfkdinVWk32o+w
X-Gm-Gg: ASbGncsq7zjZbvSiwH2PTpWpKRaGmRZ7Psf5zFmYswntdqQMCGEA5m1E5G76uV8vtpc
	HKJB4q0ndxHI65II9N7dZa65YgvxNWBjw+aPiVfvtZumOjMf1/5DZWSz5AD9AUMcnPqM9/BESYx
	mPmLVmVD11Ldd1eTOwT7Mq+OMJTtgHvPe/IKbSIEk3ItEpYoCoYS8bPaDv0bwcEVgS4/ZfC916b
	0tcm79a1NBn8UaJ8IjDu6pfcUXJ5NH5CuXeT+1/fQqA42GEdciJXgZCVuF2DQpxG+R2CMJOEfzS
	+ROtGXuk7rVMG4yyfrN2h6F7U80fMJKW8UKqcl0+rQ==
X-Google-Smtp-Source: AGHT+IHWK0WshXlOs5OraQgDN/FsgzhL7hkkmTvNLw7hrCUa5cxOfc9S10EHvHC0RFX+JdX2CVNVXQ==
X-Received: by 2002:a05:600c:3c91:b0:43c:f00b:d581 with SMTP id 5b1f17b1804b1-4406ac0fc21mr156671605e9.29.1745402809826;
        Wed, 23 Apr 2025 03:06:49 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39efa43bef1sm17924994f8f.49.2025.04.23.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:06:49 -0700 (PDT)
Date: Wed, 23 Apr 2025 12:06:46 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Yixun Lan <dlan@gentoo.org>,
	Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH net-next] net: stmmac: sun8i: drop unneeded default
 syscon value
Message-ID: <aAi7tq-otdhJRpTy@Red>
References: <20250423095222.1517507-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423095222.1517507-1-andre.przywara@arm.com>

Le Wed, Apr 23, 2025 at 10:52:22AM +0100, Andre Przywara a écrit :
> For some odd reason we are very picky about the value of the EMAC clock
> register from the syscon block, insisting on a certain reset value and
> only doing read-modify-write operations on that register, even though we
> pretty much know the register layout.
> This already led to a basically redundant variant entry for the H6, which
> only differs by that value. We will have the same situation with the new
> A523 SoC, which again is compatible to the A64, but has a different syscon
> reset value.
> 
> Drop any assumptions about that value, and set or clear the bits that we
> want to program, from scratch (starting with a value of 0). For the
> remove() implementation, we just turn on the POWERDOWN bit, and deselect
> the internal PHY, which mimics the existing code.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
> 
> if anyone can shed some light on why we had this value and its handling
> in the first place, I would be grateful. I don't really get its purpose,
> and especially the warning message about the reset value seems odd.
> I briefly tested this on A523, H3, H6, but would be glad to see more
> testing on this.
> 

Hello

The origin is me, when doing initial sun8i-emac I feared to miss something and so added some strict tests on its value.
Another goal was to detect half init from firmware/bootloader.

But I agree it is now useless.

I will send this patch on all my CI boards, so you will have extra test.

Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
Regards
